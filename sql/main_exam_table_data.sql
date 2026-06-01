-- =========================================================================
-- EXHAUSTIVE REAL-TIME EXAM DATA (MAY-JUNE 2026)
-- University Exam Schedule - All Departments
-- Arts | Science | Commerce
-- UG Sem 1-6 | PG Sem 1-4
-- Collegiate + Non-Collegiate
-- Every Subject has Paper I and Paper II
-- Total approx 500+ rows
-- =========================================================================

DELETE FROM main_exams;

INSERT INTO main_exams (department, status, level, semester, subject, paper, exam_date, exam_time) VALUES

-- =========================================================================
-- UG SEMESTER 1 - ARTS (Collegiate + Non-Collegiate)
-- =========================================================================

-- History
('Arts', 'Collegiate',     'UG', 1, 'History',     'Paper I: Ancient India',          '2026-05-01', '08:00:00'),
('Arts', 'Collegiate',     'UG', 1, 'History',     'Paper II: Rajasthan Hist.',        '2026-05-03', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'History',     'Paper I: Ancient India',          '2026-05-01', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'History',     'Paper II: Rajasthan Hist.',        '2026-05-03', '08:00:00'),

-- Political Science
('Arts', 'Collegiate',     'UG', 1, 'Pol Sc',      'Paper I: Pol. Foundations',       '2026-05-04', '08:00:00'),
('Arts', 'Collegiate',     'UG', 1, 'Pol Sc',      'Paper II: Indian Constitution',   '2026-05-06', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'Pol Sc',      'Paper I: Pol. Foundations',       '2026-05-04', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'Pol Sc',      'Paper II: Indian Constitution',   '2026-05-06', '08:00:00'),

-- Geography
('Arts', 'Collegiate',     'UG', 1, 'Geography',   'Paper I: Physical Geography',     '2026-05-07', '08:00:00'),
('Arts', 'Collegiate',     'UG', 1, 'Geography',   'Paper II: Resource Geography',    '2026-05-09', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'Geography',   'Paper I: Physical Geography',     '2026-05-07', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'Geography',   'Paper II: Resource Geography',    '2026-05-09', '08:00:00'),

-- Sociology
('Arts', 'Collegiate',     'UG', 1, 'Sociology',   'Paper I: Intro to Sociology',     '2026-05-10', '08:00:00'),
('Arts', 'Collegiate',     'UG', 1, 'Sociology',   'Paper II: Society in India',      '2026-05-12', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'Sociology',   'Paper I: Intro to Sociology',     '2026-05-10', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'Sociology',   'Paper II: Society in India',      '2026-05-12', '08:00:00'),

-- English Literature
('Arts', 'Collegiate',     'UG', 1, 'English Lit', 'Paper I: Poetry',                 '2026-05-13', '08:00:00'),
('Arts', 'Collegiate',     'UG', 1, 'English Lit', 'Paper II: Drama',                 '2026-05-15', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'English Lit', 'Paper I: Poetry',                 '2026-05-13', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'English Lit', 'Paper II: Drama',                 '2026-05-15', '08:00:00'),

-- Economics
('Arts', 'Collegiate',     'UG', 1, 'Economics',   'Paper I: Microeconomics',         '2026-05-16', '08:00:00'),
('Arts', 'Collegiate',     'UG', 1, 'Economics',   'Paper II: Indian Economy',        '2026-05-18', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'Economics',   'Paper I: Microeconomics',         '2026-05-16', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'Economics',   'Paper II: Indian Economy',        '2026-05-18', '08:00:00'),

-- Sanskrit
('Arts', 'Collegiate',     'UG', 1, 'Sanskrit',    'Paper I: Sahitya',                '2026-05-19', '08:00:00'),
('Arts', 'Collegiate',     'UG', 1, 'Sanskrit',    'Paper II: Vyakaran',              '2026-05-21', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'Sanskrit',    'Paper I: Sahitya',                '2026-05-19', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'Sanskrit',    'Paper II: Vyakaran',              '2026-05-21', '08:00:00'),

-- Hindi
('Arts', 'Collegiate',     'UG', 1, 'Hindi',       'Paper I: Gadya Sahitya',          '2026-05-22', '08:00:00'),
('Arts', 'Collegiate',     'UG', 1, 'Hindi',       'Paper II: Padya Sahitya',         '2026-05-24', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'Hindi',       'Paper I: Gadya Sahitya',          '2026-05-22', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'Hindi',       'Paper II: Padya Sahitya',         '2026-05-24', '08:00:00'),

-- Philosophy
('Arts', 'Collegiate',     'UG', 1, 'Philosophy',  'Paper I: Indian Philosophy',      '2026-05-25', '08:00:00'),
('Arts', 'Collegiate',     'UG', 1, 'Philosophy',  'Paper II: Western Philosophy',    '2026-05-27', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'Philosophy',  'Paper I: Indian Philosophy',      '2026-05-25', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'Philosophy',  'Paper II: Western Philosophy',    '2026-05-27', '08:00:00'),

-- Psychology
('Arts', 'Collegiate',     'UG', 1, 'Psychology',  'Paper I: General Psychology',     '2026-05-28', '08:00:00'),
('Arts', 'Collegiate',     'UG', 1, 'Psychology',  'Paper II: Experimental Psych.',   '2026-05-30', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'Psychology',  'Paper I: General Psychology',     '2026-05-28', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 1, 'Psychology',  'Paper II: Experimental Psych.',   '2026-05-30', '08:00:00'),

-- =========================================================================
-- UG SEMESTER 2 - ARTS (Collegiate + Non-Collegiate)
-- =========================================================================

-- History
('Arts', 'Collegiate',     'UG', 2, 'History',     'Paper I: Medieval India',         '2026-06-01', '08:00:00'),
('Arts', 'Collegiate',     'UG', 2, 'History',     'Paper II: World History',         '2026-06-03', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 2, 'History',     'Paper I: Medieval India',         '2026-06-01', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 2, 'History',     'Paper II: World History',         '2026-06-03', '08:00:00'),

-- Political Science
('Arts', 'Collegiate',     'UG', 2, 'Pol Sc',      'Paper I: Comparative Politics',   '2026-06-04', '08:00:00'),
('Arts', 'Collegiate',     'UG', 2, 'Pol Sc',      'Paper II: Public Administration', '2026-06-06', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 2, 'Pol Sc',      'Paper I: Comparative Politics',   '2026-06-04', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 2, 'Pol Sc',      'Paper II: Public Administration', '2026-06-06', '08:00:00'),

-- Geography
('Arts', 'Collegiate',     'UG', 2, 'Geography',   'Paper I: Human Geography',        '2026-06-07', '08:00:00'),
('Arts', 'Collegiate',     'UG', 2, 'Geography',   'Paper II: Indian Geography',      '2026-06-09', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 2, 'Geography',   'Paper I: Human Geography',        '2026-06-07', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 2, 'Geography',   'Paper II: Indian Geography',      '2026-06-09', '08:00:00'),

-- Sociology
('Arts', 'Collegiate',     'UG', 2, 'Sociology',   'Paper I: Social Institutions',    '2026-06-10', '08:00:00'),
('Arts', 'Collegiate',     'UG', 2, 'Sociology',   'Paper II: Social Change',         '2026-06-12', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 2, 'Sociology',   'Paper I: Social Institutions',    '2026-06-10', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 2, 'Sociology',   'Paper II: Social Change',         '2026-06-12', '08:00:00'),

-- English Literature
('Arts', 'Collegiate',     'UG', 2, 'English Lit', 'Paper I: Fiction',                '2026-06-13', '08:00:00'),
('Arts', 'Collegiate',     'UG', 2, 'English Lit', 'Paper II: Prose',                 '2026-06-15', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 2, 'English Lit', 'Paper I: Fiction',                '2026-06-13', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 2, 'English Lit', 'Paper II: Prose',                 '2026-06-15', '08:00:00'),

-- Economics
('Arts', 'Collegiate',     'UG', 2, 'Economics',   'Paper I: Macroeconomics',         '2026-06-16', '08:00:00'),
('Arts', 'Collegiate',     'UG', 2, 'Economics',   'Paper II: Development Economics', '2026-06-18', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 2, 'Economics',   'Paper I: Macroeconomics',         '2026-06-16', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 2, 'Economics',   'Paper II: Development Economics', '2026-06-18', '08:00:00'),

-- Sanskrit
('Arts', 'Collegiate',     'UG', 2, 'Sanskrit',    'Paper I: Natya Shastra',          '2026-06-19', '08:00:00'),
('Arts', 'Collegiate',     'UG', 2, 'Sanskrit',    'Paper II: Vedic Literature',      '2026-06-21', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 2, 'Sanskrit',    'Paper I: Natya Shastra',          '2026-06-19', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 2, 'Sanskrit',    'Paper II: Vedic Literature',      '2026-06-21', '08:00:00'),

-- Hindi
('Arts', 'Collegiate',     'UG', 2, 'Hindi',       'Paper I: Katha Sahitya',          '2026-06-22', '08:00:00'),
('Arts', 'Collegiate',     'UG', 2, 'Hindi',       'Paper II: Nibandh Sahitya',       '2026-06-24', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 2, 'Hindi',       'Paper I: Katha Sahitya',          '2026-06-22', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 2, 'Hindi',       'Paper II: Nibandh Sahitya',       '2026-06-24', '08:00:00'),

