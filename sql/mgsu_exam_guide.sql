-- MGSU Detailed Examination & Practical System Guide
-- Run this in Supabase SQL Editor to add comprehensive rules

DELETE FROM college_sections WHERE key IN ('exam_general', 'exam_theory', 'exam_practical', 'exam_passing', 'exam_cbc_grading');

INSERT INTO college_sections (key, title, content) VALUES 
('exam_general', '1. MGSU Examination Overview', 'Maharaja Ganga Singh University (MGSU) follows both Semester and Annual systems.
- Semester System: Jan-June (Sem 2, 4, 6) and July-Dec (Sem 1, 3, 5).
- CBCS (Choice Based Credit System): Includes internal assessment (20 marks) and external university exams (80 marks).
- Internal Assessment: Includes assignments (5), attendance (5), and unit tests (10 marks).'),

('exam_theory', '2. Theory Exam Pattern', 'Theory papers are divided into:
- Section A: 10 Very Short Answer questions.
- Section B: 5 Short Answer questions (approx 25 marks).
- Section C: 3 Long Answer questions (approx 45 marks).
Total Theory Marks: 80 or 100 depending on the subject. Passing requires approx 36% (29 out of 80).'),

('exam_practical', '3. Practical Examination System (Science & Arts)', 'Practical exams are mandatory for Science (Physics, Chemistry, Bio), Geography, and Psychology.
- Science Pattern: Experiment (15), Viva (5), Record File (5), Attendance (5). Total 30 Marks.
- Arts (Geography): Theory (75), Practical (25) including Map work, File, and Viva.
- Passing Practical: Fails in practical mean a Back/Due result. Min 11 marks out of 30 or 18 out of 50 are required.
- Viva-Voce: Oral examination where external examiners ask about definitions, instruments, and experiments.'),

('exam_passing', '4. Passing & Back Rules', '- Minimum Passing: 36% overall (separately in Theory and Practical).
- Back/Due System: If a student fails 1-2 papers, they can reappear in the next session.
- Grace Marks: 1-3 marks can be awarded by the university for borderline cases.
- Division System: 60%+ (1st Div), 50-59% (2nd Div), 36-49% (Pass Div).'),

('exam_cbc_grading', '5. CBCS Grading (SGPA/CGPA)', 'MGSU uses a letter grade system:
- O (90-100%): Outstanding
- A+ (80-89%): Excellent
- A (70-79%): Very Good
- B+ (60-69%): Good
- B (50-59%): Above Average
- F (Below 36%): Fail (Result shows RT - Reappear in Theory)');
