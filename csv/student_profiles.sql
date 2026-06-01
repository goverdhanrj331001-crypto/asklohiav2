create table public.student_profiles (
  id uuid not null default extensions.uuid_generate_v4 (),
  user_email text not null,
  full_name text null,
  phone text null,
  college_status text null,
  level text null,
  semester text null,
  subject text null,
  avatar_url text null,
  id_card_url text null,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  updated_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint student_profiles_pkey primary key (id),
  constraint student_profiles_user_email_key unique (user_email)
) TABLESPACE pg_default;