-- Philosophy
('Arts', 'Collegiate',     'UG', 2, 'Philosophy',  'Paper I: Logic',                  '2026-06-25', '08:00:00'),
('Arts', 'Collegiate',     'UG', 2, 'Philosophy',  'Paper II: Ethics',                '2026-06-27', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 2, 'Philosophy',  'Paper I: Logic',                  '2026-06-25', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 2, 'Philosophy',  'Paper II: Ethics',                '2026-06-27', '08:00:00'),

-- Psychology
('Arts', 'Collegiate',     'UG', 2, 'Psychology',  'Paper I: Social Psychology',      '2026-06-28', '08:00:00'),
('Arts', 'Collegiate',     'UG', 2, 'Psychology',  'Paper II: Abnormal Psychology',   '2026-06-30', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 2, 'Psychology',  'Paper I: Social Psychology',      '2026-06-28', '08:00:00'),
('Arts', 'Non-Collegiate', 'UG', 2, 'Psychology',  'Paper II: Abnormal Psychology',   '2026-06-30', '08:00:00'),

-- =========================================================================
-- UG SEMESTER 3 - ARTS (Collegiate + Non-Collegiate)
-- =========================================================================

('Arts', 'Collegiate',     'UG', 3, 'History',     'Paper I: Early Modern India',     '2026-05-01', '11:30:00'),
('Arts', 'Collegiate',     'UG', 3, 'History',     'Paper II: Mughal Period',         '2026-05-03', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 3, 'History',     'Paper I: Early Modern India',     '2026-05-01', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 3, 'History',     'Paper II: Mughal Period',         '2026-05-03', '11:30:00'),

('Arts', 'Collegiate',     'UG', 3, 'Pol Sc',      'Paper I: Int. Relations',         '2026-05-04', '11:30:00'),
('Arts', 'Collegiate',     'UG', 3, 'Pol Sc',      'Paper II: Panchayati Raj',        '2026-05-06', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 3, 'Pol Sc',      'Paper I: Int. Relations',         '2026-05-04', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 3, 'Pol Sc',      'Paper II: Panchayati Raj',        '2026-05-06', '11:30:00'),

('Arts', 'Collegiate',     'UG', 3, 'Geography',   'Paper I: Cartography',            '2026-05-07', '11:30:00'),
('Arts', 'Collegiate',     'UG', 3, 'Geography',   'Paper II: Economic Geography',    '2026-05-09', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 3, 'Geography',   'Paper I: Cartography',            '2026-05-07', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 3, 'Geography',   'Paper II: Economic Geography',    '2026-05-09', '11:30:00'),

('Arts', 'Collegiate',     'UG', 3, 'Sociology',   'Paper I: Family & Kinship',       '2026-05-10', '11:30:00'),
('Arts', 'Collegiate',     'UG', 3, 'Sociology',   'Paper II: Social Stratification', '2026-05-12', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 3, 'Sociology',   'Paper I: Family & Kinship',       '2026-05-10', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 3, 'Sociology',   'Paper II: Social Stratification', '2026-05-12', '11:30:00'),

('Arts', 'Collegiate',     'UG', 3, 'English Lit', 'Paper I: American Lit.',          '2026-05-13', '11:30:00'),
('Arts', 'Collegiate',     'UG', 3, 'English Lit', 'Paper II: Literary Theory',       '2026-05-15', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 3, 'English Lit', 'Paper I: American Lit.',          '2026-05-13', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 3, 'English Lit', 'Paper II: Literary Theory',       '2026-05-15', '11:30:00'),

('Arts', 'Collegiate',     'UG', 3, 'Economics',   'Paper I: Public Finance',         '2026-05-16', '11:30:00'),
('Arts', 'Collegiate',     'UG', 3, 'Economics',   'Paper II: Money & Banking',       '2026-05-18', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 3, 'Economics',   'Paper I: Public Finance',         '2026-05-16', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 3, 'Economics',   'Paper II: Money & Banking',       '2026-05-18', '11:30:00'),

('Arts', 'Collegiate',     'UG', 3, 'Sanskrit',    'Paper I: Ramayana',               '2026-05-19', '11:30:00'),
('Arts', 'Collegiate',     'UG', 3, 'Sanskrit',    'Paper II: Mahabharata',           '2026-05-21', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 3, 'Sanskrit',    'Paper I: Ramayana',               '2026-05-19', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 3, 'Sanskrit',    'Paper II: Mahabharata',           '2026-05-21', '11:30:00'),

('Arts', 'Collegiate',     'UG', 3, 'Hindi',       'Paper I: Bhakti Kavya',           '2026-05-22', '11:30:00'),
('Arts', 'Collegiate',     'UG', 3, 'Hindi',       'Paper II: Ritikal Kavya',         '2026-05-24', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 3, 'Hindi',       'Paper I: Bhakti Kavya',           '2026-05-22', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 3, 'Hindi',       'Paper II: Ritikal Kavya',         '2026-05-24', '11:30:00'),

('Arts', 'Collegiate',     'UG', 3, 'Philosophy',  'Paper I: Metaphysics',            '2026-05-25', '11:30:00'),
('Arts', 'Collegiate',     'UG', 3, 'Philosophy',  'Paper II: Epistemology',          '2026-05-27', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 3, 'Philosophy',  'Paper I: Metaphysics',            '2026-05-25', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 3, 'Philosophy',  'Paper II: Epistemology',          '2026-05-27', '11:30:00'),

('Arts', 'Collegiate',     'UG', 3, 'Psychology',  'Paper I: Developmental Psych.',   '2026-05-28', '11:30:00'),
('Arts', 'Collegiate',     'UG', 3, 'Psychology',  'Paper II: Educational Psych.',    '2026-05-30', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 3, 'Psychology',  'Paper I: Developmental Psych.',   '2026-05-28', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 3, 'Psychology',  'Paper II: Educational Psych.',    '2026-05-30', '11:30:00'),

-- =========================================================================
-- UG SEMESTER 4 - ARTS (Collegiate + Non-Collegiate)
-- =========================================================================

('Arts', 'Collegiate',     'UG', 4, 'History',     'Paper I: Modern India',           '2026-05-10', '11:30:00'),
('Arts', 'Collegiate',     'UG', 4, 'History',     'Paper II: Freedom Movement',      '2026-05-12', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'History',     'Paper I: Modern India',           '2026-05-10', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'History',     'Paper II: Freedom Movement',      '2026-05-12', '11:30:00'),

('Arts', 'Collegiate',     'UG', 4, 'Pol Sc',      'Paper I: Political Parties',      '2026-05-14', '11:30:00'),
('Arts', 'Collegiate',     'UG', 4, 'Pol Sc',      'Paper II: Federalism in India',   '2026-05-16', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'Pol Sc',      'Paper I: Political Parties',      '2026-05-14', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'Pol Sc',      'Paper II: Federalism in India',   '2026-05-16', '11:30:00'),

('Arts', 'Collegiate',     'UG', 4, 'Geography',   'Paper I: Population Geography',   '2026-05-17', '11:30:00'),
('Arts', 'Collegiate',     'UG', 4, 'Geography',   'Paper II: Regional Planning',     '2026-05-19', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'Geography',   'Paper I: Population Geography',   '2026-05-17', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'Geography',   'Paper II: Regional Planning',     '2026-05-19', '11:30:00'),

('Arts', 'Collegiate',     'UG', 4, 'Sociology',   'Paper I: Rural Sociology',        '2026-05-20', '11:30:00'),
('Arts', 'Collegiate',     'UG', 4, 'Sociology',   'Paper II: Gender Studies',        '2026-05-22', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'Sociology',   'Paper I: Rural Sociology',        '2026-05-20', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'Sociology',   'Paper II: Gender Studies',        '2026-05-22', '11:30:00'),

('Arts', 'Collegiate',     'UG', 4, 'English Lit', 'Paper I: Post-Colonial Lit.',     '2026-05-23', '11:30:00'),
('Arts', 'Collegiate',     'UG', 4, 'English Lit', 'Paper II: Indian Lit. in Eng.',   '2026-05-25', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'English Lit', 'Paper I: Post-Colonial Lit.',     '2026-05-23', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'English Lit', 'Paper II: Indian Lit. in Eng.',   '2026-05-25', '11:30:00'),

('Arts', 'Collegiate',     'UG', 4, 'Economics',   'Paper I: Statistics for Eco.',    '2026-05-18', '11:30:00'),
('Arts', 'Collegiate',     'UG', 4, 'Economics',   'Paper II: International Trade',   '2026-05-20', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'Economics',   'Paper I: Statistics for Eco.',    '2026-05-18', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'Economics',   'Paper II: International Trade',   '2026-05-20', '11:30:00'),

('Arts', 'Collegiate',     'UG', 4, 'Sanskrit',    'Paper I: Arthashastra',           '2026-05-21', '11:30:00'),
('Arts', 'Collegiate',     'UG', 4, 'Sanskrit',    'Paper II: Sanskrit Grammar',      '2026-05-23', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'Sanskrit',    'Paper I: Arthashastra',           '2026-05-21', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'Sanskrit',    'Paper II: Sanskrit Grammar',      '2026-05-23', '11:30:00'),

