create table public.exam_subjects (
  id uuid not null default extensions.uuid_generate_v4 (),
  name text not null,
  department text not null,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint exam_subjects_pkey primary key (id)
) TABLESPACE pg_default;