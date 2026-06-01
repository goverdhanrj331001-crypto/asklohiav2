-- WARNING: This schema is for context only and is not meant to be run.
-- Table order and constraints may not be valid for execution.

CREATE TABLE public.academic_alerts (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  title text NOT NULL,
  description text NOT NULL,
  type text DEFAULT 'info'::text,
  target_stream text DEFAULT 'All'::text,
  is_active boolean DEFAULT true,
  attachments jsonb DEFAULT '[]'::jsonb,
  expires_at timestamp with time zone,
  embedding USER-DEFINED,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  CONSTRAINT academic_alerts_pkey PRIMARY KEY (id)
);
CREATE TABLE public.achievements (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  category text,
  title text NOT NULL,
  student_name text,
  description text,
  year text,
  image_url text,
  embedding USER-DEFINED,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  CONSTRAINT achievements_pkey PRIMARY KEY (id)
);
CREATE TABLE public.ai_configurations (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  provider_name text NOT NULL,
  model_id text NOT NULL,
  api_key text NOT NULL,
  base_url text,
  is_active boolean DEFAULT false,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  updated_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  CONSTRAINT ai_configurations_pkey PRIMARY KEY (id)
);
CREATE TABLE public.college_faqs (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  question text NOT NULL,
  answer text NOT NULL,
  category text,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  updated_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  CONSTRAINT college_faqs_pkey PRIMARY KEY (id)
);
CREATE TABLE public.college_info (
  key text NOT NULL,
  value text,
  image_url text,
  CONSTRAINT college_info_pkey PRIMARY KEY (key)
);
CREATE TABLE public.college_knowledge (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  category text NOT NULL,
  search_key text NOT NULL UNIQUE,
  title text NOT NULL,
  content text NOT NULL,
  image_url text,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  updated_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  CONSTRAINT college_knowledge_pkey PRIMARY KEY (id)
);
CREATE TABLE public.college_merit_list (
  id bigint NOT NULL DEFAULT nextval('college_merit_list_id_seq'::regclass),
  board_type text NOT NULL,
  exam_year text NOT NULL,
  student_name text NOT NULL,
  division text,
  position_in_college text,
  remarks text,
  embedding USER-DEFINED,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  CONSTRAINT college_merit_list_pkey PRIMARY KEY (id)
);
CREATE TABLE public.courses (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  name text NOT NULL,
  stream text NOT NULL,
  subjects ARRAY,
  total_seats integer,
  admission_start_date date,
  admission_last_date date,
  convener_name text,
  convener_contact text,
  embedding USER-DEFINED,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  CONSTRAINT courses_pkey PRIMARY KEY (id)
);
CREATE TABLE public.events (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  title text NOT NULL,
  date date NOT NULL,
  time text,
  category text,
  speakers text,
  description text,
  image_url text,
  embedding USER-DEFINED,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  CONSTRAINT events_pkey PRIMARY KEY (id)
);
CREATE TABLE public.exam_subjects (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  name text NOT NULL,
  department text NOT NULL,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  CONSTRAINT exam_subjects_pkey PRIMARY KEY (id)
);
CREATE TABLE public.faculty (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  name text NOT NULL,
  father_name text,
  department text NOT NULL,
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
  embedding USER-DEFINED,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  updated_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  CONSTRAINT faculty_pkey PRIMARY KEY (id)
);
CREATE TABLE public.gallery (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  title text NOT NULL,
  category text,
  type text DEFAULT 'image'::text,
  media_url text,
  media_urls ARRAY,
  tags ARRAY,
  embedding USER-DEFINED,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  CONSTRAINT gallery_pkey PRIMARY KEY (id)
);
CREATE TABLE public.main_exams (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  department text NOT NULL,
  status text,
  level text,
  semester integer,
  subject text,
  paper text,
  exam_date date,
  exam_time time without time zone,
  embedding USER-DEFINED,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  CONSTRAINT main_exams_pkey PRIMARY KEY (id)
);
CREATE TABLE public.materials (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  title text NOT NULL,
  files jsonb DEFAULT '[]'::jsonb,
  embedding USER-DEFINED,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  CONSTRAINT materials_pkey PRIMARY KEY (id)
);
CREATE TABLE public.past_principals (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  name text NOT NULL,
  from_date text,
  to_date text,
  order_index integer DEFAULT 0,
  image_url text,
  bio text,
  embedding USER-DEFINED,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  CONSTRAINT past_principals_pkey PRIMARY KEY (id)
);
CREATE TABLE public.practical_batches (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  department text NOT NULL,
  status text,
  level text,
  semester integer,
  batch_no text,
  exam_date date,
  exam_time time without time zone,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  CONSTRAINT practical_batches_pkey PRIMARY KEY (id)
);
CREATE TABLE public.practical_students (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  batch_id uuid,
  roll_no text NOT NULL,
  name text NOT NULL,
  father_name text,
  seat_no text,
  category text,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  CONSTRAINT practical_students_pkey PRIMARY KEY (id),
  CONSTRAINT practical_students_batch_id_fkey FOREIGN KEY (batch_id) REFERENCES public.practical_batches(id)
);
CREATE TABLE public.sports (
  id bigint NOT NULL DEFAULT nextval('sports_id_seq'::regclass),
  category text NOT NULL,
  year text NOT NULL,
  student_name text NOT NULL,
  sport text,
  division text,
  position_in_college text,
  remarks text,
  created_at timestamp with time zone DEFAULT now(),
  CONSTRAINT sports_pkey PRIMARY KEY (id)
);
CREATE TABLE public.student_profiles (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  user_email text NOT NULL UNIQUE,
  full_name text,
  phone text,
  college_status text,
  level text,
  semester text,
  subject text,
  avatar_url text,
  id_card_url text,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  updated_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  CONSTRAINT student_profiles_pkey PRIMARY KEY (id)
);
CREATE TABLE public.study_materials (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  department text NOT NULL,
  status text,
  level text,
  semester integer,
  material_type text,
  title text,
  file_url text NOT NULL,
  file_type text,
  embedding USER-DEFINED,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  CONSTRAINT study_materials_pkey PRIMARY KEY (id)
);
CREATE TABLE public.voice_limits (
  fingerprint_id text NOT NULL,
  question_count integer DEFAULT 0,
  limit_reached_at timestamp with time zone,
  updated_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
  CONSTRAINT voice_limits_pkey PRIMARY KEY (fingerprint_id)
);