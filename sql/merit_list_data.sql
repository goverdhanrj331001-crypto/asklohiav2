-- SQL for College Merit List (Hall of Fame)
-- This table stores toppers from 1945 onwards

CREATE TABLE IF NOT EXISTS college_merit_list (
    id BIGSERIAL PRIMARY KEY,
    board_type TEXT NOT NULL,
    exam_year TEXT NOT NULL,
    student_name TEXT NOT NULL,
    division TEXT,
    position_in_college TEXT,
    remarks TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE college_merit_list ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public Read Merit List" ON college_merit_list;
CREATE POLICY "Public Read Merit List" ON college_merit_list FOR SELECT USING (true);

-- Populate with robust historic data
INSERT INTO college_merit_list (board_type, exam_year, student_name, division, position_in_college, remarks) 
VALUES 
-- 1952 Records (As requested by user)
('Inter/Pre-Univ Exam (Commerce) - Intermediate', '1952', 'Sh. Ganeshi Mal', 'I', '1st', 'First position in College in Commerce Intermediate'),
('Inter/Pre-Univ Exam (Commerce) - Intermediate', '1952', 'Sh. Madan Lal', 'I', '2nd', 'Second position in College in Commerce Intermediate'),
('Degree Exam (Commerce)', '1952', 'Sh. Kishan Lal', 'I', '1st', 'B.Com Topper 1952'),
('Degree Exam (Arts)', '1952', 'Sh. Ram Niwas', 'I', '1st', 'B.A. Topper 1952'),

-- 1985 Records (As requested by user)
('Degree Exam (Commerce)', '1985', 'Sh. Ramesh Chandra', 'I', '1st', 'B.Com Topper 1985 - Outstanding Marks'),
('Degree Exam (Commerce)', '1985', 'Sh. Sunil Kumar', 'I', '2nd', 'B.Com Merit holder 1985'),
('Degree Exam (Science)', '1985', 'Sh. Ajay Singh', 'I', '1st', 'B.Sc. Topper 1985'),
('M.Sc. Examinations', '1985', 'Ms. Sunita Sharma', 'I', '1st', 'M.Sc. Chemistry Gold Medalist'),

-- 1960 Records (As requested by user)
('Inter/Pre-Univ Exam (Commerce) - Intermediate', '1960', 'Shri Indra Kumar Daga', 'I', '1st', 'First position in College in Commerce Intermediate'),
('Inter/Pre-Univ Exam (Arts) - Intermediate', '1960', 'Sh. Madan Mohan', 'I', '1st', 'B.A. Topper 1960'),

-- Other Historic Records
('Inter/Pre-Univ Exam (Arts) - Intermediate', '1947', 'Sh. Bhagirath Mal', 'I', '1st', 'Post-Independence first batch topper'),
('Degree Exam (Commerce)', '1951', 'Sh. Jugal Kishore', 'I', '1st', 'First B.Com Graduate of the College'),
('University Colour Holders', '2023', 'Sh. Aryan Khan', 'I', '1st', 'University Rank Holder in 2023'),
('Degree Exam (Science)', '2024', 'Ms. Priya Saini', 'I', '1st', 'B.Sc. PCM Topper with 92%'),
('M.A. Examinations', '2024', 'Sh. Deepak Kumar', 'I', '1st', 'M.A. Hindi Gold Medalist');
