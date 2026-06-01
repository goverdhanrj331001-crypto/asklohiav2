-- MSJ College Supabase Database Schema
-- Run this in your Supabase SQL Editor to recreate your database

-- 1. Faculty Table
CREATE TABLE IF NOT EXISTS faculty (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    father_name TEXT,
    department TEXT NOT NULL,
    designation TEXT,
    subject TEXT,
    qualification TEXT,
    dob DATE,
    seniority_no TEXT,
    image_url TEXT,
    mobile_no TEXT,
    email TEXT,
    specialization TEXT,
    service_start_date DATE,
    college_join_date DATE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Events Table
CREATE TABLE IF NOT EXISTS events (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title TEXT NOT NULL,
    date DATE NOT NULL,
    time TIME,
    category TEXT,
    speakers TEXT,
    description TEXT,
    image_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. Gallery Table
CREATE TABLE IF NOT EXISTS gallery (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title TEXT NOT NULL,
    category TEXT,
    type TEXT DEFAULT 'image',
    media_url TEXT,
    media_urls TEXT[], -- For batch uploads
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4. Academic Alerts Table
CREATE TABLE IF NOT EXISTS academic_alerts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title TEXT NOT NULL,
    description TEXT,
    type TEXT DEFAULT 'info',
    target_stream TEXT DEFAULT 'All',
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 5. AI Configurations Table
CREATE TABLE IF NOT EXISTS ai_configurations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    provider_name TEXT NOT NULL,
    model_id TEXT NOT NULL,
    api_key TEXT NOT NULL,
    base_url TEXT,
    is_active BOOLEAN DEFAULT false,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 6. College Info Table
CREATE TABLE IF NOT EXISTS college_info (
    key TEXT PRIMARY KEY,
    value TEXT,
    image_url TEXT
);

-- 7. College Sections Table (History, Mission, etc)
CREATE TABLE IF NOT EXISTS college_sections (
    key TEXT PRIMARY KEY,
    title TEXT,
    value TEXT,
    image_url TEXT
);

-- 8. Student Profiles Table
CREATE TABLE IF NOT EXISTS student_profiles (
    user_email TEXT PRIMARY KEY,
    full_name TEXT NOT NULL,
    college_status TEXT, -- Collegiate / Non-Collegiate
    level TEXT,         -- Graduate / Post Graduate
    semester TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 9. Exam Subjects Table
CREATE TABLE IF NOT EXISTS exam_subjects (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    department TEXT NOT NULL
);

-- 10. Main Exams Table
CREATE TABLE IF NOT EXISTS main_exams (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    department TEXT NOT NULL,
    status TEXT,
    level TEXT,
    semester INTEGER,
    subject TEXT,
    paper TEXT,
    exam_date DATE,
    exam_time TIME
);

-- 11. Study Materials Table
CREATE TABLE IF NOT EXISTS study_materials (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    department TEXT NOT NULL,
    status TEXT,
    level TEXT,
    semester INTEGER,
    material_type TEXT,
    title TEXT,
    file_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 12. Practical Exam Batches Table
CREATE TABLE IF NOT EXISTS practical_batches (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    department TEXT NOT NULL,
    status TEXT,
    level TEXT,
    semester INTEGER,
    batch_no TEXT,
    exam_date DATE,
    exam_time TIME
);

-- 13. Practical Students Table
CREATE TABLE IF NOT EXISTS practical_students (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    batch_id UUID REFERENCES practical_batches(id) ON DELETE CASCADE,
    roll_no TEXT,
    name TEXT,
    father_name TEXT,
    seat_no TEXT,
    category TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 14. Achievements Table
CREATE TABLE IF NOT EXISTS achievements (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    category TEXT, -- achievement / research
    title TEXT NOT NULL,
    description TEXT,
    year TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 15. Past Principals Table
CREATE TABLE IF NOT EXISTS past_principals (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    from_date TEXT,
    to_date TEXT,
    order_index INTEGER DEFAULT 0
);

-- 16. Courses & Seats Table
CREATE TABLE IF NOT EXISTS courses (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL, -- e.g., B.A. Semester-I
    stream TEXT NOT NULL, -- Arts, Science, Commerce, Management
    subjects TEXT[], -- Array of optional papers
    total_seats INTEGER,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 17. Admission Support Files (Policy, Schedule)
CREATE TABLE IF NOT EXISTS admission_info (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title TEXT NOT NULL,
    file_url TEXT,
    description TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 18. Enable RLS and Policies for new tables
ALTER TABLE courses ENABLE ROW LEVEL SECURITY;
ALTER TABLE admission_info ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Public Read Courses" ON courses;
CREATE POLICY "Public Read Courses" ON courses FOR SELECT USING (true);

DROP POLICY IF EXISTS "Public Read Admission Info" ON admission_info;
CREATE POLICY "Public Read Admission Info" ON admission_info FOR SELECT USING (true);

DROP POLICY IF EXISTS "Authenticated All Courses" ON courses;
CREATE POLICY "Authenticated All Courses" ON courses FOR ALL TO authenticated USING (true);

DROP POLICY IF EXISTS "Authenticated All Admission Info" ON admission_info;
CREATE POLICY "Authenticated All Admission Info" ON admission_info FOR ALL TO authenticated USING (true);

-- 19. Initial Course Data (Using ON CONFLICT or just check)
-- INSERT INTO courses ... (omitting for brevity as it might duplicate)

-- 20. History Milestones Table
CREATE TABLE IF NOT EXISTS college_milestones (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    year TEXT NOT NULL,
    event_description TEXT NOT NULL,
    order_index INTEGER DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 21. Eligibility Criteria Table
CREATE TABLE IF NOT EXISTS eligibility_criteria (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    faculty TEXT NOT NULL, -- Arts, Science, Commerce
    level TEXT NOT NULL, -- UG, PG
    course_name TEXT,
    min_percentage NUMERIC,
    requirements TEXT,
    category_relaxation TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 22. Enable RLS and Policies
ALTER TABLE college_milestones ENABLE ROW LEVEL SECURITY;
ALTER TABLE eligibility_criteria ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Public Read Milestones" ON college_milestones;
CREATE POLICY "Public Read Milestones" ON college_milestones FOR SELECT USING (true);

DROP POLICY IF EXISTS "Public Read Eligibility" ON eligibility_criteria;
CREATE POLICY "Public Read Eligibility" ON eligibility_criteria FOR SELECT USING (true);

DROP POLICY IF EXISTS "Authenticated All Milestones" ON college_milestones;
CREATE POLICY "Authenticated All Milestones" ON college_milestones FOR ALL TO authenticated USING (true);

DROP POLICY IF EXISTS "Authenticated All Eligibility" ON eligibility_criteria;
CREATE POLICY "Authenticated All Eligibility" ON eligibility_criteria FOR ALL TO authenticated USING (true);

-- 17. Create Public "Select" Policies (Everyone can read)
DROP POLICY IF EXISTS "Public Read Faculty" ON faculty;
CREATE POLICY "Public Read Faculty" ON faculty FOR SELECT USING (true);

DROP POLICY IF EXISTS "Public Read Events" ON events;
CREATE POLICY "Public Read Events" ON events FOR SELECT USING (true);

DROP POLICY IF EXISTS "Public Read Gallery" ON gallery;
CREATE POLICY "Public Read Gallery" ON gallery FOR SELECT USING (true);

DROP POLICY IF EXISTS "Public Read Alerts" ON academic_alerts;
CREATE POLICY "Public Read Alerts" ON academic_alerts FOR SELECT USING (true);

DROP POLICY IF EXISTS "Public Read College Info" ON college_info;
CREATE POLICY "Public Read College Info" ON college_info FOR SELECT USING (true);

DROP POLICY IF EXISTS "Public Read College Sections" ON college_sections;
CREATE POLICY "Public Read College Sections" ON college_sections FOR SELECT USING (true);

DROP POLICY IF EXISTS "Public Read Exam Subjects" ON exam_subjects;
CREATE POLICY "Public Read Exam Subjects" ON exam_subjects FOR SELECT USING (true);

DROP POLICY IF EXISTS "Public Read Main Exams" ON main_exams;
CREATE POLICY "Public Read Main Exams" ON main_exams FOR SELECT USING (true);

DROP POLICY IF EXISTS "Public Read Study Materials" ON study_materials;
CREATE POLICY "Public Read Study Materials" ON study_materials FOR SELECT USING (true);

DROP POLICY IF EXISTS "Public Read Practical Batches" ON practical_batches;
CREATE POLICY "Public Read Practical Batches" ON practical_batches FOR SELECT USING (true);

DROP POLICY IF EXISTS "Public Read Practical Students" ON practical_students;
CREATE POLICY "Public Read Practical Students" ON practical_students FOR SELECT USING (true);

DROP POLICY IF EXISTS "Public Read Achievements" ON achievements;
CREATE POLICY "Public Read Achievements" ON achievements FOR SELECT USING (true);

DROP POLICY IF EXISTS "Public Read Past Principals" ON past_principals;
CREATE POLICY "Public Read Past Principals" ON past_principals FOR SELECT USING (true);

-- 18. Create Service Role "All" Policies (Admin bypass)
DROP POLICY IF EXISTS "Authenticated All Faculty" ON faculty;
CREATE POLICY "Authenticated All Faculty" ON faculty FOR ALL TO authenticated USING (true);

DROP POLICY IF EXISTS "Authenticated All Events" ON events;
CREATE POLICY "Authenticated All Events" ON events FOR ALL TO authenticated USING (true);

DROP POLICY IF EXISTS "Authenticated All Gallery" ON gallery;
CREATE POLICY "Authenticated All Gallery" ON gallery FOR ALL TO authenticated USING (true);

DROP POLICY IF EXISTS "Authenticated All Alerts" ON academic_alerts;
CREATE POLICY "Authenticated All Alerts" ON academic_alerts FOR ALL TO authenticated USING (true);

DROP POLICY IF EXISTS "Authenticated All AI Config" ON ai_configurations;
CREATE POLICY "Authenticated All AI Config" ON ai_configurations FOR ALL TO authenticated USING (true);

DROP POLICY IF EXISTS "Authenticated All Info" ON college_info;
CREATE POLICY "Authenticated All Info" ON college_info FOR ALL TO authenticated USING (true);

DROP POLICY IF EXISTS "Authenticated All Sections" ON college_sections;
CREATE POLICY "Authenticated All Sections" ON college_sections FOR ALL TO authenticated USING (true);

DROP POLICY IF EXISTS "Authenticated All Exams" ON main_exams;
CREATE POLICY "Authenticated All Exams" ON main_exams FOR ALL TO authenticated USING (true);

DROP POLICY IF EXISTS "Authenticated All Materials" ON study_materials;
CREATE POLICY "Authenticated All Materials" ON study_materials FOR ALL TO authenticated USING (true);

DROP POLICY IF EXISTS "Authenticated All Batches" ON practical_batches;
CREATE POLICY "Authenticated All Batches" ON practical_batches FOR ALL TO authenticated USING (true);

DROP POLICY IF EXISTS "Authenticated All Students" ON practical_students;
CREATE POLICY "Authenticated All Students" ON practical_students FOR ALL TO authenticated USING (true);

DROP POLICY IF EXISTS "Authenticated All Achievements" ON achievements;
CREATE POLICY "Authenticated All Achievements" ON achievements FOR ALL TO authenticated USING (true);

DROP POLICY IF EXISTS "Authenticated All Principals" ON past_principals;
CREATE POLICY "Authenticated All Principals" ON past_principals FOR ALL TO authenticated USING (true);
