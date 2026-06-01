-- ========================================================
-- LOHIA COLLEGE - MASTER DATABASE REBUILD SCRIPT (FIXED V4)
-- Fixes: GIN NULL Crash (coalesce) + Expanded Search Functions
-- Total Tables: 28 | All 11 tables in match_college_data
--                  | All 11 tables in global_context_search
-- ========================================================

-- 1. EXTENSIONS
create extension if not exists "vector";
create extension if not exists "uuid-ossp";

-- ========================================================
-- HELPER FUNCTIONS FOR IMMUTABLE INDEXES
-- ========================================================
create or replace function immutable_array_to_string(arr text[], sep text)
returns text as $$
    select array_to_string(arr, sep);
$$ language sql immutable parallel safe strict;

-- ========================================================
-- 2. FACULTY & STAFF
-- ========================================================
create table if not exists faculty (
    id uuid default uuid_generate_v4() primary key,
    name text not null,
    father_name text,
    department text not null,
    designation text,
    subject text,
    qualification text,
    dob date,
    seniority_no text,
    image_url text,
    mobile_no text,
    email text,
    specialization text,
    service_start_date date,
    college_join_date date,
    embedding vector(1536),
    created_at timestamp with time zone default timezone('utc'::text, now()),
    updated_at timestamp with time zone default timezone('utc'::text, now())
);
create index if not exists idx_faculty_embedding on faculty using hnsw (embedding vector_cosine_ops);

-- FIX: designation, subject, specialization sab nullable hain — coalesce lagaya
drop index if exists idx_faculty_gin;
create index idx_faculty_gin on faculty using gin(
    to_tsvector('english',
        coalesce(name, '') || ' ' ||
        coalesce(department, '') || ' ' ||
        coalesce(designation, '') || ' ' ||
        coalesce(subject, '') || ' ' ||
        coalesce(specialization, '') || ' ' ||
        coalesce(qualification, '')
    )
);

-- ========================================================
-- 3. EVENTS & NEWS
-- ========================================================
create table if not exists events (
    id uuid default uuid_generate_v4() primary key,
    title text not null,
    date date not null,
    time text,
    category text,
    speakers text,
    description text,
    image_url text,
    embedding vector(1536),
    created_at timestamp with time zone default timezone('utc'::text, now())
);
create index if not exists idx_events_date on events(date desc);
create index if not exists idx_events_embedding on events using hnsw (embedding vector_cosine_ops);

-- FIX: description, category, speakers sab nullable — coalesce + speakers add kiya
drop index if exists idx_events_gin;
create index idx_events_gin on events using gin(
    to_tsvector('english',
        coalesce(title, '') || ' ' ||
        coalesce(description, '') || ' ' ||
        coalesce(category, '') || ' ' ||
        coalesce(speakers, '')
    )
);

-- ========================================================
-- 4. ACADEMIC ALERTS / NOTIFICATIONS
-- ========================================================
create table if not exists academic_alerts (
    id uuid default uuid_generate_v4() primary key,
    title text not null,
    description text not null,
    type text default 'info',
    target_stream text default 'All',
    is_active boolean default true,
    attachments jsonb default '[]'::jsonb,
    expires_at timestamp with time zone,
    embedding vector(1536),
    created_at timestamp with time zone default timezone('utc'::text, now())
);
create index if not exists idx_alerts_active on academic_alerts(is_active);
create index if not exists idx_academic_alerts_embedding on academic_alerts using hnsw (embedding vector_cosine_ops);

-- FIX: target_stream aur type bhi searchable hone chahiye
drop index if exists idx_alerts_gin;
create index idx_alerts_gin on academic_alerts using gin(
    to_tsvector('english',
        coalesce(title, '') || ' ' ||
        coalesce(description, '') || ' ' ||
        coalesce(target_stream, '') || ' ' ||
        coalesce(type, '')
    )
);

-- ========================================================
-- 5. GALLERY
-- ========================================================
create table if not exists gallery (
    id uuid default uuid_generate_v4() primary key,
    title text not null,
    category text,
    type text default 'image',
    media_url text,
    media_urls text[],
    tags text[],
    embedding vector(1536),
    created_at timestamp with time zone default timezone('utc'::text, now())
);

create index if not exists idx_gallery_embedding on gallery using hnsw (embedding vector_cosine_ops);

-- FIX: category nullable tha, coalesce add kiya
drop index if exists idx_gallery_gin;
create index idx_gallery_gin on gallery using gin(
    to_tsvector('english',
        coalesce(title, '') || ' ' ||
        coalesce(category, '') || ' ' ||
        coalesce(immutable_array_to_string(tags, ' '), '')
    )
);

