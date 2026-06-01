create table public.practical_batches (
  id uuid not null default extensions.uuid_generate_v4 (),
  department text not null,
  status text null,
  level text null,
  semester integer null,
  batch_no text null,
  exam_date date null,
  exam_time time without time zone null,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint practical_batches_pkey primary key (id)
) TABLESPACE pg_default;