-- ==============================================================================
-- 1. DROP OLD CONFUSING TABLES
-- ==============================================================================
DROP TABLE IF EXISTS public.college_sections CASCADE;
DROP TABLE IF EXISTS public.college_kb CASCADE;
DROP TABLE IF EXISTS public.exam_passing_rules CASCADE;
DROP TABLE IF EXISTS public.college_milestones CASCADE;
DROP TABLE IF EXISTS public.facilities CASCADE;
DROP TABLE IF EXISTS public.exam_guides CASCADE;
DROP TABLE IF EXISTS public.eligibility_criteria CASCADE;
DROP TABLE IF EXISTS public.exam_subject CASCADE;

-- Note: We are keeping 'faculty', 'events', 'study_materials', 'practical_batches', 
-- 'practical_students', 'achievements', 'main_exams', 'merit_list' as they are functional.
-- We are also keeping 'college_info' for now just in case you use it for system settings.

-- ==============================================================================
-- 2. CREATE NEW MASTER KNOWLEDGE TABLE
-- ==============================================================================
CREATE TABLE public.college_knowledge (
    id UUID DEFAULT extensions.uuid_generate_v4() PRIMARY KEY,
    category TEXT NOT NULL, -- e.g., 'Exam Rule', 'Facility', 'About', 'History'
    search_key TEXT UNIQUE NOT NULL, -- e.g., 'library', 'hostel', 'exam_passing'
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    image_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);

-- Index for fast searching
CREATE INDEX idx_college_knowledge_category ON public.college_knowledge(category);
CREATE INDEX idx_college_knowledge_key ON public.college_knowledge(search_key);

-- ==============================================================================
-- 3. CREATE NEW FAQS TABLE (For direct Student Questions)
-- ==============================================================================
CREATE TABLE public.college_faqs (
    id UUID DEFAULT extensions.uuid_generate_v4() PRIMARY KEY,
    question TEXT NOT NULL,
    answer TEXT NOT NULL,
    category TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);

-- ==============================================================================
-- 4. INSERT DEFAULT DATA INTO NEW MASTER TABLE
-- ==============================================================================
INSERT INTO public.college_knowledge (category, search_key, title, content) VALUES
('History', 'history', 'College History Summary', 'Founded in 1945 by Seth Kanhiya Lal Lohia, the college has a rich heritage. It started as a degree college and expanded its faculties over the decades.'),
('Facility', 'library', 'College Library & Reading Room', 'The library is rich with over 100,184 books. It features a spacious reading room accommodating 150 students, with access to leading national and local newspapers and magazines. Books are issued for a maximum of 14 days.'),
('About', 'founder', 'Founder: Seth Kanhiya Lal Lohia (1883-1959)', 'Born in 1883 in Churu. A prominent industrialist and philanthropist, he dedicated his life to education and established this college in 1945.'),
('Facility', 'hostel', 'Hostel Facility', 'The college has a well-maintained boy’s hostel. The hostel rooms are spacious and well ventilated. Currently, there are 43 rooms accommodating 100 students.'),
('About', 'vision', 'College Vision', 'To be a premier institution of academic excellence, nurturing future leaders and contributing to society through education and innovation.'),
('About', 'mission', 'College Mission', 'To provide holistic education, promote research, and instil moral values in students to make them responsible citizens.'),
('Exam Rule', 'exam_general', '1. MGSU Examination Overview', 'The Maharaja Ganga Singh University (MGSU) conducts UG and PG examinations annually and semester-wise.'),
('Exam Rule', 'exam_theory', '2. Theory Exam Pattern', 'Most UG theory papers consist of three sections: Section A (short answer, 10 questions), Section B (medium answer, 5 questions), and Section C (long answer/essay type).'),
('Exam Rule', 'exam_practical', '3. Practical Examination System', 'For science and geography students, practicals are mandatory. A minimum of 36% marks in practicals is required to pass the subject.'),
('Exam Rule', 'exam_passing', '4. Passing & Back Rules', 'A student must score a minimum of 36% aggregate in each subject to pass. If a student fails in one subject but passes the rest, they may be eligible for a supplementary (back) exam.'),
('Exam Rule', 'exam_cbc_grading', '5. CBCS Grading (SGPA/CGPA)', 'Under the CBCS system, students are evaluated based on SGPA and CGPA. An SGPA of 4.0 or above is generally required to pass the semester.');