-- ========================================================
-- 6. COLLEGE SECTIONS (Static/Wiki)
-- ========================================================
create table if not exists college_sections (
    id uuid default uuid_generate_v4() primary key,
    key text unique not null,
    title text not null,
    content text not null,
    image_url text,
    embedding vector(1536),
    updated_at timestamp with time zone default timezone('utc'::text, now())
);
-- title aur content dono NOT NULL hain — yahan crash risk nahi tha
-- lekin coalesce best practice ke liye add kiya
drop index if exists idx_sections_gin;
create index idx_sections_gin on college_sections using gin(
    to_tsvector('english',
        coalesce(title, '') || ' ' ||
        coalesce(content, '')
    )
);
create index if not exists idx_sections_embedding on college_sections using hnsw (embedding vector_cosine_ops);

-- ========================================================
-- 7. COLLEGE KB (Knowledge Base)
-- ========================================================
create table if not exists college_kb (
    id uuid default uuid_generate_v4() primary key,
    category text not null,
    question text not null,
    answer text not null,
    embedding vector(1536),
    created_at timestamp with time zone default timezone('utc'::text, now())
);
create index if not exists idx_college_kb_embedding on college_kb using hnsw (embedding vector_cosine_ops);

-- sab NOT NULL hain — safe hai, phir bhi coalesce
drop index if exists idx_kb_gin;
create index idx_kb_gin on college_kb using gin(
    to_tsvector('english',
        coalesce(question, '') || ' ' ||
        coalesce(answer, '') || ' ' ||
        coalesce(category, '')
    )
);

-- ========================================================
-- 8. MATERIALS
-- ========================================================
create table if not exists materials (
    id uuid default uuid_generate_v4() primary key,
    title text not null,
    files jsonb default '[]'::jsonb,
    embedding vector(1536),
    created_at timestamp with time zone default timezone('utc'::text, now())
);
create index if not exists idx_materials_embedding on materials using hnsw (embedding vector_cosine_ops);

drop index if exists idx_materials_gin;
create index idx_materials_gin on materials using gin(
    to_tsvector('english', coalesce(title, ''))
);

-- ========================================================
-- 9. VOICE LIMITS (Fingerprinting)
-- ========================================================
create table if not exists voice_limits (
    fingerprint_id text primary key,
    question_count integer default 0,
    limit_reached_at timestamp with time zone,
    updated_at timestamp with time zone default timezone('utc'::text, now())
);

-- ========================================================
-- 10. COURSES & SEATS
-- ========================================================
create table if not exists courses (
    id uuid default uuid_generate_v4() primary key,
    name text not null,
    stream text not null,
    subjects text[],
    total_seats integer,
    admission_start_date date,
    admission_last_date date,
    convener_name text,
    convener_contact text,
    embedding vector(1536),
    created_at timestamp with time zone default timezone('utc'::text, now())
);

create index if not exists idx_courses_embedding on courses using hnsw (embedding vector_cosine_ops);

-- FIX: convener_name nullable — coalesce add kiya
drop index if exists idx_courses_gin;
create index idx_courses_gin on courses using gin(
    to_tsvector('english',
        coalesce(name, '') || ' ' ||
        coalesce(stream, '') || ' ' ||
        coalesce(convener_name, '') || ' ' ||
        coalesce(immutable_array_to_string(subjects, ' '), '')
    )
);

-- ========================================================
-- 11. MAIN EXAMS SCHEDULE
-- ========================================================
create table if not exists main_exams (
    id uuid default uuid_generate_v4() primary key,
    department text not null,
    status text,
    level text,
    semester integer,
    subject text,
    paper text,
    exam_date date,
    exam_time time,
    embedding vector(1536),
    created_at timestamp with time zone default timezone('utc'::text, now())
);

create index if not exists idx_main_exams_embedding on main_exams using hnsw (embedding vector_cosine_ops);

-- FIX: subject, paper dono nullable — coalesce lagaya
drop index if exists idx_main_exams_gin;
create index idx_main_exams_gin on main_exams using gin(
    to_tsvector('english',
        coalesce(subject, '') || ' ' ||
        coalesce(paper, '') || ' ' ||
        coalesce(department, '') || ' ' ||
        coalesce(level, '') || ' ' ||
        coalesce(status, '')
    )
);

-- ========================================================
-- 12. STUDY MATERIALS (Notes)
-- ========================================================
create table if not exists study_materials (
    id uuid default uuid_generate_v4() primary key,
    department text not null,
    status text,
    level text,
    semester integer,
    material_type text,
    title text,
    file_url text not null,
    file_type text,
    embedding vector(1536),
    created_at timestamp with time zone default timezone('utc'::text, now())
);

create index if not exists idx_study_materials_embedding on study_materials using hnsw (embedding vector_cosine_ops);

-- FIX: title nullable hai! coalesce critical hai yahan
drop index if exists idx_study_materials_gin;
create index idx_study_materials_gin on study_materials using gin(
    to_tsvector('english',
        coalesce(title, '') || ' ' ||
        coalesce(department, '') || ' ' ||
        coalesce(material_type, '') || ' ' ||
        coalesce(level, '')
    )
);

