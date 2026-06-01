create table public.college_merit_list (
  id bigserial not null,
  board_type text not null,
  exam_year text not null,
  student_name text not null,
  division text null,
  position_in_college text null,
  remarks text null,
  embedding public.vector null,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint college_merit_list_pkey primary key (id)
) TABLESPACE pg_default;

create index IF not exists idx_college_merit_list_embedding on public.college_merit_list using hnsw (embedding vector_cosine_ops) TABLESPACE pg_default;

create index IF not exists idx_merit_name_trgm on public.college_merit_list using gin (student_name gin_trgm_ops) TABLESPACE pg_default;

create index IF not exists idx_merit_course_trgm on public.college_merit_list using gin (board_type gin_trgm_ops) TABLESPACE pg_default;

create index IF not exists idx_merit_year on public.college_merit_list using btree (exam_year) TABLESPACE pg_default;