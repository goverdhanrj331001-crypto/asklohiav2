create table public.courses (
  id uuid not null default extensions.uuid_generate_v4 (),
  name text not null,
  stream text not null,
  subjects text[] null,
  total_seats integer null,
  admission_start_date date null,
  admission_last_date date null,
  convener_name text null,
  convener_contact text null,
  embedding public.vector null,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint courses_pkey primary key (id)
) TABLESPACE pg_default;

create index IF not exists idx_courses_embedding on public.courses using hnsw (embedding vector_cosine_ops) TABLESPACE pg_default;

create index IF not exists idx_courses_gin on public.courses using gin (
  to_tsvector(
    'english'::regconfig,
    (
      (
        (
          (
            (
              (COALESCE(name, ''::text) || ' '::text) || COALESCE(stream, ''::text)
            ) || ' '::text
          ) || COALESCE(convener_name, ''::text)
        ) || ' '::text
      ) || COALESCE(
        immutable_array_to_string (subjects, ' '::text),
        ''::text
      )
    )
  )
) TABLESPACE pg_default;