-- ========================================================
-- 13. PRACTICAL EXAM BATCHES
-- ========================================================
create table if not exists practical_batches (
    id uuid default uuid_generate_v4() primary key,
    department text not null,
    status text,
    level text,
    semester integer,
    batch_no text,
    exam_date date,
    exam_time time,
    created_at timestamp with time zone default timezone('utc'::text, now())
);

-- ========================================================
-- 14. PRACTICAL STUDENTS
-- ========================================================
create table if not exists practical_students (
    id uuid default uuid_generate_v4() primary key,
    batch_id uuid references practical_batches(id) on delete cascade,
    roll_no text not null,
    name text not null,
    father_name text,
    seat_no text,
    category text,
    created_at timestamp with time zone default timezone('utc'::text, now())
);

-- FIX: father_name aur seat_no nullable — coalesce add kiya
drop index if exists idx_practical_students_gin;
create index idx_practical_students_gin on practical_students using gin(
    to_tsvector('english',
        coalesce(name, '') || ' ' ||
        coalesce(roll_no, '') || ' ' ||
        coalesce(father_name, '') || ' ' ||
        coalesce(seat_no, '')
    )
);

-- ========================================================
-- 14b. EXAM SUBJECTS (For Admin Dropdown)
-- ========================================================
create table if not exists exam_subjects (
    id uuid default uuid_generate_v4() primary key,
    name text not null,
    department text not null,
    created_at timestamp with time zone default timezone('utc'::text, now())
);

-- ========================================================
-- 15. ACHIEVEMENTS & RESEARCH
-- ========================================================
create table if not exists achievements (
    id uuid default uuid_generate_v4() primary key,
    category text,
    title text not null,
    student_name text,
    description text,
    year text,
    image_url text,
    embedding vector(1536),
    created_at timestamp with time zone default timezone('utc'::text, now())
);

create index if not exists idx_achievements_embedding on achievements using hnsw (embedding vector_cosine_ops);

-- FIX: student_name, description, category, year sab nullable — sabko coalesce
drop index if exists idx_achievements_gin;
create index idx_achievements_gin on achievements using gin(
    to_tsvector('english',
        coalesce(title, '') || ' ' ||
        coalesce(student_name, '') || ' ' ||
        coalesce(description, '') || ' ' ||
        coalesce(category, '') || ' ' ||
        coalesce(year, '')
    )
);

-- ========================================================
-- 16. PAST PRINCIPALS
-- ========================================================
create table if not exists past_principals (
    id uuid default uuid_generate_v4() primary key,
    name text not null,
    from_date text,
    to_date text,
    order_index integer default 0,
    image_url text,
    bio text,
    embedding vector(1536),
    created_at timestamp with time zone default timezone('utc'::text, now())
);

create index if not exists idx_past_principals_embedding on past_principals using hnsw (embedding vector_cosine_ops);

-- FIX: bio nullable — coalesce
drop index if exists idx_past_principals_gin;
create index idx_past_principals_gin on past_principals using gin(
    to_tsvector('english',
        coalesce(name, '') || ' ' ||
        coalesce(bio, '')
    )
);

-- ========================================================
-- 17. ADMISSION INFO & DOCUMENTS
-- ========================================================
create table if not exists admission_info (
    id uuid default uuid_generate_v4() primary key,
    title text not null,
    file_url text,
    description text,
    category text,
    is_active boolean default true,
    embedding vector(1536),
    created_at timestamp with time zone default timezone('utc'::text, now())
);

create index if not exists idx_admission_info_embedding on admission_info using hnsw (embedding vector_cosine_ops);

-- FIX: description, category nullable — coalesce
drop index if exists idx_admission_gin;
create index idx_admission_gin on admission_info using gin(
    to_tsvector('english',
        coalesce(title, '') || ' ' ||
        coalesce(description, '') || ' ' ||
        coalesce(category, '')
    )
);

-- ========================================================
-- 18. COLLEGE MILESTONES
-- ========================================================
create table if not exists college_milestones (
    id uuid default uuid_generate_v4() primary key,
    year text not null,
    event_description text not null,
    order_index integer default 0,
    embedding vector(1536),
    created_at timestamp with time zone default timezone('utc'::text, now())
);
create index if not exists idx_college_milestones_embedding on college_milestones using hnsw (embedding vector_cosine_ops);

-- ========================================================
-- 19. ELIGIBILITY CRITERIA
-- ========================================================
create table if not exists eligibility_criteria (
    id uuid default uuid_generate_v4() primary key,
    faculty text not null,
    level text not null,
    course_name text,
    min_percentage numeric,
    requirements text,
    category_relaxation text,
    embedding vector(1536),
    created_at timestamp with time zone default timezone('utc'::text, now())
);
create index if not exists idx_eligibility_criteria_embedding on eligibility_criteria using hnsw (embedding vector_cosine_ops);

