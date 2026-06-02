import { useState, useRef, useCallback, useEffect } from 'react';
import { GoogleGenAI, LiveServerMessage, Modality } from '@google/genai';
import { supabase } from '@/lib/supabase';
import {
  facultySearchTool, principalTool, collegeSectionsTool, pastPrincipalsTool, achievementsTool,
  mainExamsTool, studyMaterialTool, practicalExamsTool, practicalStudentSearchTool,
  gallerySearchTool, galleryCategoriesTool, eventSearchTool, coursesSearchTool,
  meritListTool, knowledgeBaseTool, knowledgeItemsTool, materialsChatSearchTool, alertsChatSearchTool, sportsTool
} from '../services/lohiacollegeai';
import {
  searchFaculty, getPrincipalInfo, getCollegeSections, getAllPastPrincipals, getAllAchievements,
  searchMeritList, searchMainExams, searchStudyMaterial, searchPracticalExams,
  searchPracticalStudentsByName, searchGallery, getGalleryCategories, searchEvents,
  searchCourses, searchKnowledgeBase, searchKnowledgeItems, searchMaterialsChat, searchAlertsChat, searchSports
} from '../services/collegeDataService';

let cachedFingerprint: string | null = null;
const getFingerprint = async () => {
  if (cachedFingerprint) return cachedFingerprint;
  try {
    const fpPromise = await import('@fingerprintjs/fingerprintjs');
    const fp = await fpPromise.load();
    const result = await fp.get();
    cachedFingerprint = result.visitorId;
    return cachedFingerprint;
  } catch (e) {
    console.warn("Fingerprint failed, fallback to local ID", e);
    return 'fallback_id_123';
  }
};


// Utility to convert Float32Array (from getUserMedia) to Int16Array (for Gemini)
function floatTo16BitPCM(input: Float32Array): Int16Array {
  const output = new Int16Array(input.length);
  for (let i = 0; i < input.length; i++) {
    const s = Math.max(-1, Math.min(1, input[i]));
    output[i] = s < 0 ? s * 0x8000 : s * 0x7FFF;
  }
  return output;
}

// Utility to encode Int16Array to Base64
function bufferToBase64(buffer: Int16Array): string {
  let binary = '';
  const bytes = new Uint8Array(buffer.buffer);
  const len = bytes.byteLength;
  for (let i = 0; i < len; i++) {
    binary += String.fromCharCode(bytes[i]);
  }
  return btoa(binary);
}

// Utility to decode Base64 to Int16Array
function base64ToBuffer(base64: string): Int16Array {
  const binaryString = atob(base64);
  const len = binaryString.length;
  const bytes = new Uint8Array(len);
  for (let i = 0; i < len; i++) {
    bytes[i] = binaryString.charCodeAt(i);
  }
  return new Int16Array(bytes.buffer);
}

const DAILY_LIMIT = 40;
const LIVE_MODEL = process.env.NEXT_PUBLIC_GEMINI_LIVE_MODEL || "gemini-3.1-flash-live-preview";
const LIVE_VOICE = process.env.NEXT_PUBLIC_GEMINI_LIVE_VOICE || "Aoede";