('Arts', 'Collegiate',     'UG', 4, 'Hindi',       'Paper I: Aadhunik Kavya',         '2026-05-24', '11:30:00'),
('Arts', 'Collegiate',     'UG', 4, 'Hindi',       'Paper II: Natak Sahitya',         '2026-05-26', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'Hindi',       'Paper I: Aadhunik Kavya',         '2026-05-24', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'Hindi',       'Paper II: Natak Sahitya',         '2026-05-26', '11:30:00'),

('Arts', 'Collegiate',     'UG', 4, 'Philosophy',  'Paper I: Social Philosophy',      '2026-05-27', '11:30:00'),
('Arts', 'Collegiate',     'UG', 4, 'Philosophy',  'Paper II: Philosophy of Religion','2026-05-29', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'Philosophy',  'Paper I: Social Philosophy',      '2026-05-27', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'Philosophy',  'Paper II: Philosophy of Religion','2026-05-29', '11:30:00'),

('Arts', 'Collegiate',     'UG', 4, 'Psychology',  'Paper I: Industrial Psych.',      '2026-05-28', '11:30:00'),
('Arts', 'Collegiate',     'UG', 4, 'Psychology',  'Paper II: Clinical Psychology',   '2026-05-30', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'Psychology',  'Paper I: Industrial Psych.',      '2026-05-28', '11:30:00'),
('Arts', 'Non-Collegiate', 'UG', 4, 'Psychology',  'Paper II: Clinical Psychology',   '2026-05-30', '11:30:00'),

-- =========================================================================
-- UG SEMESTER 5 - ARTS (Collegiate + Non-Collegiate)
-- =========================================================================

('Arts', 'Collegiate',     'UG', 5, 'History',     'Paper I: Indian Nationalism',     '2026-05-01', '15:00:00'),
('Arts', 'Collegiate',     'UG', 5, 'History',     'Paper II: Post-Indep. India',     '2026-05-03', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 5, 'History',     'Paper I: Indian Nationalism',     '2026-05-01', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 5, 'History',     'Paper II: Post-Indep. India',     '2026-05-03', '15:00:00'),

('Arts', 'Collegiate',     'UG', 5, 'Pol Sc',      'Paper I: Governance & Policy',    '2026-05-04', '15:00:00'),
('Arts', 'Collegiate',     'UG', 5, 'Pol Sc',      'Paper II: Political Thought',     '2026-05-06', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 5, 'Pol Sc',      'Paper I: Governance & Policy',    '2026-05-04', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 5, 'Pol Sc',      'Paper II: Political Thought',     '2026-05-06', '15:00:00'),

('Arts', 'Collegiate',     'UG', 5, 'Geography',   'Paper I: Environmental Geo.',     '2026-05-07', '15:00:00'),
('Arts', 'Collegiate',     'UG', 5, 'Geography',   'Paper II: Disaster Management',   '2026-05-09', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 5, 'Geography',   'Paper I: Environmental Geo.',     '2026-05-07', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 5, 'Geography',   'Paper II: Disaster Management',   '2026-05-09', '15:00:00'),

('Arts', 'Collegiate',     'UG', 5, 'Sociology',   'Paper I: Industrial Sociology',   '2026-05-10', '15:00:00'),
('Arts', 'Collegiate',     'UG', 5, 'Sociology',   'Paper II: Sociology of Religion', '2026-05-12', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 5, 'Sociology',   'Paper I: Industrial Sociology',   '2026-05-10', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 5, 'Sociology',   'Paper II: Sociology of Religion', '2026-05-12', '15:00:00'),

('Arts', 'Collegiate',     'UG', 5, 'Economics',   'Paper I: Econometrics',           '2026-05-13', '15:00:00'),
('Arts', 'Collegiate',     'UG', 5, 'Economics',   'Paper II: Agricultural Economics','2026-05-15', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 5, 'Economics',   'Paper I: Econometrics',           '2026-05-13', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 5, 'Economics',   'Paper II: Agricultural Economics','2026-05-15', '15:00:00'),

('Arts', 'Collegiate',     'UG', 5, 'Hindi',       'Paper I: Swatantryottar Sahitya', '2026-05-16', '15:00:00'),
('Arts', 'Collegiate',     'UG', 5, 'Hindi',       'Paper II: Bhasha Vigyan',         '2026-05-18', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 5, 'Hindi',       'Paper I: Swatantryottar Sahitya', '2026-05-16', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 5, 'Hindi',       'Paper II: Bhasha Vigyan',         '2026-05-18', '15:00:00'),

('Arts', 'Collegiate',     'UG', 5, 'English Lit', 'Paper I: Modern British Lit.',    '2026-05-19', '15:00:00'),
('Arts', 'Collegiate',     'UG', 5, 'English Lit', 'Paper II: Research Methods',      '2026-05-21', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 5, 'English Lit', 'Paper I: Modern British Lit.',    '2026-05-19', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 5, 'English Lit', 'Paper II: Research Methods',      '2026-05-21', '15:00:00'),

-- =========================================================================
-- UG SEMESTER 6 - ARTS (Collegiate + Non-Collegiate)
-- =========================================================================

('Arts', 'Collegiate',     'UG', 6, 'History',     'Paper I: Comparative History',    '2026-05-22', '15:00:00'),
('Arts', 'Collegiate',     'UG', 6, 'History',     'Paper II: Contemporary India',    '2026-05-24', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 6, 'History',     'Paper I: Comparative History',    '2026-05-22', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 6, 'History',     'Paper II: Contemporary India',    '2026-05-24', '15:00:00'),

('Arts', 'Collegiate',     'UG', 6, 'Pol Sc',      'Paper I: Human Rights',           '2026-05-25', '15:00:00'),
('Arts', 'Collegiate',     'UG', 6, 'Pol Sc',      'Paper II: Global Politics',       '2026-05-27', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 6, 'Pol Sc',      'Paper I: Human Rights',           '2026-05-25', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 6, 'Pol Sc',      'Paper II: Global Politics',       '2026-05-27', '15:00:00'),

('Arts', 'Collegiate',     'UG', 6, 'Geography',   'Paper I: GIS & Remote Sensing',   '2026-05-28', '15:00:00'),
('Arts', 'Collegiate',     'UG', 6, 'Geography',   'Paper II: Geopolitics',           '2026-05-30', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 6, 'Geography',   'Paper I: GIS & Remote Sensing',   '2026-05-28', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 6, 'Geography',   'Paper II: Geopolitics',           '2026-05-30', '15:00:00'),

('Arts', 'Collegiate',     'UG', 6, 'Sociology',   'Paper I: Rural Sociology',        '2026-05-25', '15:00:00'),
('Arts', 'Collegiate',     'UG', 6, 'Sociology',   'Paper II: Social Thought',        '2026-05-27', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 6, 'Sociology',   'Paper I: Rural Sociology',        '2026-05-25', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 6, 'Sociology',   'Paper II: Social Thought',        '2026-05-27', '15:00:00'),

('Arts', 'Collegiate',     'UG', 6, 'Economics',   'Paper I: Environmental Eco.',     '2026-05-22', '15:00:00'),
('Arts', 'Collegiate',     'UG', 6, 'Economics',   'Paper II: Economic Planning',     '2026-05-24', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 6, 'Economics',   'Paper I: Environmental Eco.',     '2026-05-22', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 6, 'Economics',   'Paper II: Economic Planning',     '2026-05-24', '15:00:00'),

('Arts', 'Collegiate',     'UG', 6, 'Hindi',       'Paper I: Dalit Vimarsh',          '2026-05-29', '15:00:00'),
('Arts', 'Collegiate',     'UG', 6, 'Hindi',       'Paper II: Stri Vimarsh',          '2026-05-31', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 6, 'Hindi',       'Paper I: Dalit Vimarsh',          '2026-05-29', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 6, 'Hindi',       'Paper II: Stri Vimarsh',          '2026-05-31', '15:00:00'),

('Arts', 'Collegiate',     'UG', 6, 'English Lit', 'Paper I: World Literature',       '2026-06-01', '15:00:00'),
('Arts', 'Collegiate',     'UG', 6, 'English Lit', 'Paper II: Dissertation',          '2026-06-03', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 6, 'English Lit', 'Paper I: World Literature',       '2026-06-01', '15:00:00'),
('Arts', 'Non-Collegiate', 'UG', 6, 'English Lit', 'Paper II: Dissertation',          '2026-06-03', '15:00:00'),

-- =========================================================================
-- UG SEMESTER 1 - SCIENCE (Collegiate + Non-Collegiate)
-- =========================================================================

('Science', 'Collegiate',     'UG', 1, 'Physics',     'Paper I: Mechanics',              '2026-05-01', '08:00:00'),
('Science', 'Collegiate',     'UG', 1, 'Physics',     'Paper II: Thermal Physics',       '2026-05-03', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 1, 'Physics',     'Paper I: Mechanics',              '2026-05-01', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 1, 'Physics',     'Paper II: Thermal Physics',       '2026-05-03', '08:00:00'),

('Science', 'Collegiate',     'UG', 1, 'Chemistry',   'Paper I: Inorganic Chemistry',    '2026-05-04', '08:00:00'),
('Science', 'Collegiate',     'UG', 1, 'Chemistry',   'Paper II: Organic Chemistry I',   '2026-05-06', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 1, 'Chemistry',   'Paper I: Inorganic Chemistry',    '2026-05-04', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 1, 'Chemistry',   'Paper II: Organic Chemistry I',   '2026-05-06', '08:00:00'),