-- ========================================================
-- 20. COLLEGE MERIT LIST
-- ========================================================
create table if not exists college_merit_list (
    id bigserial primary key,
    board_type text not null,
    exam_year text not null,
    student_name text not null,
    division text,
    position_in_college text,
    remarks text,
    embedding vector(1536),
    created_at timestamp with time zone default timezone('utc'::text, now())
);
create index if not exists idx_college_merit_list_embedding on college_merit_list using hnsw (embedding vector_cosine_ops);

-- ========================================================
-- 21. EXAM PASSING RULES
-- ========================================================
create table if not exists exam_passing_rules (
    id uuid default uuid_generate_v4() primary key,
    stream text not null,
    subject text not null,
    theory_max_marks integer,
    theory_pass_marks integer,
    practical_max_marks integer default 0,
    practical_pass_marks integer default 0,
    total_max_marks integer,
    notes text,
    embedding vector(1536),
    created_at timestamp with time zone default timezone('utc'::text, now())
);
create index if not exists idx_exam_passing_rules_embedding on exam_passing_rules using hnsw (embedding vector_cosine_ops);

-- ========================================================
-- 22. FACILITIES (Hostels, Labs, Library)
-- ========================================================
create table if not exists facilities (
    id uuid default uuid_generate_v4() primary key,
    name text not null,
    category text,
    description text,
    image_urls text[],
    fees_info text,
    embedding vector(1536),
    created_at timestamp with time zone default timezone('utc'::text, now())
);

create index if not exists idx_facilities_embedding on facilities using hnsw (embedding vector_cosine_ops);

-- FIX: description, category, fees_info nullable — coalesce
drop index if exists idx_facilities_gin;
create index idx_facilities_gin on facilities using gin(
    to_tsvector('english',
        coalesce(name, '') || ' ' ||
        coalesce(description, '') || ' ' ||
        coalesce(category, '') || ' ' ||
        coalesce(fees_info, '')
    )
);



-- ========================================================
-- 24. STUDENT PROFILES
-- ========================================================
create table if not exists student_profiles (
    id uuid default uuid_generate_v4() primary key,
    user_email text unique not null,
    full_name text,
    phone text,
    college_status text,
    level text,
    semester text,
    subject text,
    avatar_url text,
    id_card_url text,
    created_at timestamp with time zone default timezone('utc'::text, now()),
    updated_at timestamp with time zone default timezone('utc'::text, now())
);

-- ========================================================
-- 25. EXAM GUIDES (MGSU Specific)
-- ========================================================
create table if not exists exam_guides (
    id uuid default uuid_generate_v4() primary key,
    title text not null,
    content text not null,
    category text,
    file_url text,
    embedding vector(1536),
    created_at timestamp with time zone default timezone('utc'::text, now())
);

create index if not exists idx_exam_guides_embedding on exam_guides using hnsw (embedding vector_cosine_ops);

-- FIX: category nullable — coalesce
drop index if exists idx_exam_guides_gin;
create index idx_exam_guides_gin on exam_guides using gin(
    to_tsvector('english',
        coalesce(title, '') || ' ' ||
        coalesce(content, '') || ' ' ||
        coalesce(category, '')
    )
);

-- ========================================================
-- 26. AI CONFIGURATIONS (System)
-- ========================================================
create table if not exists ai_configurations (
    id uuid default uuid_generate_v4() primary key,
    provider_name text not null,
    model_id text not null,
    api_key text not null,
    base_url text,
    is_active boolean default false,
    created_at timestamp with time zone default timezone('utc'::text, now()),
    updated_at timestamp with time zone default timezone('utc'::text, now())
);


-- ========================================================
-- 28. COLLEGE INFO (Quick Stats)
-- ========================================================
create table if not exists college_info (
    key text primary key,
    value text,
    image_url text
);

-- ========================================================
-- RLS POLICIES (Public Read Access)
-- ========================================================
alter table faculty enable row level security;
alter table events enable row level security;
alter table gallery enable row level security;
alter table academic_alerts enable row level security;
alter table college_sections enable row level security;
alter table college_kb enable row level security;
alter table courses enable row level security;
alter table facilities enable row level security;
alter table student_profiles enable row level security;
alter table exam_subjects enable row level security;
alter table college_info enable row level security;
alter table exam_guides enable row level security;

drop policy if exists "Public Read Faculty" on faculty;
create policy "Public Read Faculty" on faculty for select using (true);

drop policy if exists "Public Read Events" on events;
create policy "Public Read Events" on events for select using (true);

drop policy if exists "Public Read Alerts" on academic_alerts;
create policy "Public Read Alerts" on academic_alerts for select using (true);

drop policy if exists "Public Read Gallery" on gallery;
create policy "Public Read Gallery" on gallery for select using (true);

