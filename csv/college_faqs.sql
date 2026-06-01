create table public.college_faqs (
  id uuid not null default extensions.uuid_generate_v4 (),
  question text not null,
  answer text not null,
  category text null,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  updated_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint college_faqs_pkey primary key (id)
) TABLESPACE pg_default;