-- 1. Table create karein (Agar nahi bani hai)
CREATE TABLE IF NOT EXISTS exam_passing_rules (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    stream TEXT NOT NULL, -- Science, Arts, Commerce, Compulsory
    subject TEXT NOT NULL,
    theory_max_marks INTEGER,
    theory_pass_marks INTEGER,
    practical_max_marks INTEGER DEFAULT 0,
    practical_pass_marks INTEGER DEFAULT 0,
    total_max_marks INTEGER,
    notes TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- RLS policies set karein handle public read
ALTER TABLE exam_passing_rules ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public Read Passing Rules" ON exam_passing_rules;
CREATE POLICY "Public Read Passing Rules" ON exam_passing_rules FOR SELECT USING (true);

-- 2. Data insert karein
INSERT INTO exam_passing_rules (stream, subject, theory_max_marks, theory_pass_marks, practical_max_marks, practical_pass_marks, total_max_marks, notes) VALUES
-- Science Faculty
('Science', 'Physics', 135, 48, 65, 24, 200, '3 papers of 45 marks each. 36% aggregate in theory + 36% in practical required.'),
('Science', 'Chemistry', 135, 48, 65, 24, 200, '3 papers of 45 marks each. 36% aggregate in theory + 36% in practical required.'),
('Science', 'Botany', 135, 48, 65, 24, 200, '3 papers of 45 marks each. 36% aggregate in theory + 36% in practical required.'),
('Science', 'Zoology', 135, 48, 65, 24, 200, '3 papers of 45 marks each. 36% aggregate in theory + 36% in practical required.'),
('Science', 'Mathematics', 200, 72, 0, 0, 200, '3 papers of 66, 66, and 68 marks. No practical.'),

-- Arts Faculty
('Arts', 'General (Hindi, History, Pol Sc, Sociology, etc.)', 200, 72, 0, 0, 200, '2 papers of 100 marks each.'),
('Arts', 'Geography', 150, 54, 50, 18, 200, '2 papers of 75 marks each + Practical.'),
('Arts', 'Psychology', 150, 54, 50, 18, 200, '2 papers of 75 marks each + Practical.'),
('Arts', 'Home Science', 150, 54, 50, 18, 200, '2 papers of 75 marks each + Practical.'),

-- Commerce Faculty
('Commerce', 'ABST', 200, 72, 0, 0, 200, '2 papers of 100 marks each.'),
('Commerce', 'Business Administration', 200, 72, 0, 0, 200, '2 papers of 100 marks each.'),
('Commerce', 'EAFM', 200, 72, 0, 0, 200, '2 papers of 100 marks each.'),

-- Compulsory Papers
('Compulsory', 'General Hindi', 100, 36, 0, 0, 100, 'Mandatory passing score 36%.'),
('Compulsory', 'General English', 100, 36, 0, 0, 100, 'Mandatory passing score 36%.'),
('Compulsory', 'Environmental Studies', 100, 36, 0, 0, 100, 'Mandatory passing score 36%.'),
('Compulsory', 'Elementary Computer Applications', 100, 36, 0, 0, 100, 'Mandatory passing score 36%.');