drop policy if exists "Public Read Sections" on college_sections;
create policy "Public Read Sections" on college_sections for select using (true);

drop policy if exists "Public Read KB" on college_kb;
create policy "Public Read KB" on college_kb for select using (true);

drop policy if exists "Public Read Courses" on courses;
create policy "Public Read Courses" on courses for select using (true);

drop policy if exists "Public Read Facilities" on facilities;
create policy "Public Read Facilities" on facilities for select using (true);

drop policy if exists "Public Read Exam Guides" on exam_guides;
create policy "Public Read Exam Guides" on exam_guides for select using (true);

drop policy if exists "Public Manage Profiles" on student_profiles;
create policy "Public Manage Profiles" on student_profiles for all using (true) with check (true);

drop policy if exists "Public Read Exam Subjects" on exam_subjects;
create policy "Public Read Exam Subjects" on exam_subjects for select using (true);

drop policy if exists "Public Manage Exam Subjects" on exam_subjects;
create policy "Public Manage Exam Subjects" on exam_subjects for all using (true) with check (true);

drop policy if exists "Public Read College Info" on college_info;
create policy "Public Read College Info" on college_info for select using (true);

drop policy if exists "Public Manage College Info" on college_info;
create policy "Public Manage College Info" on college_info for all using (true) with check (true);

drop policy if exists "Public Manage Faculty" on faculty;
create policy "Public Manage Faculty" on faculty for all using (true) with check (true);

drop policy if exists "Public Manage Events" on events;
create policy "Public Manage Events" on events for all using (true) with check (true);

drop policy if exists "Public Manage Alerts" on academic_alerts;
create policy "Public Manage Alerts" on academic_alerts for all using (true) with check (true);

drop policy if exists "Public Manage Gallery" on gallery;
create policy "Public Manage Gallery" on gallery for all using (true) with check (true);

drop policy if exists "Public Manage Sections" on college_sections;
create policy "Public Manage Sections" on college_sections for all using (true) with check (true);

drop policy if exists "Public Manage KB" on college_kb;
create policy "Public Manage KB" on college_kb for all using (true) with check (true);

drop policy if exists "Public Manage Courses" on courses;
create policy "Public Manage Courses" on courses for all using (true) with check (true);

drop policy if exists "Public Manage Facilities" on facilities;
create policy "Public Manage Facilities" on facilities for all using (true) with check (true);

drop policy if exists "Public Manage Exam Guides" on exam_guides;
create policy "Public Manage Exam Guides" on exam_guides for all using (true) with check (true);

