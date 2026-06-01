create table public.faculty (
  id uuid not null default extensions.uuid_generate_v4 (),
  name text not null,
  father_name text null,
  department text not null,
  designation text null,
  subject text null,
  qualification text null,
  dob date null,
  seniority_no text null,
  image_url text null,
  mobile_no text null,
  email text null,
  specialization text null,
  service_start_date date null,
  college_join_date date null,
  embedding public.vector null,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  updated_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint faculty_pkey primary key (id)
) TABLESPACE pg_default;

create index IF not exists idx_faculty_embedding on public.faculty using hnsw (embedding vector_cosine_ops) TABLESPACE pg_default;

create index IF not exists idx_faculty_gin on public.faculty using gin (
  to_tsvector(
    'english'::regconfig,
    (
      (
        (
          (
            (
              (
                (
                  (
                    (
                      (COALESCE(name, ''::text) || ' '::text) || COALESCE(department, ''::text)
                    ) || ' '::text
                  ) || COALESCE(designation, ''::text)
                ) || ' '::text
              ) || COALESCE(subject, ''::text)
            ) || ' '::text
          ) || COALESCE(specialization, ''::text)
        ) || ' '::text
      ) || COALESCE(qualification, ''::text)
    )
  )
) TABLESPACE pg_default;

create index IF not exists idx_faculty_name_trgm on public.faculty using gin (name gin_trgm_ops) TABLESPACE pg_default;

create index IF not exists idx_faculty_dept_trgm on public.faculty using gin (department gin_trgm_ops) TABLESPACE pg_default;