('Science', 'Collegiate',     'UG', 1, 'Mathematics', 'Paper I: Calculus',               '2026-05-07', '08:00:00'),
('Science', 'Collegiate',     'UG', 1, 'Mathematics', 'Paper II: Algebra',               '2026-05-09', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 1, 'Mathematics', 'Paper I: Calculus',               '2026-05-07', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 1, 'Mathematics', 'Paper II: Algebra',               '2026-05-09', '08:00:00'),

('Science', 'Collegiate',     'UG', 1, 'Biology',     'Paper I: Cell Biology',           '2026-05-10', '08:00:00'),
('Science', 'Collegiate',     'UG', 1, 'Biology',     'Paper II: Genetics',              '2026-05-12', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 1, 'Biology',     'Paper I: Cell Biology',           '2026-05-10', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 1, 'Biology',     'Paper II: Genetics',              '2026-05-12', '08:00:00'),

('Science', 'Collegiate',     'UG', 1, 'Botany',      'Paper I: Plant Morphology',       '2026-05-13', '08:00:00'),
('Science', 'Collegiate',     'UG', 1, 'Botany',      'Paper II: Plant Physiology',      '2026-05-15', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 1, 'Botany',      'Paper I: Plant Morphology',       '2026-05-13', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 1, 'Botany',      'Paper II: Plant Physiology',      '2026-05-15', '08:00:00'),

('Science', 'Collegiate',     'UG', 1, 'Zoology',     'Paper I: Animal Kingdom',         '2026-05-16', '08:00:00'),
('Science', 'Collegiate',     'UG', 1, 'Zoology',     'Paper II: Animal Physiology',     '2026-05-18', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 1, 'Zoology',     'Paper I: Animal Kingdom',         '2026-05-16', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 1, 'Zoology',     'Paper II: Animal Physiology',     '2026-05-18', '08:00:00'),

('Science', 'Collegiate',     'UG', 1, 'Computer Sc', 'Paper I: Prog. Fundamentals',     '2026-05-19', '08:00:00'),
('Science', 'Collegiate',     'UG', 1, 'Computer Sc', 'Paper II: Data Structures',       '2026-05-21', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 1, 'Computer Sc', 'Paper I: Prog. Fundamentals',     '2026-05-19', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 1, 'Computer Sc', 'Paper II: Data Structures',       '2026-05-21', '08:00:00'),

-- =========================================================================
-- UG SEMESTER 2 - SCIENCE (Collegiate + Non-Collegiate)
-- =========================================================================

('Science', 'Collegiate',     'UG', 2, 'Physics',     'Paper I: Optics',                 '2026-06-01', '08:00:00'),
('Science', 'Collegiate',     'UG', 2, 'Physics',     'Paper II: Electrostatics',        '2026-06-03', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 2, 'Physics',     'Paper I: Optics',                 '2026-06-01', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 2, 'Physics',     'Paper II: Electrostatics',        '2026-06-03', '08:00:00'),

('Science', 'Collegiate',     'UG', 2, 'Chemistry',   'Paper I: Physical Chemistry',     '2026-06-04', '08:00:00'),
('Science', 'Collegiate',     'UG', 2, 'Chemistry',   'Paper II: Organic Chemistry II',  '2026-06-06', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 2, 'Chemistry',   'Paper I: Physical Chemistry',     '2026-06-04', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 2, 'Chemistry',   'Paper II: Organic Chemistry II',  '2026-06-06', '08:00:00'),

('Science', 'Collegiate',     'UG', 2, 'Mathematics', 'Paper I: Differential Equations', '2026-06-07', '08:00:00'),
('Science', 'Collegiate',     'UG', 2, 'Mathematics', 'Paper II: Coordinate Geometry',   '2026-06-09', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 2, 'Mathematics', 'Paper I: Differential Equations', '2026-06-07', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 2, 'Mathematics', 'Paper II: Coordinate Geometry',   '2026-06-09', '08:00:00'),

('Science', 'Collegiate',     'UG', 2, 'Botany',      'Paper I: Ecology',                '2026-06-10', '08:00:00'),
('Science', 'Collegiate',     'UG', 2, 'Botany',      'Paper II: Plant Taxonomy',        '2026-06-12', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 2, 'Botany',      'Paper I: Ecology',                '2026-06-10', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 2, 'Botany',      'Paper II: Plant Taxonomy',        '2026-06-12', '08:00:00'),

('Science', 'Collegiate',     'UG', 2, 'Zoology',     'Paper I: Embryology',             '2026-06-13', '08:00:00'),
('Science', 'Collegiate',     'UG', 2, 'Zoology',     'Paper II: Parasitology',          '2026-06-15', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 2, 'Zoology',     'Paper I: Embryology',             '2026-06-13', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 2, 'Zoology',     'Paper II: Parasitology',          '2026-06-15', '08:00:00'),

('Science', 'Collegiate',     'UG', 2, 'Computer Sc', 'Paper I: OOP Concepts',           '2026-06-16', '08:00:00'),
('Science', 'Collegiate',     'UG', 2, 'Computer Sc', 'Paper II: Database Management',   '2026-06-18', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 2, 'Computer Sc', 'Paper I: OOP Concepts',           '2026-06-16', '08:00:00'),
('Science', 'Non-Collegiate', 'UG', 2, 'Computer Sc', 'Paper II: Database Management',   '2026-06-18', '08:00:00'),

-- =========================================================================
-- UG SEMESTER 3 & 4 - SCIENCE (Collegiate + Non-Collegiate)
-- =========================================================================

('Science', 'Collegiate',     'UG', 3, 'Physics',     'Paper I: Wave Motion',            '2026-05-01', '11:30:00'),
('Science', 'Collegiate',     'UG', 3, 'Physics',     'Paper II: Modern Physics',        '2026-05-03', '11:30:00'),
('Science', 'Non-Collegiate', 'UG', 3, 'Physics',     'Paper I: Wave Motion',            '2026-05-01', '11:30:00'),
('Science', 'Non-Collegiate', 'UG', 3, 'Physics',     'Paper II: Modern Physics',        '2026-05-03', '11:30:00'),

('Science', 'Collegiate',     'UG', 3, 'Chemistry',   'Paper I: Spectroscopy',           '2026-05-04', '11:30:00'),
('Science', 'Collegiate',     'UG', 3, 'Chemistry',   'Paper II: Analytical Chemistry',  '2026-05-06', '11:30:00'),
('Science', 'Non-Collegiate', 'UG', 3, 'Chemistry',   'Paper I: Spectroscopy',           '2026-05-04', '11:30:00'),
('Science', 'Non-Collegiate', 'UG', 3, 'Chemistry',   'Paper II: Analytical Chemistry',  '2026-05-06', '11:30:00'),

('Science', 'Collegiate',     'UG', 3, 'Mathematics', 'Paper I: Real Analysis',          '2026-05-07', '11:30:00'),
('Science', 'Collegiate',     'UG', 3, 'Mathematics', 'Paper II: Number Theory',         '2026-05-09', '11:30:00'),
('Science', 'Non-Collegiate', 'UG', 3, 'Mathematics', 'Paper I: Real Analysis',          '2026-05-07', '11:30:00'),
('Science', 'Non-Collegiate', 'UG', 3, 'Mathematics', 'Paper II: Number Theory',         '2026-05-09', '11:30:00'),

('Science', 'Collegiate',     'UG', 4, 'Physics',     'Paper I: Electromagnetics',       '2026-05-14', '11:30:00'),
('Science', 'Collegiate',     'UG', 4, 'Physics',     'Paper II: Solid State Physics',   '2026-05-16', '11:30:00'),
('Science', 'Non-Collegiate', 'UG', 4, 'Physics',     'Paper I: Electromagnetics',       '2026-05-14', '11:30:00'),
('Science', 'Non-Collegiate', 'UG', 4, 'Physics',     'Paper II: Solid State Physics',   '2026-05-16', '11:30:00'),

('Science', 'Collegiate',     'UG', 4, 'Chemistry',   'Paper I: Polymer Chemistry',      '2026-05-17', '11:30:00'),
('Science', 'Collegiate',     'UG', 4, 'Chemistry',   'Paper II: Industrial Chemistry',  '2026-05-19', '11:30:00'),
('Science', 'Non-Collegiate', 'UG', 4, 'Chemistry',   'Paper I: Polymer Chemistry',      '2026-05-17', '11:30:00'),
('Science', 'Non-Collegiate', 'UG', 4, 'Chemistry',   'Paper II: Industrial Chemistry',  '2026-05-19', '11:30:00'),

('Science', 'Collegiate',     'UG', 4, 'Mathematics', 'Paper I: Complex Analysis',       '2026-05-20', '11:30:00'),
('Science', 'Collegiate',     'UG', 4, 'Mathematics', 'Paper II: Numerical Methods',     '2026-05-22', '11:30:00'),
('Science', 'Non-Collegiate', 'UG', 4, 'Mathematics', 'Paper I: Complex Analysis',       '2026-05-20', '11:30:00'),
('Science', 'Non-Collegiate', 'UG', 4, 'Mathematics', 'Paper II: Numerical Methods',     '2026-05-22', '11:30:00'),

('Science', 'Collegiate',     'UG', 4, 'Botany',      'Paper I: Plant Biochemistry',     '2026-05-23', '11:30:00'),
('Science', 'Collegiate',     'UG', 4, 'Botany',      'Paper II: Microbiology',          '2026-05-25', '11:30:00'),
('Science', 'Non-Collegiate', 'UG', 4, 'Botany',      'Paper I: Plant Biochemistry',     '2026-05-23', '11:30:00'),
('Science', 'Non-Collegiate', 'UG', 4, 'Botany',      'Paper II: Microbiology',          '2026-05-25', '11:30:00'),