-- ========================================================
-- FIXED: match_college_data — 11 Tables Support
-- Original mein sirf 3 the (faculty, events, kb)
-- Ab: faculty, events, kb, courses, facilities,
--     admission_info, achievements, exam_guides,
--     eligibility_criteria, exam_passing_rules, sections
-- ========================================================
create or replace function match_college_data (
    query_embedding vector(1536),
    match_threshold float,
    match_count int,
    target_table text
)
returns table (id uuid, content text, similarity float)
language plpgsql as $$
begin

    -- 1. FACULTY
    if target_table = 'faculty' then
        return query
        select
            f.id,
            coalesce(f.name, '') || ' (' || coalesce(f.department, '') || ')' ||
            ' | ' || coalesce(f.designation, '') ||
            ' | Subject: ' || coalesce(f.subject, '') ||
            ' | Specialization: ' || coalesce(f.specialization, ''),
            1 - (f.embedding <=> query_embedding) as similarity
        from faculty f
        where f.embedding is not null
          and 1 - (f.embedding <=> query_embedding) > match_threshold
        order by similarity desc
        limit match_count;

    -- 2. EVENTS
    elsif target_table = 'events' then
        return query
        select
            e.id,
            coalesce(e.title, '') ||
            ' | Date: ' || coalesce(e.date::text, '') ||
            ' | Category: ' || coalesce(e.category, '') ||
            ' | ' || coalesce(e.description, '') ||
            ' | Speakers: ' || coalesce(e.speakers, ''),
            1 - (e.embedding <=> query_embedding) as similarity
        from events e
        where e.embedding is not null
          and 1 - (e.embedding <=> query_embedding) > match_threshold
        order by similarity desc
        limit match_count;

    -- 3. KNOWLEDGE BASE
    elsif target_table = 'kb' then
        return query
        select
            k.id,
            coalesce(k.question, '') || ' → ' || coalesce(k.answer, '') ||
            ' [Category: ' || coalesce(k.category, '') || ']',
            1 - (k.embedding <=> query_embedding) as similarity
        from college_kb k
        where k.embedding is not null
          and 1 - (k.embedding <=> query_embedding) > match_threshold
        order by similarity desc
        limit match_count;

    -- 4. COURSES
    elsif target_table = 'courses' then
        return query
        select
            c.id,
            coalesce(c.name, '') ||
            ' | Stream: ' || coalesce(c.stream, '') ||
            ' | Seats: ' || coalesce(c.total_seats::text, 'N/A') ||
            ' | Convener: ' || coalesce(c.convener_name, '') ||
            ' (' || coalesce(c.convener_contact, '') || ')' ||
            ' | Admission: ' || coalesce(c.admission_start_date::text, '') ||
            ' to ' || coalesce(c.admission_last_date::text, '') ||
            ' | Subjects: ' || coalesce(array_to_string(c.subjects, ', '), ''),
            1 - (c.embedding <=> query_embedding) as similarity
        from courses c
        where c.embedding is not null
          and 1 - (c.embedding <=> query_embedding) > match_threshold
        order by similarity desc
        limit match_count;

    -- 5. FACILITIES
    elsif target_table = 'facilities' then
        return query
        select
            f.id,
            coalesce(f.name, '') ||
            ' | Category: ' || coalesce(f.category, '') ||
            ' | ' || coalesce(f.description, '') ||
            ' | Fees: ' || coalesce(f.fees_info, 'N/A'),
            1 - (f.embedding <=> query_embedding) as similarity
        from facilities f
        where f.embedding is not null
          and 1 - (f.embedding <=> query_embedding) > match_threshold
        order by similarity desc
        limit match_count;

    -- 6. ADMISSION INFO
    elsif target_table = 'admission_info' then
        return query
        select
            a.id,
            coalesce(a.title, '') ||
            ' | ' || coalesce(a.description, '') ||
            ' | Category: ' || coalesce(a.category, ''),
            1 - (a.embedding <=> query_embedding) as similarity
        from admission_info a
        where a.embedding is not null
          and a.is_active = true
          and 1 - (a.embedding <=> query_embedding) > match_threshold
        order by similarity desc
        limit match_count;

    -- 7. ACHIEVEMENTS
    elsif target_table = 'achievements' then
        return query
        select
            a.id,
            coalesce(a.title, '') ||
            ' | Student: ' || coalesce(a.student_name, '') ||
            ' | ' || coalesce(a.description, '') ||
            ' | Year: ' || coalesce(a.year, '') ||
            ' | Category: ' || coalesce(a.category, ''),
            1 - (a.embedding <=> query_embedding) as similarity
        from achievements a
        where a.embedding is not null
          and 1 - (a.embedding <=> query_embedding) > match_threshold
        order by similarity desc
        limit match_count;

    -- 8. EXAM GUIDES
    elsif target_table = 'exam_guides' then
        return query
        select
            e.id,
            coalesce(e.title, '') ||
            ' | Category: ' || coalesce(e.category, '') ||
            ' | ' || left(coalesce(e.content, ''), 300),
            1 - (e.embedding <=> query_embedding) as similarity
        from exam_guides e
        where e.embedding is not null
          and 1 - (e.embedding <=> query_embedding) > match_threshold
        order by similarity desc
        limit match_count;

    -- 9. ELIGIBILITY CRITERIA
    elsif target_table = 'eligibility_criteria' then
        return query
        select
            e.id,
            coalesce(e.faculty, '') ||
            ' | Level: ' || coalesce(e.level, '') ||
            ' | Course: ' || coalesce(e.course_name, '') ||
            ' | Min %: ' || coalesce(e.min_percentage::text, '') ||
            ' | Requirements: ' || coalesce(e.requirements, '') ||
            ' | Category Relaxation: ' || coalesce(e.category_relaxation, ''),
            1 - (e.embedding <=> query_embedding) as similarity
        from eligibility_criteria e
        where e.embedding is not null
          and 1 - (e.embedding <=> query_embedding) > match_threshold
        order by similarity desc
        limit match_count;

    -- 10. EXAM PASSING RULES
    elsif target_table = 'exam_passing_rules' then
        return query
        select
            e.id,
            coalesce(e.stream, '') ||
            ' | Subject: ' || coalesce(e.subject, '') ||
            ' | Theory Max: ' || coalesce(e.theory_max_marks::text, '') ||
            ' | Theory Pass: ' || coalesce(e.theory_pass_marks::text, '') ||
            ' | Practical Max: ' || coalesce(e.practical_max_marks::text, '0') ||
            ' | Practical Pass: ' || coalesce(e.practical_pass_marks::text, '0') ||
            ' | Total: ' || coalesce(e.total_max_marks::text, '') ||
            ' | Notes: ' || coalesce(e.notes, ''),
            1 - (e.embedding <=> query_embedding) as similarity
        from exam_passing_rules e
        where e.embedding is not null
          and 1 - (e.embedding <=> query_embedding) > match_threshold
        order by similarity desc
        limit match_count;

    -- 11. COLLEGE SECTIONS
    elsif target_table = 'sections' then
        return query
        select
            s.id,
            coalesce(s.title, '') || ' | ' || left(coalesce(s.content, ''), 300),
            1 - (s.embedding <=> query_embedding) as similarity
        from college_sections s
        where s.embedding is not null
          and 1 - (s.embedding <=> query_embedding) > match_threshold
        order by similarity desc
        limit match_count;

    end if;
