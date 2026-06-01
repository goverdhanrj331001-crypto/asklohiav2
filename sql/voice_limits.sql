CREATE TABLE IF NOT EXISTS public.voice_limits (
  fingerprint_id TEXT PRIMARY KEY,
  question_count INTEGER DEFAULT 0,
  limit_reached_at TIMESTAMP WITH TIME ZONE
);

-- RLS policies
ALTER TABLE public.voice_limits ENABLE ROW LEVEL SECURITY;

-- Allow anon and authenticated to select and update their own limits
CREATE POLICY "Allow public select on voice_limits" 
ON public.voice_limits FOR SELECT 
USING (true);

CREATE POLICY "Allow public insert on voice_limits" 
ON public.voice_limits FOR INSERT 
WITH CHECK (true);

CREATE POLICY "Allow public update on voice_limits" 
ON public.voice_limits FOR UPDATE 
USING (true)
WITH CHECK (true);