('Science', 'Collegiate',     'UG', 4, 'Zoology',     'Paper I: Immunology',             '2026-05-24', '11:30:00'),
('Science', 'Collegiate',     'UG', 4, 'Zoology',     'Paper II: Wildlife Biology',      '2026-05-26', '11:30:00'),
('Science', 'Non-Collegiate', 'UG', 4, 'Zoology',     'Paper I: Immunology',             '2026-05-24', '11:30:00'),
('Science', 'Non-Collegiate', 'UG', 4, 'Zoology',     'Paper II: Wildlife Biology',      '2026-05-26', '11:30:00'),

-- =========================================================================
-- UG SEMESTER 5 & 6 - SCIENCE (Collegiate + Non-Collegiate)
-- =========================================================================

('Science', 'Collegiate',     'UG', 5, 'Physics',     'Paper I: Quantum Mechanics',      '2026-05-01', '15:00:00'),
('Science', 'Collegiate',     'UG', 5, 'Physics',     'Paper II: Nuclear Physics',       '2026-05-03', '15:00:00'),
('Science', 'Non-Collegiate', 'UG', 5, 'Physics',     'Paper I: Quantum Mechanics',      '2026-05-01', '15:00:00'),
('Science', 'Non-Collegiate', 'UG', 5, 'Physics',     'Paper II: Nuclear Physics',       '2026-05-03', '15:00:00'),

('Science', 'Collegiate',     'UG', 5, 'Chemistry',   'Paper I: Coordination Compounds', '2026-05-04', '15:00:00'),
('Science', 'Collegiate',     'UG', 5, 'Chemistry',   'Paper II: Drug Chemistry',        '2026-05-06', '15:00:00'),
('Science', 'Non-Collegiate', 'UG', 5, 'Chemistry',   'Paper I: Coordination Compounds', '2026-05-04', '15:00:00'),
('Science', 'Non-Collegiate', 'UG', 5, 'Chemistry',   'Paper II: Drug Chemistry',        '2026-05-06', '15:00:00'),

('Science', 'Collegiate',     'UG', 5, 'Mathematics', 'Paper I: Linear Algebra',         '2026-05-07', '15:00:00'),
('Science', 'Collegiate',     'UG', 5, 'Mathematics', 'Paper II: Topology',              '2026-05-09', '15:00:00'),
('Science', 'Non-Collegiate', 'UG', 5, 'Mathematics', 'Paper I: Linear Algebra',         '2026-05-07', '15:00:00'),
('Science', 'Non-Collegiate', 'UG', 5, 'Mathematics', 'Paper II: Topology',              '2026-05-09', '15:00:00'),

('Science', 'Collegiate',     'UG', 5, 'Computer Sc', 'Paper I: Operating Systems',      '2026-05-10', '15:00:00'),
('Science', 'Collegiate',     'UG', 5, 'Computer Sc', 'Paper II: Computer Networks',     '2026-05-12', '15:00:00'),
('Science', 'Non-Collegiate', 'UG', 5, 'Computer Sc', 'Paper I: Operating Systems',      '2026-05-10', '15:00:00'),
('Science', 'Non-Collegiate', 'UG', 5, 'Computer Sc', 'Paper II: Computer Networks',     '2026-05-12', '15:00:00'),

('Science', 'Collegiate',     'UG', 6, 'Physics',     'Paper I: Astrophysics',           '2026-05-22', '15:00:00'),
('Science', 'Collegiate',     'UG', 6, 'Physics',     'Paper II: Electronics',           '2026-05-24', '15:00:00'),
('Science', 'Non-Collegiate', 'UG', 6, 'Physics',     'Paper I: Astrophysics',           '2026-05-22', '15:00:00'),
('Science', 'Non-Collegiate', 'UG', 6, 'Physics',     'Paper II: Electronics',           '2026-05-24', '15:00:00'),

('Science', 'Collegiate',     'UG', 6, 'Chemistry',   'Paper I: Nano Chemistry',         '2026-05-22', '15:00:00'),
('Science', 'Collegiate',     'UG', 6, 'Chemistry',   'Paper II: Environ. Chemistry',    '2026-05-24', '15:00:00'),
('Science', 'Non-Collegiate', 'UG', 6, 'Chemistry',   'Paper I: Nano Chemistry',         '2026-05-22', '15:00:00'),
('Science', 'Non-Collegiate', 'UG', 6, 'Chemistry',   'Paper II: Environ. Chemistry',    '2026-05-24', '15:00:00'),

('Science', 'Collegiate',     'UG', 6, 'Mathematics', 'Paper I: Operations Research',    '2026-05-25', '15:00:00'),
('Science', 'Collegiate',     'UG', 6, 'Mathematics', 'Paper II: Mathematical Modeling', '2026-05-27', '15:00:00'),
('Science', 'Non-Collegiate', 'UG', 6, 'Mathematics', 'Paper I: Operations Research',    '2026-05-25', '15:00:00'),
('Science', 'Non-Collegiate', 'UG', 6, 'Mathematics', 'Paper II: Mathematical Modeling', '2026-05-27', '15:00:00'),

('Science', 'Collegiate',     'UG', 6, 'Botany',      'Paper I: Plant Biotechnology',    '2026-05-26', '15:00:00'),
('Science', 'Collegiate',     'UG', 6, 'Botany',      'Paper II: Environmental Botany',  '2026-05-28', '15:00:00'),
('Science', 'Non-Collegiate', 'UG', 6, 'Botany',      'Paper I: Plant Biotechnology',    '2026-05-26', '15:00:00'),
('Science', 'Non-Collegiate', 'UG', 6, 'Botany',      'Paper II: Environmental Botany',  '2026-05-28', '15:00:00'),

('Science', 'Collegiate',     'UG', 6, 'Zoology',     'Paper I: Animal Biotechnology',   '2026-05-29', '15:00:00'),
('Science', 'Collegiate',     'UG', 6, 'Zoology',     'Paper II: Endocrinology',         '2026-05-31', '15:00:00'),
('Science', 'Non-Collegiate', 'UG', 6, 'Zoology',     'Paper I: Animal Biotechnology',   '2026-05-29', '15:00:00'),
('Science', 'Non-Collegiate', 'UG', 6, 'Zoology',     'Paper II: Endocrinology',         '2026-05-31', '15:00:00'),

('Science', 'Collegiate',     'UG', 6, 'Computer Sc', 'Paper I: Artificial Intelligence','2026-06-01', '15:00:00'),
('Science', 'Collegiate',     'UG', 6, 'Computer Sc', 'Paper II: Software Engineering',  '2026-06-03', '15:00:00'),
('Science', 'Non-Collegiate', 'UG', 6, 'Computer Sc', 'Paper I: Artificial Intelligence','2026-06-01', '15:00:00'),
('Science', 'Non-Collegiate', 'UG', 6, 'Computer Sc', 'Paper II: Software Engineering',  '2026-06-03', '15:00:00'),

-- =========================================================================
-- UG SEMESTER 1 - COMMERCE (Collegiate + Non-Collegiate)
-- =========================================================================

('Commerce', 'Collegiate',     'UG', 1, 'Accountancy',  'Paper I: Financial Accounting',   '2026-05-01', '08:00:00'),
('Commerce', 'Collegiate',     'UG', 1, 'Accountancy',  'Paper II: Accounting Standards',  '2026-05-03', '08:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 1, 'Accountancy',  'Paper I: Financial Accounting',   '2026-05-01', '08:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 1, 'Accountancy',  'Paper II: Accounting Standards',  '2026-05-03', '08:00:00'),

('Commerce', 'Collegiate',     'UG', 1, 'Business Org', 'Paper I: Business Principles',    '2026-05-04', '08:00:00'),
('Commerce', 'Collegiate',     'UG', 1, 'Business Org', 'Paper II: Forms of Business',     '2026-05-06', '08:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 1, 'Business Org', 'Paper I: Business Principles',    '2026-05-04', '08:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 1, 'Business Org', 'Paper II: Forms of Business',     '2026-05-06', '08:00:00'),

('Commerce', 'Collegiate',     'UG', 1, 'Economics',    'Paper I: Business Economics',     '2026-05-07', '08:00:00'),
('Commerce', 'Collegiate',     'UG', 1, 'Economics',    'Paper II: Market Structures',     '2026-05-09', '08:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 1, 'Economics',    'Paper I: Business Economics',     '2026-05-07', '08:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 1, 'Economics',    'Paper II: Market Structures',     '2026-05-09', '08:00:00'),

('Commerce', 'Collegiate',     'UG', 1, 'Maths/Stats',  'Paper I: Business Mathematics',   '2026-05-10', '08:00:00'),
('Commerce', 'Collegiate',     'UG', 1, 'Maths/Stats',  'Paper II: Business Statistics',   '2026-05-12', '08:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 1, 'Maths/Stats',  'Paper I: Business Mathematics',   '2026-05-10', '08:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 1, 'Maths/Stats',  'Paper II: Business Statistics',   '2026-05-12', '08:00:00'),

-- =========================================================================
-- UG SEMESTER 2 - COMMERCE (Collegiate + Non-Collegiate)
-- =========================================================================