end;
$$;

-- ========================================================
-- FIXED: global_context_search — 11 Tables (was 4)
-- Original mein sirf faculty, events, sections, kb the
-- Ab: +courses, +facilities, +admission_info,
--     +achievements, +exam_guides, +eligibility_criteria,
--     +exam_passing_rules
-- ========================================================
create or replace function global_context_search(
    query_embedding vector(1536),
    match_threshold float default 0.7,
    match_count int default 5
)
returns table (
    id uuid,
    table_name text,
    snippet text,
    similarity float
)
language plpgsql as $$
begin
    return query

    -- 1. FACULTY
    (select
        f.id,
        'faculty'::text,
        coalesce(f.name, '') || ' (' || coalesce(f.department, '') || ')' ||
        ' — ' || coalesce(f.designation, ''),
        1 - (f.embedding <=> query_embedding) as similarity
    from faculty f
    where f.embedding is not null
      and 1 - (f.embedding <=> query_embedding) > match_threshold
    order by similarity desc limit match_count)

    union all

    -- 2. EVENTS
    (select
        e.id,
        'events'::text,
        coalesce(e.title, '') ||
        ' | ' || coalesce(e.category, '') ||
        ' | Date: ' || coalesce(e.date::text, ''),
        1 - (e.embedding <=> query_embedding) as similarity
    from events e
    where e.embedding is not null
      and 1 - (e.embedding <=> query_embedding) > match_threshold
    order by similarity desc limit match_count)

    union all

    -- 3. COLLEGE SECTIONS
    (select
        s.id,
        'sections'::text,
        coalesce(s.title, '') || ' | ' || left(coalesce(s.content, ''), 150),
        1 - (s.embedding <=> query_embedding) as similarity
    from college_sections s
    where s.embedding is not null
      and 1 - (s.embedding <=> query_embedding) > match_threshold
    order by similarity desc limit match_count)

    union all

    -- 4. KNOWLEDGE BASE
    (select
        k.id,
        'kb'::text,
        coalesce(k.question, '') || ' → ' || left(coalesce(k.answer, ''), 150),
        1 - (k.embedding <=> query_embedding) as similarity
    from college_kb k
    where k.embedding is not null
      and 1 - (k.embedding <=> query_embedding) > match_threshold
    order by similarity desc limit match_count)

    union all

    -- 5. COURSES (NAYA)
    (select
        c.id,
        'courses'::text,
        coalesce(c.name, '') ||
        ' | Stream: ' || coalesce(c.stream, '') ||
        ' | Seats: ' || coalesce(c.total_seats::text, 'N/A') ||
        ' | Last Date: ' || coalesce(c.admission_last_date::text, ''),
        1 - (c.embedding <=> query_embedding) as similarity
    from courses c
    where c.embedding is not null
      and 1 - (c.embedding <=> query_embedding) > match_threshold
    order by similarity desc limit match_count)

    union all

    -- 6. FACILITIES (NAYA)
    (select
        f.id,
        'facilities'::text,
        coalesce(f.name, '') ||
        ' | ' || coalesce(f.category, '') ||
        ' | Fees: ' || coalesce(f.fees_info, 'N/A'),
        1 - (f.embedding <=> query_embedding) as similarity
    from facilities f
    where f.embedding is not null
      and 1 - (f.embedding <=> query_embedding) > match_threshold
    order by similarity desc limit match_count)

    union all

    -- 7. ADMISSION INFO (NAYA)
    (select
        a.id,
        'admission_info'::text,
        coalesce(a.title, '') ||
        ' | ' || coalesce(a.description, '') ||
        ' | Category: ' || coalesce(a.category, ''),
        1 - (a.embedding <=> query_embedding) as similarity
    from admission_info a
    where a.embedding is not null
      and a.is_active = true
      and 1 - (a.embedding <=> query_embedding) > match_threshold
    order by similarity desc limit match_count)

    union all

    -- 8. ACHIEVEMENTS (NAYA)
    (select
        a.id,
        'achievements'::text,
        coalesce(a.title, '') ||
        ' | Student: ' || coalesce(a.student_name, '') ||
        ' | Year: ' || coalesce(a.year, ''),
        1 - (a.embedding <=> query_embedding) as similarity
    from achievements a
    where a.embedding is not null
      and 1 - (a.embedding <=> query_embedding) > match_threshold
    order by similarity desc limit match_count)

    union all

    -- 9. EXAM GUIDES (NAYA)
    (select
        e.id,
        'exam_guides'::text,
        coalesce(e.title, '') ||
        ' | Category: ' || coalesce(e.category, '') ||
        ' | ' || left(coalesce(e.content, ''), 150),
        1 - (e.embedding <=> query_embedding) as similarity
    from exam_guides e
    where e.embedding is not null
      and 1 - (e.embedding <=> query_embedding) > match_threshold
    order by similarity desc limit match_count)

    union all

    -- 10. ELIGIBILITY CRITERIA (NAYA)
    (select
        e.id,
        'eligibility_criteria'::text,
        coalesce(e.faculty, '') ||
        ' | Level: ' || coalesce(e.level, '') ||
        ' | Course: ' || coalesce(e.course_name, '') ||
        ' | Min%: ' || coalesce(e.min_percentage::text, ''),
        1 - (e.embedding <=> query_embedding) as similarity
    from eligibility_criteria e
    where e.embedding is not null
      and 1 - (e.embedding <=> query_embedding) > match_threshold
    order by similarity desc limit match_count)

    union all

    -- 11. EXAM PASSING RULES (NAYA)
    (select
        e.id,
        'exam_passing_rules'::text,
        coalesce(e.stream, '') ||
        ' | Subject: ' || coalesce(e.subject, '') ||
        ' | Theory Pass: ' || coalesce(e.theory_pass_marks::text, '') ||
        ' | Notes: ' || coalesce(e.notes, ''),
        1 - (e.embedding <=> query_embedding) as similarity
    from exam_passing_rules e
    where e.embedding is not null
      and 1 - (e.embedding <=> query_embedding) > match_threshold
    order by similarity desc limit match_count)

    order by similarity desc
    limit match_count;
