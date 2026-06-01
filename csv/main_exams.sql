create table public.main_exams (
  id uuid not null default extensions.uuid_generate_v4 (),
  department text not null,
  status text null,
  level text null,
  semester integer null,
  subject text null,
  paper text null,
  exam_date date null,
  exam_time time without time zone null,
  embedding public.vector null,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint main_exams_pkey primary key (id)
) TABLESPACE pg_default;

create index IF not exists idx_main_exams_embedding on public.main_exams using hnsw (embedding vector_cosine_ops) TABLESPACE pg_default;

create index IF not exists idx_main_exams_gin on public.main_exams using gin (
  to_tsvector(
    'english'::regconfig,
    (
      (
        (
          (
            (
              (
                (
                  (COALESCE(subject, ''::text) || ' '::text) || COALESCE(paper, ''::text)
                ) || ' '::text
              ) || COALESCE(department, ''::text)
            ) || ' '::text
          ) || COALESCE(level, ''::text)
        ) || ' '::text
      ) || COALESCE(status, ''::text)
    )
  )
) TABLESPACE pg_default;