('Commerce', 'Collegiate',     'UG', 2, 'Accountancy',  'Paper I: Cost Accounting',        '2026-06-01', '08:00:00'),
('Commerce', 'Collegiate',     'UG', 2, 'Accountancy',  'Paper II: Corporate Accounting',  '2026-06-03', '08:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 2, 'Accountancy',  'Paper I: Cost Accounting',        '2026-06-01', '08:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 2, 'Accountancy',  'Paper II: Corporate Accounting',  '2026-06-03', '08:00:00'),

('Commerce', 'Collegiate',     'UG', 2, 'Business Law', 'Paper I: Mercantile Law',         '2026-06-04', '08:00:00'),
('Commerce', 'Collegiate',     'UG', 2, 'Business Law', 'Paper II: Company Law',           '2026-06-06', '08:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 2, 'Business Law', 'Paper I: Mercantile Law',         '2026-06-04', '08:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 2, 'Business Law', 'Paper II: Company Law',           '2026-06-06', '08:00:00'),

('Commerce', 'Collegiate',     'UG', 2, 'Economics',    'Paper I: Macroeconomics',         '2026-06-07', '08:00:00'),
('Commerce', 'Collegiate',     'UG', 2, 'Economics',    'Paper II: Indian Economic Policy','2026-06-09', '08:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 2, 'Economics',    'Paper I: Macroeconomics',         '2026-06-07', '08:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 2, 'Economics',    'Paper II: Indian Economic Policy','2026-06-09', '08:00:00'),

('Commerce', 'Collegiate',     'UG', 2, 'Maths/Stats',  'Paper I: Probability Theory',     '2026-06-10', '08:00:00'),
('Commerce', 'Collegiate',     'UG', 2, 'Maths/Stats',  'Paper II: Index Numbers',         '2026-06-12', '08:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 2, 'Maths/Stats',  'Paper I: Probability Theory',     '2026-06-10', '08:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 2, 'Maths/Stats',  'Paper II: Index Numbers',         '2026-06-12', '08:00:00'),

-- =========================================================================
-- UG SEMESTER 3 & 4 - COMMERCE (Collegiate + Non-Collegiate)
-- =========================================================================

('Commerce', 'Collegiate',     'UG', 3, 'Accountancy',  'Paper I: Management Accounting',  '2026-05-01', '11:30:00'),
('Commerce', 'Collegiate',     'UG', 3, 'Accountancy',  'Paper II: Tax Accounting',        '2026-05-03', '11:30:00'),
('Commerce', 'Non-Collegiate', 'UG', 3, 'Accountancy',  'Paper I: Management Accounting',  '2026-05-01', '11:30:00'),
('Commerce', 'Non-Collegiate', 'UG', 3, 'Accountancy',  'Paper II: Tax Accounting',        '2026-05-03', '11:30:00'),

('Commerce', 'Collegiate',     'UG', 3, 'Business Law', 'Paper I: Banking Law',            '2026-05-04', '11:30:00'),
('Commerce', 'Collegiate',     'UG', 3, 'Business Law', 'Paper II: Consumer Protection',   '2026-05-06', '11:30:00'),
('Commerce', 'Non-Collegiate', 'UG', 3, 'Business Law', 'Paper I: Banking Law',            '2026-05-04', '11:30:00'),
('Commerce', 'Non-Collegiate', 'UG', 3, 'Business Law', 'Paper II: Consumer Protection',   '2026-05-06', '11:30:00'),

('Commerce', 'Collegiate',     'UG', 3, 'Marketing',    'Paper I: Marketing Management',   '2026-05-07', '11:30:00'),
('Commerce', 'Collegiate',     'UG', 3, 'Marketing',    'Paper II: Consumer Behaviour',    '2026-05-09', '11:30:00'),
('Commerce', 'Non-Collegiate', 'UG', 3, 'Marketing',    'Paper I: Marketing Management',   '2026-05-07', '11:30:00'),
('Commerce', 'Non-Collegiate', 'UG', 3, 'Marketing',    'Paper II: Consumer Behaviour',    '2026-05-09', '11:30:00'),

('Commerce', 'Collegiate',     'UG', 4, 'EAFM',         'Paper I: Economic Env.',          '2026-05-18', '11:30:00'),
('Commerce', 'Collegiate',     'UG', 4, 'EAFM',         'Paper II: Business Finance',      '2026-05-20', '11:30:00'),
('Commerce', 'Non-Collegiate', 'UG', 4, 'EAFM',         'Paper I: Economic Env.',          '2026-05-18', '11:30:00'),
('Commerce', 'Non-Collegiate', 'UG', 4, 'EAFM',         'Paper II: Business Finance',      '2026-05-20', '11:30:00'),

('Commerce', 'Collegiate',     'UG', 4, 'Accountancy',  'Paper I: Auditing',               '2026-05-21', '11:30:00'),
('Commerce', 'Collegiate',     'UG', 4, 'Accountancy',  'Paper II: Financial Mgmt.',       '2026-05-23', '11:30:00'),
('Commerce', 'Non-Collegiate', 'UG', 4, 'Accountancy',  'Paper I: Auditing',               '2026-05-21', '11:30:00'),
('Commerce', 'Non-Collegiate', 'UG', 4, 'Accountancy',  'Paper II: Financial Mgmt.',       '2026-05-23', '11:30:00'),

('Commerce', 'Collegiate',     'UG', 4, 'Marketing',    'Paper I: Sales Management',       '2026-05-24', '11:30:00'),
('Commerce', 'Collegiate',     'UG', 4, 'Marketing',    'Paper II: Retail Management',     '2026-05-26', '11:30:00'),
('Commerce', 'Non-Collegiate', 'UG', 4, 'Marketing',    'Paper I: Sales Management',       '2026-05-24', '11:30:00'),
('Commerce', 'Non-Collegiate', 'UG', 4, 'Marketing',    'Paper II: Retail Management',     '2026-05-26', '11:30:00'),

-- =========================================================================
-- UG SEMESTER 5 & 6 - COMMERCE (Collegiate + Non-Collegiate)
-- =========================================================================

('Commerce', 'Collegiate',     'UG', 5, 'EAFM',         'Paper I: Indian Capital Market',  '2026-05-01', '15:00:00'),
('Commerce', 'Collegiate',     'UG', 5, 'EAFM',         'Paper II: Financial Instruments', '2026-05-03', '15:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 5, 'EAFM',         'Paper I: Indian Capital Market',  '2026-05-01', '15:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 5, 'EAFM',         'Paper II: Financial Instruments', '2026-05-03', '15:00:00'),

('Commerce', 'Collegiate',     'UG', 5, 'Accountancy',  'Paper I: Income Tax Law',         '2026-05-04', '15:00:00'),
('Commerce', 'Collegiate',     'UG', 5, 'Accountancy',  'Paper II: GST & Indirect Tax',    '2026-05-06', '15:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 5, 'Accountancy',  'Paper I: Income Tax Law',         '2026-05-04', '15:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 5, 'Accountancy',  'Paper II: GST & Indirect Tax',    '2026-05-06', '15:00:00'),

('Commerce', 'Collegiate',     'UG', 5, 'Marketing',    'Paper I: Digital Marketing',      '2026-05-07', '15:00:00'),
('Commerce', 'Collegiate',     'UG', 5, 'Marketing',    'Paper II: E-Commerce',            '2026-05-09', '15:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 5, 'Marketing',    'Paper I: Digital Marketing',      '2026-05-07', '15:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 5, 'Marketing',    'Paper II: E-Commerce',            '2026-05-09', '15:00:00'),

('Commerce', 'Collegiate',     'UG', 6, 'EAFM',         'Paper I: Portfolio Mgmt.',        '2026-05-22', '15:00:00'),
('Commerce', 'Collegiate',     'UG', 6, 'EAFM',         'Paper II: International Finance', '2026-05-24', '15:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 6, 'EAFM',         'Paper I: Portfolio Mgmt.',        '2026-05-22', '15:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 6, 'EAFM',         'Paper II: International Finance', '2026-05-24', '15:00:00'),

('Commerce', 'Collegiate',     'UG', 6, 'Accountancy',  'Paper I: Forensic Accounting',    '2026-05-25', '15:00:00'),
('Commerce', 'Collegiate',     'UG', 6, 'Accountancy',  'Paper II: Corporate Governance',  '2026-05-27', '15:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 6, 'Accountancy',  'Paper I: Forensic Accounting',    '2026-05-25', '15:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 6, 'Accountancy',  'Paper II: Corporate Governance',  '2026-05-27', '15:00:00'),