export function useLiveAPI() {
  const [isConnected, setIsConnected] = useState(false);
  const [isSpeaking, setIsSpeaking] = useState(false);
  const [transcript, setTranscript] = useState('');
  const [error, setError] = useState<string | null>(null);

  const audioContextRef = useRef<AudioContext | null>(null);
  const streamRef = useRef<MediaStream | null>(null);
  const processorRef = useRef<any>(null);
  const sessionRef = useRef<any>(null); // To store the live session
  const liveConnectionOpenRef = useRef(false);

  const audioQueueRef = useRef<Int16Array[]>([]);
  const isPlayingRef = useRef(false);
  const nextPlayTimeRef = useRef(0);
  const activeSourceNodesRef = useRef<AudioBufferSourceNode[]>([]);

  const stopAllAudio = useCallback(() => {
    activeSourceNodesRef.current.forEach(node => {
      try {
        node.stop();
        node.disconnect();
      } catch (e) {
        // Source might have already finished
      }
    });
    activeSourceNodesRef.current = [];
    nextPlayTimeRef.current = 0;
    audioQueueRef.current = [];
    isPlayingRef.current = false;
    setIsSpeaking(false);
  }, []);

  const processAudioQueue = useCallback(() => {
    if (!audioContextRef.current) return;
    const ctx = audioContextRef.current;

    while (audioQueueRef.current.length > 0) {
      const pcm16 = audioQueueRef.current.shift()!;

      // Convert Int16 back to Float32 for Web Audio API playback
      const float32 = new Float32Array(pcm16.length);
      for (let i = 0; i < pcm16.length; i++) {
        float32[i] = pcm16[i] / 0x8000;
      }

      const buffer = ctx.createBuffer(1, float32.length, 24000); // Gemini output is 24kHz
      buffer.getChannelData(0).set(float32);

      const source = ctx.createBufferSource();
      source.buffer = buffer;
      source.connect(ctx.destination);

      // Improved Scheduling Logic:
      // 1. If we are starting fresh or lagged behind, start with a tiny 100ms lookahead
      // 2. Otherwise, chain it exactly after the previous buffer
      let startTime = nextPlayTimeRef.current;
      const now = ctx.currentTime;

      if (startTime < now) {
        // Either starting fresh or we lagged. Add 100ms buffer to prevent immediate stutter.
        startTime = now + 0.1;
      }

      source.start(startTime);
      nextPlayTimeRef.current = startTime + buffer.duration;

      activeSourceNodesRef.current.push(source);

      isPlayingRef.current = true;
      setIsSpeaking(true);

      source.onended = () => {
        // Remove from active nodes
        activeSourceNodesRef.current = activeSourceNodesRef.current.filter(n => n !== source);

        // When a buffer ends, check if there's more to play
        if (audioQueueRef.current.length === 0 && ctx.currentTime >= nextPlayTimeRef.current - 0.05) {
          isPlayingRef.current = false;
          setIsSpeaking(false);
        }
      };
    }
  }, []);

  // Removed processAudioQueueRef.current and useEffect for processAudioQueue
  // since we'll call it directly from onmessage.

  const [dailyLimitReached, setDailyLimitReached] = useState(false);
  const [questionsRemaining, setQuestionsRemaining] = useState(DAILY_LIMIT);
  const [timeUntilReset, setTimeUntilReset] = useState<string | null>(null);

  useEffect(() => {
    const checkLimit = async () => {
      try {
        const fpId = await getFingerprint();

        const { data, error } = await supabase
          .from('voice_limits')
          .select('question_count, limit_reached_at')
          .eq('fingerprint_id', fpId)
          .maybeSingle();

        const now = Date.now();
        const COOLDOWN_MS = 24 * 60 * 60 * 1000; // 24 hours

        if (data) {
          if (data.limit_reached_at) {
            const limitReachedTime = new Date(data.limit_reached_at).getTime();
            const timePassed = now - limitReachedTime;

            if (timePassed < COOLDOWN_MS) {
              setQuestionsRemaining(0);
              setDailyLimitReached(true);

              const diffMs = COOLDOWN_MS - timePassed;
              const hours = Math.floor(diffMs / (1000 * 60 * 60));
              const mins = Math.floor((diffMs % (1000 * 60 * 60)) / (1000 * 60));
              setTimeUntilReset(`${hours}h ${mins}m`);
            } else {
              // 24 hours have passed, reset in DB
              await supabase
                .from('voice_limits')
                .update({ question_count: 0, limit_reached_at: null })
                .eq('fingerprint_id', fpId);
              setQuestionsRemaining(DAILY_LIMIT);
              setDailyLimitReached(false);
              setTimeUntilReset(null);
            }
          } else {
            // Not limited yet
            setQuestionsRemaining(Math.max(0, DAILY_LIMIT - (data.question_count || 0)));
            setDailyLimitReached(false);
            setTimeUntilReset(null);
          }
        } else {
          // No record yet, create one
          await supabase
            .from('voice_limits')
            .insert({ fingerprint_id: fpId, question_count: 0, limit_reached_at: null });
          setQuestionsRemaining(DAILY_LIMIT);
          setDailyLimitReached(false);
          setTimeUntilReset(null);
        }
      } catch (e) {
        console.error("Supabase limit check error:", e);
      }
    };
    checkLimit();
    const interval = setInterval(checkLimit, 60000);
    return () => clearInterval(interval);
  }, []);

  function stopConnection(closeSession = true) {
    liveConnectionOpenRef.current = false;
    setIsConnected(false);
    setIsSpeaking(false);
    stopAllAudio();

    if (processorRef.current) {
      if (processorRef.current.port) {
        processorRef.current.port.onmessage = null;
      }
      processorRef.current.disconnect();
      processorRef.current = null;
    }
    if (streamRef.current) {
      streamRef.current.getTracks().forEach(track => track.stop());
      streamRef.current = null;
    }
    if (audioContextRef.current) {
      audioContextRef.current.close();
      audioContextRef.current = null;
    }

    if (closeSession && sessionRef.current) {
      sessionRef.current.then((session: any) => {
        if (typeof session.close === 'function') {
          session.close();
        }
      });
      sessionRef.current = null;
    }

    audioQueueRef.current = [];
  }

  const incrementUsage = useCallback(async () => {
    try {
      const fpId = await getFingerprint();

      const { data } = await supabase
        .from('voice_limits')
        .select('question_count, limit_reached_at')
        .eq('fingerprint_id', fpId)
        .maybeSingle();

      if (data && !data.limit_reached_at) {
        let newCount = (data.question_count || 0) + 1;
        let limitReachedAt = null;

        if (newCount >= DAILY_LIMIT) {
          limitReachedAt = new Date().toISOString();
          setDailyLimitReached(true);
          const COOLDOWN_MS = 24 * 60 * 60 * 1000;
          const hours = Math.floor(COOLDOWN_MS / (1000 * 60 * 60));
          const mins = Math.floor((COOLDOWN_MS % (1000 * 60 * 60)) / (1000 * 60));
          setTimeUntilReset(`${hours}h ${mins}m`);
          stopConnection();
        }

        await supabase
          .from('voice_limits')
          .update({ question_count: newCount, limit_reached_at: limitReachedAt })
          .eq('fingerprint_id', fpId);

        setQuestionsRemaining(Math.max(0, DAILY_LIMIT - newCount));
      }
    } catch (e) {
      console.error("Increment usage error:", e);
    }
  }, []);

  const startConnection = async () => {
    if (dailyLimitReached) {
      setError(`Daily limit of ${DAILY_LIMIT} questions reached.`);
      return;
    }
    try {
      setError(null);
      setTranscript('');

      const apiKey = process.env.NEXT_PUBLIC_LOHIA_COLLEGE_VOICE_KEY;
    if (!apiKey) {
      throw new Error("Live Voice chat requires a Google Gemini API Key. Please set NEXT_PUBLIC_LOHIA_COLLEGE_VOICE_KEY in your .env file.");
    }
      const ai = new GoogleGenAI({ apiKey });

      // Fetch dynamic college comprehensive context
      let contextInfo = "College Name: Lohia College.\\n";
      try {
        const res = await fetch('/api/chat/live-context');
        if (res.ok) {
          const data = await res.json();
          if (data.context) {
            contextInfo = data.context;
          }
        }
      } catch (err) {
        console.warn("Could not fetch full college context, using fallback...", err);
      }

      const dynamicSystemInstruction = `You are the Official Lohia College AI Assistant. You are a highly professional, intelligent, and helpful YOUNG INDIAN FEMALE representation of the college.
      
IDENTITY & PERSONA:
1. **Gender**: Strictly FEMALE. Use feminine grammar in Hindi/Hinglish (e.g., "bataungi", "kar sakti hoon").
2. **Tone**: Warm, welcoming, and academic yet approachable. Think of a senior counselor or a top-performing student leader.
3. **Language**: Greet in English. If the user speaks/asks in English, respond strictly and completely in English. If the user speaks in Hindi/Hinglish, respond in fluent Hinglish. Keep responses concise for voice interaction.
4. **Name Protocol**: ALWAYS pronounce "Prof." as "Professor". ALWAYS address EVERY person (faculty, principal, topper, alumni, or staff) with utmost respect by adding honorifics. In Hindi/Hinglish, ALWAYS add "Ji" after their name (e.g., "Amit Ji", "Dr. Sharma Ji") or use "Shri" / "Smt" before their name. For English, use "Mr.", "Ms.", "Dr.", or "Professor". NEVER take anyone's name plainly without an honorific.

MISSION:
- You provide EXACT and ACCURATE information about Lohia College history, faculty, exams, events, and academics.
- Pay EXTRA attention to the difference between departments with similar names (e.g., Zoology vs Sociology).
- When asked for faculty in a department, check EVERY name listed in that department in the knowledge base.
- Always provide the specific qualification (e.g., Ph.D., M.Sc.) if requested, as it is listed for each faculty member.
- You use the COMPREHENSIVE KNOWLEDGE BASE provided below as your absolute source of truth. Do not omit names listed there.

ADVANCED CAPABILITIES:
- **Search & Synthesis**: When asked about a department, list the faculty members one by one clearly.
- **Qualification Expert**: If asked "What is the qualification of [Name]?", look specifically for the "Qualification" field in the faculty data.
- **Principal & Past Principals**: You have a dedicated list of current and past principals. Use it to answer questions about college leadership heritage.
- **History Expert**: Be proud of the college's heritage. Use the foundation details, vision, and founder precisely.
- **Founder Truth (Mandatory)**: The founder of Lohia College is Seth Kanhiya Lal Lohia. If the user asks "who is the founder of Lohia College", "what is founder/father of Lohia College", "what is founded by Lohia College", or similar, answer only Seth Kanhiya Lal Lohia as the founder. Never say Seth Budhmal Lohia as the founder.
- **Toppers & Merit Expert (IMPORTANT)**: You have access to the college's Hall of Fame (merit list). First, look at the merit summary in the knowledge base to see the available year range (min year to max year) — DO NOT use any hardcoded year range like 1945 or 1984-1995! If user asks for toppers from a year that is NOT in the available range (or after max year OR no records found): in Hindi/Hinglish, say "Maaf kijiye, mere paas us saal ke records nahi hain. Humare paas abhi tak [minYear] se [maxYear] tak ke toppers ke records available hain. Aap in saal ke liye pooch sakte hain. Aapko is pareshani ke liye hum kshama chahte hain." If user says BSc, B.Sc, MSc, M.Sc, science, scinece, Physics, Chemistry, Botany, Zoology, Biology, Maths, or Mathematics, treat it as Science merit records. If user says BA, Arts, Hindi, English, History, Geography, Sociology, Political Science, Economics, Sanskrit, Urdu, Public Administration, Drawing, or Home Science, treat it as Arts merit records. If user says BCom, Commerce, Accounts, ABST, EAFM, BADM, Business, or Banking, treat it as Commerce merit records.
- **Sports Expert**: If user asks about football, kabaddi, volleyball, sports, medal, gold medalist, winner, or tournament, call 'search_sports'. If the exact word "gold" is not in the record but matching sport records exist, still speak the matching University Colour Holder or winning team records. If no year is given, give the matching sport records; if year is given, filter by that year.
- **Exam Schedule Clarifier (MANDATORY, MUST FOLLOW EXACTLY)**:
  - FIRST, BEFORE DOING ANYTHING ELSE (including calling search_main_exams), CAREFULLY check the user's query for ALL THREE REQUIRED DETAILS:
    1. Status: Collegiate OR Non-Collegiate
    2. Level: UG (Undergraduate, B.A./B.Sc./B.Com.) OR PG (Postgraduate, M.A./M.Sc./M.Com.)
    3. Semester: Which semester (1st, 2nd, 3rd, 4th, 5th, or 6th)
  - IF THE USER HAS PROVIDED ALL THREE DETAILS: THEN and ONLY THEN call 'search_main_exams' with those details, and answer exactly what they asked for:
    - If they asked about a specific subject: give only that subject's paper date/time
    - If they asked about all exams for a semester: give all exams for that semester with date and time in clear format
  - IF ANY OF THE THREE DETAILS ARE MISSING: DO NOT CALL ANY TOOLS YET! DO NOT GUESS OR GIVE PARTIAL RESULTS! INSTEAD, ASK FOR THE MISSING DETAILS IN A WARM, FRIENDLY HINGLISH, LIKE THIS: "Kripya thodi aur jankari dein, main aapki madad karunga: Aap Collegiate student hain ya Non-Collegiate? Aap Undergraduate hain ya Postgraduate? Aur semester kaunsa hai?"
- **Complaint / Feedback Handling**: If the user complains about any teacher, faculty member, principal, staff, teaching quality, behaviour, or says someone teaches badly, do NOT show profiles, do NOT defend or insult anyone. Respond maturely: acknowledge their concern, ask for the specific issue, suggest first talking politely to the teacher, and if unresolved guide them to the college office or Principal Mam. Mention useful contacts when appropriate: Principal Mam +91-9414665955, principal email manjudinesh.8@gmail.com, college office 01562-250362, college email lohiacollegechuru@gmail.com.
- **Principal Image Rule**: If the user asks neutral information about principal mam, answer with details. If the user complains or gives negative feedback about principal mam, do not describe photos/images; respond with complaint guidance.
- **Gallery / Programme Photos (IMPORTANT)**: If user asks for photos/images of any programme/event: call search_gallery first, then clearly instruct them: "Is program ki photos gallery mein available hain. Aap gallery section mein jakar dekh sakte hain." Do NOT say you will open it.
- **Specific Field Rule**: If user asks only one detail of a person, like qualification, phone number, father name, email, joining date, or subject, answer only that field. Do not give full profile unless they ask for profile/full details.
- **Materials, Folders, & Notices**: Students will ask you about uploaded study materials, PDF/Excel files, PowerPoint slides, folders, or latest announcements, notices, and notifications in Hinglish, Hindi, or English. You MUST call 'search_materials_chat', 'search_knowledge_items', or 'search_alerts_chat' to fetch them and speak them out. Explain what notice or material was found and mention related attachments if present.
- **Admission Urgent Alert**: Admission session for 2026-27 is LIVE from May 1 to June 6, 2026. Nodal Officer UG Admission is Dr. Umed Singh Gothwal (9414203821). Stream-wise Course Contacts: B.A. (Mohd Javed Khan: 9785159841), B.Sc. Bio/Math (Dr. Mukesh Kumar Meena: 8005763754), B.Com./BBA (Dr. Mahendra Kumar Khardiya: 9928273463), AEDP (Dr. Madhu Sudan Pardhan: 9782582267). Always guide students to contact these respective stream conveners for specific questions, and Dr. Umed Gothwal as the central Nodal Officer. Mention the documents and the help WhatsApp number 9509932564 if they sound confused.
- **Unknown Information**: If the specific information is NOT in your knowledge base, do NOT hallucinate. For English queries, say: "I am sorry, I do not have this information. Please contact the college office or check the official website." For Hindi/Hinglish queries, say: "Maaf kijiye, mere paas iski sateek jankari nahi hai. Aap college office mein sampark kar sakte hain ya website check kar sakte hain."

INTERACTION FLOW:
- **Initial Greeting**: You MUST start with this EXACT English greeting: "Hello, I am Lohia College AI Assistant. How can I help you? What is your name sir?" (Do NOT translate this to Hindi or repeat it).
- **Language Strategy**: Greet in English. Dynamically adapt your language to match the user: if the user speaks or asks in English, reply strictly and entirely in English. If they speak in Hinglish or Hindi, reply in Hinglish. Never mix Hindi/Hinglish into the response when the user is speaking English.
- **Name Usage Protocol**: ONLY use the user's name the VERY FIRST TIME they tell you. DO NOT repeat their name in every subsequent response. Say it once to acknowledge, then talk normally.
- **Natural Conversation**: Never use internal technical/source words in spoken answers. Act like a real human who knows the information. Say "Unki details yeh hain..." instead of explaining where the details came from.
- **No Technical Words**: Do not mention storage, helper calls, search process, or internal sources to the user. Say "available information", "college records", "notice", "details", or "updates" instead.
- Use short, spoken-style responses. Avoid lists with more than 3 items; instead, offer to give more details if they want.

--- COMPREHENSIVE KNOWLEDGE BASE ---
${contextInfo}`;

      const ctx = new (window.AudioContext || (window as any).webkitAudioContext)({ sampleRate: 16000 });
      audioContextRef.current = ctx;

      const stream = await navigator.mediaDevices.getUserMedia({
        audio: {
          echoCancellation: true,
          noiseSuppression: true,
          autoGainControl: true
        }
      });
      streamRef.current = stream;

      const source = ctx.createMediaStreamSource(stream);

      const workletCode = `
      class PCMProcessor extends AudioWorkletProcessor {
        constructor() {
          super();
          this.bufferSize = 4096;
          this.buffer = new Float32Array(this.bufferSize);
          this.framesWritten = 0;
        }
        process(inputs, outputs, parameters) {
          const input = inputs[0];
          if (input && input.length > 0) {
            const channelData = input[0];
            for (let i = 0; i < channelData.length; i++) {
              this.buffer[this.framesWritten++] = channelData[i];
              if (this.framesWritten >= this.bufferSize) {
                this.port.postMessage(this.buffer);
                this.buffer = new Float32Array(this.bufferSize);
                this.framesWritten = 0;
              }
            }
          }
          return true;
        }
      }
      registerProcessor('pcm-processor', PCMProcessor);
      `;
      const blob = new Blob([workletCode], { type: 'application/javascript' });
      const workletUrl = URL.createObjectURL(blob);
      await ctx.audioWorklet.addModule(workletUrl);

      const processor = new AudioWorkletNode(ctx, 'pcm-processor');
      processorRef.current = processor;

      source.connect(processor);
      processor.connect(ctx.destination);

      const sessionPromise = ai.live.connect({
        model: LIVE_MODEL,
        config: {
          responseModalities: [Modality.AUDIO],
          speechConfig: {
            voiceConfig: { prebuiltVoiceConfig: { voiceName: LIVE_VOICE } },
          },
          tools: [
            { functionDeclarations: [facultySearchTool, principalTool, collegeSectionsTool, pastPrincipalsTool, achievementsTool, mainExamsTool, studyMaterialTool, practicalExamsTool, practicalStudentSearchTool, gallerySearchTool, galleryCategoriesTool, eventSearchTool, coursesSearchTool, meritListTool, sportsTool, knowledgeBaseTool, knowledgeItemsTool, materialsChatSearchTool, alertsChatSearchTool] }
          ],
          systemInstruction: dynamicSystemInstruction,
          outputAudioTranscription: {},
          inputAudioTranscription: {},
        },
        callbacks: {
          onopen: () => {
            liveConnectionOpenRef.current = true;
            setIsConnected(true);

            setTimeout(() => {
              if (!liveConnectionOpenRef.current) return;
              sessionPromise.then((session) => {
                try {
                  session.sendRealtimeInput({
                    text: "Hello"
                  });
                } catch (e) { }
              });
            }, 500);

            processor.port.onmessage = (e) => {
              if (!liveConnectionOpenRef.current) return;
              const inputData = e.data;
              const pcm16 = floatTo16BitPCM(inputData);
              const base64Data = bufferToBase64(pcm16);

              sessionPromise.then((session) => {
                if (!liveConnectionOpenRef.current) return;
                try {
                  session.sendRealtimeInput({
                    audio: { data: base64Data, mimeType: 'audio/pcm;rate=16000' }
                  });
                } catch (err) {
                }
              });
            };
          },
          onmessage: async (message: LiveServerMessage) => {
            if (message.serverContent?.interrupted) {
              stopAllAudio();
            }

            if (message.serverContent?.turnComplete) {
              incrementUsage();
            }

            if (message.toolCall && message.toolCall.functionCalls) {
              const session = await sessionPromise;
              const toolResponses: any[] = [];

              for (const call of message.toolCall.functionCalls) {
                let result;
                try {
                  switch (call.name) {
                    case 'search_faculty': result = await searchFaculty(call.args as any); break;
                    case 'get_principal_info': result = await getPrincipalInfo(); break;
                    case 'get_college_info_sections': result = await getCollegeSections((call.args as any).key); break;
                    case 'get_past_principals': result = await getAllPastPrincipals((call.args as any).query); break;
                    case 'get_achievements': result = await getAllAchievements((call.args as any).query); break;
                    case 'search_merit_list': result = await searchMeritList(call.args as any); break;
                    case 'search_main_exams': result = await searchMainExams(call.args as any); break;
                    case 'get_study_material': result = await searchStudyMaterial(call.args as any); break;
                    case 'search_practical_exams': result = await searchPracticalExams(call.args as any); break;
                    case 'search_practical_students': result = await searchPracticalStudentsByName(call.args as any); break;
                    case 'search_gallery': result = await searchGallery(call.args as any); break;
                    case 'get_gallery_categories': result = await getGalleryCategories(); break;
                    case 'search_events': result = await searchEvents(call.args as any); break;
                    case 'search_courses': result = await searchCourses((call.args as any).stream, (call.args as any).query); break;
                    case 'search_sports': result = await searchSports(call.args as any); break;
                    case 'search_knowledge_base': result = await searchKnowledgeBase(call.args as any); break;
                    case 'search_knowledge_items': result = await searchKnowledgeItems((call.args as any).query); break;
                    case 'search_materials_chat': result = await searchMaterialsChat((call.args as any).query); break;
                    case 'search_alerts_chat': result = await searchAlertsChat((call.args as any).query); break;
                    default: result = { error: "Function not found" };
                  }
                } catch (e) {
                  console.error(`Error in Live API tool ${call.name}:`, e);
                  result = { error: "Failed to execute function" };
                }

                toolResponses.push({
                  name: call.name,
                  response: { data: result },
                  id: call.id
                });
              }

              if (toolResponses.length > 0) {
                session.sendToolResponse({
                  functionResponses: toolResponses
                });
              }
            }

            if (message.serverContent?.modelTurn?.parts) {
              const text = message.serverContent.modelTurn.parts
                .filter(p => p.text)
                .map(p => p.text)
                .join('');
              if (text) {
                setTranscript(prev => `AI: ${text}\n${prev}`);
              }
            }

            const parts = message.serverContent?.modelTurn?.parts;
            const base64Audio = (parts && parts.length > 0) ? parts.find(p => p.inlineData)?.inlineData?.data : undefined;
            if (base64Audio) {
              const pcm16 = base64ToBuffer(base64Audio);
              audioQueueRef.current.push(pcm16);
              processAudioQueue();
            }
          },
          onerror: (err) => {
            liveConnectionOpenRef.current = false;
            console.error("Live API Error:", err);
            setError("Connection error with Live API.");
            stopConnection();
          },
          onclose: (e: any) => {
            liveConnectionOpenRef.current = false;
            if (e && e.code !== 1000) {
              console.warn("Live API Closed:", e.code, e.reason);
              if (e.reason && e.reason.toLowerCase().includes("suspended")) {
                setError("Your Gemini API Key has been suspended.");
              } else if (e.reason && (e.reason.includes("Permission denied") || e.reason.toLowerCase().includes("denied access"))) {
                setError(`Live Voice access denied hai. Is Gemini API key/project ko ${LIVE_MODEL} ka Live API access nahi mila.`);
              } else if (e.reason) {
                setError(`Connection closed: ${e.reason}`);
              }
            }
            stopConnection(false);
          }
        }
      });

      sessionRef.current = sessionPromise;

    } catch (err: any) {
      console.error(err);
      let userErrorMessage = err.message || "Failed to start connection.";
      if (userErrorMessage.includes("Requested device not found")) {
        userErrorMessage = "Microphone nahi mila. Please check your mic connection.";
      } else if (userErrorMessage.includes("Permission denied")) {
        userErrorMessage = "Microphone access blocked. Please allow mic permission.";
      }
      setError(userErrorMessage);
      stopConnection();
    }
  };

  return {
    isConnected,
    isSpeaking,
    transcript,
    error,
    startConnection,
    stopConnection,
    dailyLimitReached,
    questionsRemaining,
    timeUntilReset
  };
}