end;
$$;

-- ========================================================
-- SEED DATA (Unchanged from original)
-- ========================================================
UPDATE courses SET convener_name = 'Mohd Javed Khan', convener_contact = '9785159841', admission_start_date = '2026-05-01', admission_last_date = '2026-06-06', total_seats = 1600 WHERE name ILIKE '%B.A. Semester-I%' OR (name ILIKE '%B.A.%' AND stream = 'Arts');
UPDATE courses SET convener_name = 'Dr. Mukesh Kumar Meena', convener_contact = '8005763754', admission_start_date = '2026-05-01', admission_last_date = '2026-06-06', total_seats = 264 WHERE name ILIKE '%B.Sc. Bio. Semester-I%' OR name ILIKE '%B.Sc. Bio%';
UPDATE courses SET convener_name = 'Dr. Mukesh Kumar Meena', convener_contact = '8005763754', admission_start_date = '2026-05-01', admission_last_date = '2026-06-06', total_seats = 264 WHERE name ILIKE '%B.Sc. Math. Semester-I%' OR name ILIKE '%B.Sc. Math%';
UPDATE courses SET convener_name = 'Dr. Mahendra Kumar Khardiya', convener_contact = '9928273463', admission_start_date = '2026-05-01', admission_last_date = '2026-06-06', total_seats = 600 WHERE name ILIKE '%B.Com. Semester-I%' OR name ILIKE '%B.Com%';

INSERT INTO courses (id, name, stream, subjects, total_seats, convener_name, convener_contact, admission_start_date, admission_last_date)
SELECT gen_random_uuid(), 'BBA Semester-I', 'Management', ARRAY['Business and Management Concepts', 'Financial Accounting', 'Entrepreneurship & Small Business Management', 'Computer Application'], 60, 'Dr. Mahendra Kumar Khardiya', '9928273463', '2026-05-01', '2026-06-06'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE name = 'BBA Semester-I');

INSERT INTO courses (id, name, stream, subjects, total_seats, convener_name, convener_contact, admission_start_date, admission_last_date)
SELECT gen_random_uuid(), 'AEDP (B.Com in BFSI)', 'Commerce', ARRAY['Account assistant', 'Principal of management', 'Business Economics'], 80, 'Dr. Madhu Sudan Pardhan', '9782582267', '2026-05-01', '2026-06-06'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE name = 'AEDP (B.Com in BFSI)' OR name ILIKE '%AEDP%');

INSERT INTO college_kb (category, question, answer) VALUES
('Canteen', 'What are the college canteen timings and popular items?', 'The Lohia College canteen is open from 9:30 AM to 3:30 PM on all working days. Popular items include hot Samosas (Rs. 10), Chai (Rs. 5), Bread Pakora (Rs. 12).'),
('Parking & Campus', 'Are there parking fees or rules for student vehicles on campus?', 'Student parking is near the main gate. Bicycle parking is free. Two-wheelers need valid college ID passes. No fees for regular students.'),
('Library', 'What is the procedure to issue books from the college library?', 'Present a valid Library Card. Issue up to 2 books for 14 days. Late fee of Rs. 1 per day.'),
('NSS & NCC', 'How can a student join the NSS unit of Lohia College?', 'Applications start in July/August. Contact NSS Program Officers in your department. Selection is merit and interview based.');