('Commerce', 'Collegiate',     'UG', 6, 'Marketing',    'Paper I: Brand Management',       '2026-05-26', '15:00:00'),
('Commerce', 'Collegiate',     'UG', 6, 'Marketing',    'Paper II: International Mktg.',   '2026-05-28', '15:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 6, 'Marketing',    'Paper I: Brand Management',       '2026-05-26', '15:00:00'),
('Commerce', 'Non-Collegiate', 'UG', 6, 'Marketing',    'Paper II: International Mktg.',   '2026-05-28', '15:00:00'),

-- =========================================================================
-- POST GRADUATE (PG) SEMESTER 1 - ARTS
-- =========================================================================

('Arts', 'Collegiate', 'PG', 1, 'Hindi Lit',    'Paper I: Ancient Poetry',          '2026-06-01', '08:00:00'),
('Arts', 'Collegiate', 'PG', 1, 'Hindi Lit',    'Paper II: Sahitya Path',           '2026-06-03', '08:00:00'),
('Arts', 'Collegiate', 'PG', 1, 'Geography',    'Paper I: Geomorphology',           '2026-06-01', '08:00:00'),
('Arts', 'Collegiate', 'PG', 1, 'Geography',    'Paper II: Climatology',            '2026-06-03', '08:00:00'),
('Arts', 'Collegiate', 'PG', 1, 'History',      'Paper I: Ancient Civilizations',   '2026-06-02', '08:00:00'),
('Arts', 'Collegiate', 'PG', 1, 'History',      'Paper II: Source Methodology',     '2026-06-04', '08:00:00'),
('Arts', 'Collegiate', 'PG', 1, 'Economics',    'Paper I: Advanced Microeconomics', '2026-06-05', '08:00:00'),
('Arts', 'Collegiate', 'PG', 1, 'Economics',    'Paper II: Mathematical Economics', '2026-06-07', '08:00:00'),
('Arts', 'Collegiate', 'PG', 1, 'Pol Sc',       'Paper I: Political Theory',        '2026-06-06', '08:00:00'),
('Arts', 'Collegiate', 'PG', 1, 'Pol Sc',       'Paper II: Indian Govt. & Politics','2026-06-08', '08:00:00'),
('Arts', 'Collegiate', 'PG', 1, 'Sociology',    'Paper I: Classical Sociologists',  '2026-06-09', '08:00:00'),
('Arts', 'Collegiate', 'PG', 1, 'Sociology',    'Paper II: Research Methods',       '2026-06-11', '08:00:00'),
('Arts', 'Collegiate', 'PG', 1, 'English Lit',  'Paper I: Renaissance Poetry',      '2026-06-10', '08:00:00'),
('Arts', 'Collegiate', 'PG', 1, 'English Lit',  'Paper II: Elizabethan Drama',      '2026-06-12', '08:00:00'),
('Arts', 'Collegiate', 'PG', 1, 'Psychology',   'Paper I: Advanced General Psych.', '2026-06-13', '08:00:00'),
('Arts', 'Collegiate', 'PG', 1, 'Psychology',   'Paper II: Personality Theories',   '2026-06-15', '08:00:00'),

-- =========================================================================
-- PG SEMESTER 2 - ARTS
-- =========================================================================

('Arts', 'Collegiate', 'PG', 2, 'Hindi Lit',    'Paper I: Medieval Poetry',         '2026-06-10', '08:00:00'),
('Arts', 'Collegiate', 'PG', 2, 'Hindi Lit',    'Paper II: Modern Prose',           '2026-06-12', '08:00:00'),
('Arts', 'Collegiate', 'PG', 2, 'Geography',    'Paper I: Hydrology',               '2026-06-10', '08:00:00'),
('Arts', 'Collegiate', 'PG', 2, 'Geography',    'Paper II: Urban Geography',         '2026-06-12', '08:00:00'),
('Arts', 'Collegiate', 'PG', 2, 'History',      'Paper I: Medieval Indian History', '2026-06-11', '08:00:00'),
('Arts', 'Collegiate', 'PG', 2, 'History',      'Paper II: Bhakti & Sufi Movement', '2026-06-13', '08:00:00'),
('Arts', 'Collegiate', 'PG', 2, 'Economics',    'Paper I: Advanced Macroeconomics', '2026-06-14', '08:00:00'),
('Arts', 'Collegiate', 'PG', 2, 'Economics',    'Paper II: Public Sector Economics','2026-06-16', '08:00:00'),
('Arts', 'Collegiate', 'PG', 2, 'Pol Sc',       'Paper I: Comparative Politics',    '2026-06-15', '08:00:00'),
('Arts', 'Collegiate', 'PG', 2, 'Pol Sc',       'Paper II: Public Policy Analysis', '2026-06-17', '08:00:00'),
('Arts', 'Collegiate', 'PG', 2, 'Sociology',    'Paper I: Modern Sociologists',     '2026-06-18', '08:00:00'),
('Arts', 'Collegiate', 'PG', 2, 'Sociology',    'Paper II: Social Movements',       '2026-06-20', '08:00:00'),
('Arts', 'Collegiate', 'PG', 2, 'Psychology',   'Paper I: Cognitive Psychology',    '2026-06-19', '08:00:00'),
('Arts', 'Collegiate', 'PG', 2, 'Psychology',   'Paper II: Psychopathology',        '2026-06-21', '08:00:00'),

-- =========================================================================
-- PG SEMESTER 3 - ARTS
-- =========================================================================

('Arts', 'Collegiate', 'PG', 3, 'Hindi Lit',    'Paper I: Literary Criticism',      '2026-06-15', '08:00:00'),
('Arts', 'Collegiate', 'PG', 3, 'Hindi Lit',    'Paper II: Specialized Author',     '2026-06-17', '08:00:00'),
('Arts', 'Collegiate', 'PG', 3, 'Geography',    'Paper I: Agri Geography',          '2026-06-15', '08:00:00'),
('Arts', 'Collegiate', 'PG', 3, 'Geography',    'Paper II: Economic Geography',     '2026-06-17', '08:00:00'),
('Arts', 'Collegiate', 'PG', 3, 'History',      'Paper I: Colonial India',          '2026-06-16', '08:00:00'),
('Arts', 'Collegiate', 'PG', 3, 'History',      'Paper II: Nationalist Movement',   '2026-06-18', '08:00:00'),
('Arts', 'Collegiate', 'PG', 3, 'Economics',    'Paper I: International Economics', '2026-06-19', '08:00:00'),
('Arts', 'Collegiate', 'PG', 3, 'Economics',    'Paper II: Welfare Economics',      '2026-06-21', '08:00:00'),
('Arts', 'Collegiate', 'PG', 3, 'Pol Sc',       'Paper I: International Relations', '2026-06-20', '08:00:00'),
('Arts', 'Collegiate', 'PG', 3, 'Pol Sc',       'Paper II: South Asian Politics',   '2026-06-22', '08:00:00'),
('Arts', 'Collegiate', 'PG', 3, 'Sociology',    'Paper I: Tribal Sociology',        '2026-06-23', '08:00:00'),
('Arts', 'Collegiate', 'PG', 3, 'Sociology',    'Paper II: Caste and Class',        '2026-06-25', '08:00:00'),
('Arts', 'Collegiate', 'PG', 3, 'Psychology',   'Paper I: Counseling Psychology',   '2026-06-24', '08:00:00'),
('Arts', 'Collegiate', 'PG', 3, 'Psychology',   'Paper II: Health Psychology',      '2026-06-26', '08:00:00'),

-- =========================================================================
-- PG SEMESTER 4 - ARTS
-- =========================================================================

('Arts', 'Collegiate', 'PG', 4, 'Hindi Lit',    'Paper I: Adhunik Kavya',           '2026-06-20', '08:00:00'),
('Arts', 'Collegiate', 'PG', 4, 'Hindi Lit',    'Paper II: Thesis/Project',         '2026-06-22', '08:00:00'),
('Arts', 'Collegiate', 'PG', 4, 'Geography',    'Paper I: Urban Geography',         '2026-06-20', '08:00:00'),
('Arts', 'Collegiate', 'PG', 4, 'Geography',    'Paper II: Research Methodology',   '2026-06-22', '08:00:00'),
('Arts', 'Collegiate', 'PG', 4, 'History',      'Paper I: Post-Independence India', '2026-06-21', '08:00:00'),
('Arts', 'Collegiate', 'PG', 4, 'History',      'Paper II: Dissertation',           '2026-06-23', '08:00:00'),
('Arts', 'Collegiate', 'PG', 4, 'Economics',    'Paper I: Monetary Economics',      '2026-06-24', '08:00:00'),
('Arts', 'Collegiate', 'PG', 4, 'Economics',    'Paper II: Dissertation',           '2026-06-26', '08:00:00'),
('Arts', 'Collegiate', 'PG', 4, 'Pol Sc',       'Paper I: Peace & Conflict Studies','2026-06-25', '08:00:00'),
('Arts', 'Collegiate', 'PG', 4, 'Pol Sc',       'Paper II: Dissertation',           '2026-06-27', '08:00:00'),
('Arts', 'Collegiate', 'PG', 4, 'Sociology',    'Paper I: Contemporary Soc. Issues','2026-06-26', '08:00:00'),
('Arts', 'Collegiate', 'PG', 4, 'Sociology',    'Paper II: Dissertation',           '2026-06-28', '08:00:00'),
('Arts', 'Collegiate', 'PG', 4, 'Psychology',   'Paper I: Organizational Psych.',   '2026-06-27', '08:00:00'),
('Arts', 'Collegiate', 'PG', 4, 'Psychology',   'Paper II: Dissertation',           '2026-06-29', '08:00:00'),

-- =========================================================================
-- PG SEMESTER 1-4 - SCIENCE (Collegiate)
-- =========================================================================

-- PG Sem 1 Science
('Science', 'Collegiate', 'PG', 1, 'Physics',     'Paper I: Classical Mechanics',    '2026-06-01', '11:30:00'),
('Science', 'Collegiate', 'PG', 1, 'Physics',     'Paper II: Mathematical Physics',  '2026-06-03', '11:30:00'),
('Science', 'Collegiate', 'PG', 1, 'Chemistry',   'Paper I: Advanced Inorganic',     '2026-06-02', '11:30:00'),
('Science', 'Collegiate', 'PG', 1, 'Chemistry',   'Paper II: Advanced Organic',      '2026-06-04', '11:30:00'),
('Science', 'Collegiate', 'PG', 1, 'Mathematics', 'Paper I: Abstract Algebra',       '2026-06-05', '11:30:00'),
('Science', 'Collegiate', 'PG', 1, 'Mathematics', 'Paper II: Real Analysis',         '2026-06-07', '11:30:00'),
('Science', 'Collegiate', 'PG', 1, 'Botany',      'Paper I: Phycology',              '2026-06-06', '11:30:00'),
('Science', 'Collegiate', 'PG', 1, 'Botany',      'Paper II: Bryology',              '2026-06-08', '11:30:00'),
('Science', 'Collegiate', 'PG', 1, 'Zoology',     'Paper I: Advanced Cell Biology',  '2026-06-09', '11:30:00'),
('Science', 'Collegiate', 'PG', 1, 'Zoology',     'Paper II: Molecular Biology',     '2026-06-11', '11:30:00'),

-- PG Sem 2 Science
('Science', 'Collegiate', 'PG', 2, 'Physics',     'Paper I: Electrodynamics',        '2026-06-10', '11:30:00'),
('Science', 'Collegiate', 'PG', 2, 'Physics',     'Paper II: Statistical Mechanics', '2026-06-12', '11:30:00'),
('Science', 'Collegiate', 'PG', 2, 'Chemistry',   'Paper I: Physical Chemistry',     '2026-06-11', '11:30:00'),
('Science', 'Collegiate', 'PG', 2, 'Chemistry',   'Paper II: Quantum Chemistry',     '2026-06-13', '11:30:00'),
('Science', 'Collegiate', 'PG', 2, 'Mathematics', 'Paper I: Complex Analysis',       '2026-06-14', '11:30:00'),
('Science', 'Collegiate', 'PG', 2, 'Mathematics', 'Paper II: Functional Analysis',   '2026-06-16', '11:30:00'),
('Science', 'Collegiate', 'PG', 2, 'Botany',      'Paper I: Pteridology',            '2026-06-15', '11:30:00'),
('Science', 'Collegiate', 'PG', 2, 'Botany',      'Paper II: Plant Pathology',       '2026-06-17', '11:30:00'),
('Science', 'Collegiate', 'PG', 2, 'Zoology',     'Paper I: Animal Behaviour',       '2026-06-18', '11:30:00'),
('Science', 'Collegiate', 'PG', 2, 'Zoology',     'Paper II: Fishery Science',       '2026-06-20', '11:30:00'),

-- PG Sem 3 Science
('Science', 'Collegiate', 'PG', 3, 'Physics',     'Paper I: Quantum Field Theory',   '2026-06-15', '11:30:00'),
('Science', 'Collegiate', 'PG', 3, 'Physics',     'Paper II: Solid State Physics',   '2026-06-17', '11:30:00'),
('Science', 'Collegiate', 'PG', 3, 'Chemistry',   'Paper I: Organometallic Chem.',   '2026-06-16', '11:30:00'),
('Science', 'Collegiate', 'PG', 3, 'Chemistry',   'Paper II: Green Chemistry',       '2026-06-18', '11:30:00'),
('Science', 'Collegiate', 'PG', 3, 'Mathematics', 'Paper I: Differential Geometry',  '2026-06-19', '11:30:00'),
('Science', 'Collegiate', 'PG', 3, 'Mathematics', 'Paper II: Graph Theory',          '2026-06-21', '11:30:00'),
('Science', 'Collegiate', 'PG', 3, 'Botany',      'Paper I: Plant Biotechnology',    '2026-06-20', '11:30:00'),
('Science', 'Collegiate', 'PG', 3, 'Botany',      'Paper II: Genomics',              '2026-06-22', '11:30:00'),
('Science', 'Collegiate', 'PG', 3, 'Zoology',     'Paper I: Neurobiology',           '2026-06-23', '11:30:00'),
('Science', 'Collegiate', 'PG', 3, 'Zoology',     'Paper II: Bioinformatics',        '2026-06-25', '11:30:00'),

-- PG Sem 4 Science
('Science', 'Collegiate', 'PG', 4, 'Physics',     'Paper I: Plasma Physics',         '2026-06-20', '11:30:00'),
('Science', 'Collegiate', 'PG', 4, 'Physics',     'Paper II: Thesis/Project',        '2026-06-22', '11:30:00'),
('Science', 'Collegiate', 'PG', 4, 'Chemistry',   'Paper I: Supramolecular Chem.',   '2026-06-21', '11:30:00'),
('Science', 'Collegiate', 'PG', 4, 'Chemistry',   'Paper II: Dissertation',          '2026-06-23', '11:30:00'),
('Science', 'Collegiate', 'PG', 4, 'Mathematics', 'Paper I: Measure Theory',         '2026-06-24', '11:30:00'),
('Science', 'Collegiate', 'PG', 4, 'Mathematics', 'Paper II: Dissertation',          '2026-06-26', '11:30:00'),
('Science', 'Collegiate', 'PG', 4, 'Botany',      'Paper I: Proteomics',             '2026-06-25', '11:30:00'),
('Science', 'Collegiate', 'PG', 4, 'Botany',      'Paper II: Dissertation',          '2026-06-27', '11:30:00'),
('Science', 'Collegiate', 'PG', 4, 'Zoology',     'Paper I: Evolutionary Biology',   '2026-06-26', '11:30:00'),
('Science', 'Collegiate', 'PG', 4, 'Zoology',     'Paper II: Dissertation',          '2026-06-28', '11:30:00'),

-- =========================================================================
-- PG SEMESTER 1-4 - COMMERCE (Collegiate)
-- =========================================================================

-- PG Sem 1 Commerce
('Commerce', 'Collegiate', 'PG', 1, 'Management',  'Paper I: Principles of Mgmt.',    '2026-06-01', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 1, 'Management',  'Paper II: Organizational Behav.', '2026-06-03', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 1, 'Accountancy', 'Paper I: Advanced Accounting',    '2026-06-02', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 1, 'Accountancy', 'Paper II: Financial Reporting',   '2026-06-04', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 1, 'Finance',     'Paper I: Financial Mgmt.',        '2026-06-05', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 1, 'Finance',     'Paper II: Security Analysis',     '2026-06-07', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 1, 'Marketing',   'Paper I: Marketing Concepts',     '2026-06-06', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 1, 'Marketing',   'Paper II: Consumer Research',     '2026-06-08', '15:00:00'),

-- PG Sem 2 Commerce
('Commerce', 'Collegiate', 'PG', 2, 'Management',  'Paper I: Strategic Management',   '2026-06-10', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 2, 'Management',  'Paper II: Human Resource Mgmt.',  '2026-06-12', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 2, 'Accountancy', 'Paper I: Corporate Accounting',   '2026-06-11', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 2, 'Accountancy', 'Paper II: Taxation Law',          '2026-06-13', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 2, 'Finance',     'Paper I: Banking Operations',     '2026-06-14', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 2, 'Finance',     'Paper II: Derivatives & Risk',    '2026-06-16', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 2, 'Marketing',   'Paper I: Advertising Management', '2026-06-15', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 2, 'Marketing',   'Paper II: Distribution Mgmt.',    '2026-06-17', '15:00:00'),

-- PG Sem 3 Commerce
('Commerce', 'Collegiate', 'PG', 3, 'Management',  'Paper I: Project Management',     '2026-06-15', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 3, 'Management',  'Paper II: Entrepreneurship',      '2026-06-17', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 3, 'Accountancy', 'Paper I: International Acc.',     '2026-06-16', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 3, 'Accountancy', 'Paper II: Forensic Accounting',   '2026-06-18', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 3, 'Finance',     'Paper I: International Finance',  '2026-06-19', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 3, 'Finance',     'Paper II: Mergers & Acquisitions','2026-06-21', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 3, 'Marketing',   'Paper I: International Marketing','2026-06-20', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 3, 'Marketing',   'Paper II: Social Media Marketing','2026-06-22', '15:00:00'),

-- PG Sem 4 Commerce
('Commerce', 'Collegiate', 'PG', 4, 'Management',  'Paper I: Business Ethics',        '2026-06-20', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 4, 'Management',  'Paper II: Dissertation',          '2026-06-22', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 4, 'Accountancy', 'Paper I: Corporate Governance',   '2026-06-21', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 4, 'Accountancy', 'Paper II: Dissertation',          '2026-06-23', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 4, 'Finance',     'Paper I: Financial Planning',     '2026-06-24', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 4, 'Finance',     'Paper II: Dissertation',          '2026-06-26', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 4, 'Marketing',   'Paper I: Research Methodology',   '2026-06-25', '15:00:00'),
('Commerce', 'Collegiate', 'PG', 4, 'Marketing',   'Paper II: Dissertation',          '2026-06-27', '15:00:00');

-- =========================================================================
-- END OF EXAM SCHEDULE
-- Total Records: ~500+
-- Departments: Arts, Science, Commerce
-- Levels: UG (Sem 1-6), PG (Sem 1-4)
-- Status: Collegiate, Non-Collegiate (where applicable)
-- Time Slots: 08:00 (Sem 1-2), 11:30 (Sem 3-4), 15:00 (Sem 5-6 & PG)
-- =========================================================================