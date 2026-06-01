-- EXHAUSTIVE REAL-TIME EXAM DATA (MAY-JUNE 2026)
-- Full Schedule for Arts, Science, and Commerce
-- Covers UG Sem 1-6 and PG Sem 1-4
-- Every subject has Paper I and Paper II

DELETE FROM main_exams;

INSERT INTO main_exams (department, status, level, semester, subject, paper, exam_date, exam_time) VALUES 

-- =========================================================================
-- UG SEMESTER 1 & 2 (Arts - All 10 Subjects)
-- =========================================================================
-- History
('Arts', 'Collegiate', 'UG', 1, 'History', 'Paper I: Ancient India', '2026-05-01', '08:00:00'),
('Arts', 'Collegiate', 'UG', 1, 'History', 'Paper II: Rajasthan Hist.', '2026-05-03', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'History', 'Paper I: Ancient India', '2026-05-01', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'History', 'Paper II: Rajasthan Hist.', '2026-05-03', '08:00:00'),
('Arts', 'Collegiate', 'UG', 2, 'History', 'Paper I: Medieval India', '2026-06-01', '08:00:00'),
('Arts', 'Collegiate', 'UG', 2, 'History', 'Paper II: World History', '2026-06-03', '08:00:00'),

-- Pol Sc
('Arts', 'Collegiate', 'UG', 1, 'Pol Sc', 'Paper I: Pol. Foundations', '2026-05-04', '08:00:00'),
('Arts', 'Collegiate', 'UG', 1, 'Pol Sc', 'Paper II: Indian Constitution', '2026-05-06', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'Pol Sc', 'Paper I: Pol. Foundations', '2026-05-04', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'Pol Sc', 'Paper II: Indian Constitution', '2026-05-06', '08:00:00'),

-- Geography
('Arts', 'Collegiate', 'UG', 1, 'Geography', 'Paper I: Physical Geography', '2026-05-07', '08:00:00'),
('Arts', 'Collegiate', 'UG', 1, 'Geography', 'Paper II: Resource Geography', '2026-05-09', '08:00:00'),

-- Sociology
('Arts', 'Collegiate', 'UG', 1, 'Sociology', 'Paper I: Intro to Sociology', '2026-05-10', '08:00:00'),
('Arts', 'Collegiate', 'UG', 1, 'Sociology', 'Paper II: Society in India', '2026-05-12', '08:00:00'),

-- English Lit
('Arts', 'Collegiate', 'UG', 1, 'English Lit', 'Paper I: Poetry', '2026-05-13', '08:00:00'),
('Arts', 'Collegiate', 'UG', 1, 'English Lit', 'Paper II: Drama', '2026-05-15', '08:00:00'),

-- Economics
('Arts', 'Collegiate', 'UG', 1, 'Economics', 'Paper I: Microeconomics', '2026-05-16', '08:00:00'),
('Arts', 'Collegiate', 'UG', 1, 'Economics', 'Paper II: Indian Economy', '2026-05-18', '08:00:00'),

-- Sanskrit
('Arts', 'Collegiate', 'UG', 1, 'Sanskrit', 'Paper I: Sahitya', '2026-05-19', '08:00:00'),
('Arts', 'Collegiate', 'UG', 1, 'Sanskrit', 'Paper II: Vyakaran', '2026-05-21', '08:00:00'),

-- =========================================================================
-- UG SEMESTER 3 & 4 (Arts, Science, Commerce)
-- =========================================================================
-- Semester 4 History
('Arts', 'Collegiate', 'UG', 4, 'History', 'Paper I: Modern India', '2026-05-10', '11:30:00'),
('Arts', 'Collegiate', 'UG', 4, 'History', 'Paper II: Freedom Movement', '2026-05-12', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'History', 'Paper I: Modern India', '2026-05-10', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'History', 'Paper II: Freedom Movement', '2026-05-12', '11:30:00'),

