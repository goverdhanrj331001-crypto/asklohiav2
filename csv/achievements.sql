create table public.achievements (
  id uuid not null default extensions.uuid_generate_v4 (),
  category text null,
  title text not null,
  student_name text null,
  description text null,
  year text null,
  image_url text null,
  embedding public.vector null,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint achievements_pkey primary key (id)
) TABLESPACE pg_default;

create index IF not exists idx_achievements_embedding on public.achievements using hnsw (embedding vector_cosine_ops) TABLESPACE pg_default;

create index IF not exists idx_achievements_gin on public.achievements using gin (
  to_tsvector(
    'english'::regconfig,
    (
      (
        (
          (
            (
              (
                (
                  (COALESCE(title, ''::text) || ' '::text) || COALESCE(student_name, ''::text)
                ) || ' '::text
              ) || COALESCE(description, ''::text)
            ) || ' '::text
          ) || COALESCE(category, ''::text)
        ) || ' '::text
      ) || COALESCE(year, ''::text)
    )
  )
) TABLESPACE pg_default;