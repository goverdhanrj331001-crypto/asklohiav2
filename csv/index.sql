-- 1. सबसे पहले सर्च पावर बढ़ाने के लिए एक्सटेंशन इनेबल करें
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- 2. college_merit_list (नाम और कोर्स सर्च के लिए)
CREATE INDEX IF NOT EXISTS idx_merit_name_trgm ON college_merit_list USING gin (student_name gin_trgm_ops);
CREATE INDEX IF NOT EXISTS idx_merit_course_trgm ON college_merit_list USING gin (board_type gin_trgm_ops);

-- 3. past_principals (नाम सर्च के लिए)
CREATE INDEX IF NOT EXISTS idx_principals_name_trgm ON past_principals USING gin (name gin_trgm_ops);

-- 4. faculty (नाम और डिपार्टमेंट सर्च के लिए)
CREATE INDEX IF NOT EXISTS idx_faculty_name_trgm ON faculty USING gin (name gin_trgm_ops);
CREATE INDEX IF NOT EXISTS idx_faculty_dept_trgm ON faculty USING gin (department gin_trgm_ops);

-- 5. sports (खेल के नाम के लिए)
CREATE INDEX IF NOT EXISTS idx_sports_activity_trgm ON sports USING gin (sport gin_trgm_ops);

-- 6. B-tree indexes (Exact matches जैसे कि Year के लिए)
CREATE INDEX IF NOT EXISTS idx_merit_year ON college_merit_list (exam_year);
CREATE INDEX IF NOT EXISTS idx_principals_order ON past_principals (order_index);


new inedxes


-- Main exams: Physics paper kab hai type queries ke liye
CREATE INDEX IF NOT EXISTS idx_main_exams_filter
ON public.main_exams (status, level, semester, exam_date);

CREATE INDEX IF NOT EXISTS idx_main_exams_subject_trgm
ON public.main_exams USING gin (subject gin_trgm_ops);

CREATE INDEX IF NOT EXISTS idx_main_exams_department_trgm
ON public.main_exams USING gin (department gin_trgm_ops);

-- Study materials filters ke liye
CREATE INDEX IF NOT EXISTS idx_study_materials_filter
ON public.study_materials (level, semester, material_type, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_study_materials_department_trgm
ON public.study_materials USING gin (department gin_trgm_ops);

-- Sports: football + year queries ke liye
CREATE INDEX IF NOT EXISTS idx_sports_year_sport
ON public.sports (year, sport);

CREATE INDEX IF NOT EXISTS idx_sports_student_trgm
ON public.sports USING gin (student_name gin_trgm_ops);

CREATE INDEX IF NOT EXISTS idx_sports_remarks_trgm
ON public.sports USING gin (remarks gin_trgm_ops);

-- Gallery/latest programme photos ke liye
CREATE INDEX IF NOT EXISTS idx_gallery_created_at
ON public.gallery (created_at DESC);

CREATE INDEX IF NOT EXISTS idx_gallery_title_trgm
ON public.gallery USING gin (title gin_trgm_ops);

CREATE INDEX IF NOT EXISTS idx_gallery_category_trgm
ON public.gallery USING gin (category gin_trgm_ops);

-- Notices/latest notification ke liye
CREATE INDEX IF NOT EXISTS idx_academic_alerts_latest
ON public.academic_alerts (is_active, created_at DESC);

-- Practical batch/student search ke liye
CREATE INDEX IF NOT EXISTS idx_practical_batches_filter
ON public.practical_batches (department, status, level, semester, exam_date);

CREATE INDEX IF NOT EXISTS idx_practical_students_batch_id
ON public.practical_students (batch_id);

CREATE INDEX IF NOT EXISTS idx_practical_students_name_trgm
ON public.practical_students USING gin (name gin_trgm_ops);