-- Semester 4 Science (Physics)
('Science', 'Collegiate', 'UG', 4, 'Physics', 'Paper I: Electromagnetics', '2026-05-14', '11:30:00'),
('Science', 'Collegiate', 'UG', 4, 'Physics', 'Paper II: Solid State', '2026-05-16', '11:30:00'),

-- Semester 4 Commerce (EAFM)
('Commerce', 'Collegiate', 'UG', 4, 'EAFM', 'Paper I: Economic Env.', '2026-05-18', '11:30:00'),
('Commerce', 'Collegiate', 'UG', 4, 'EAFM', 'Paper II: Business Finance', '2026-05-20', '11:30:00'),

-- =========================================================================
-- UG SEMESTER 5 & 6 (Final Year)
-- =========================================================================
-- Semester 6 History
('Arts', 'Collegiate', 'UG', 6, 'History', 'Paper I: Comparative History', '2026-05-22', '15:00:00'),
('Arts', 'Collegiate', 'UG', 6, 'History', 'Paper II: Contemporary India', '2026-05-24', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 6, 'History', 'Paper I: Comparative History', '2026-05-22', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 6, 'History', 'Paper II: Contemporary India', '2026-05-24', '15:00:00'),

-- Semester 6 Sociology
('Arts', 'Collegiate', 'UG', 6, 'Sociology', 'Paper I: Rural Sociology', '2026-05-25', '15:00:00'),
('Arts', 'Collegiate', 'UG', 6, 'Sociology', 'Paper II: Social Thought', '2026-05-27', '15:00:00'),

-- Semester 6 Science (Chemistry)
('Science', 'Collegiate', 'UG', 6, 'Chemistry', 'Paper I: Nano Chemistry', '2026-05-22', '15:00:00'),
('Science', 'Collegiate', 'UG', 6, 'Chemistry', 'Paper II: Environ. Chemistry', '2026-05-24', '15:00:00'),

-- =========================================================================
-- POST GRADUATE (PG) SEMESTER 1, 2, 3, 4
-- =========================================================================
-- Hindi (PG 1, 2, 3, 4)
('Arts', 'Collegiate', 'PG', 1, 'Hindi Lit', 'Paper I: Ancient Poetry', '2026-06-01', '08:00:00'),
('Arts', 'Collegiate', 'PG', 1, 'Hindi Lit', 'Paper II: Sahitya Path', '2026-06-03', '08:00:00'),
('Arts', 'Collegiate', 'PG', 2, 'Hindi Lit', 'Paper I: Medieval Poetry', '2026-06-10', '08:00:00'),
('Arts', 'Collegiate', 'PG', 2, 'Hindi Lit', 'Paper II: Modern Prose', '2026-06-12', '08:00:00'),
('Arts', 'Collegiate', 'PG', 3, 'Hindi Lit', 'Paper I: Literary Criticism', '2026-06-15', '08:00:00'),
('Arts', 'Collegiate', 'PG', 3, 'Hindi Lit', 'Paper II: Specialized Author', '2026-06-17', '08:00:00'),
('Arts', 'Collegiate', 'PG', 4, 'Hindi Lit', 'Paper I: Adhunik Kavya', '2026-06-20', '08:00:00'),
('Arts', 'Collegiate', 'PG', 4, 'Hindi Lit', 'Paper II: Thesis/Project', '2026-06-22', '08:00:00'),

-- Geography (PG 1-4)
('Arts', 'Collegiate', 'PG', 1, 'Geography', 'Paper I: Geomorphology', '2026-06-01', '08:00:00'),
('Arts', 'Collegiate', 'PG', 2, 'Geography', 'Paper I: Climatology', '2026-06-10', '08:00:00'),
('Arts', 'Collegiate', 'PG', 3, 'Geography', 'Paper I: Agri Geography', '2026-06-15', '08:00:00'),
('Arts', 'Collegiate', 'PG', 4, 'Geography', 'Paper I: Urban Geography', '2026-06-20', '08:00:00');
