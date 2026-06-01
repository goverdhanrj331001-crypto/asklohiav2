create table public.study_materials (
  id uuid not null default extensions.uuid_generate_v4 (),
  department text not null,
  status text null,
  level text null,
  semester integer null,
  material_type text null,
  title text null,
  file_url text not null,
  file_type text null,
  embedding public.vector null,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint study_materials_pkey primary key (id)
) TABLESPACE pg_default;

create index IF not exists idx_study_materials_embedding on public.study_materials using hnsw (embedding vector_cosine_ops) TABLESPACE pg_default;

create index IF not exists idx_study_materials_gin on public.study_materials using gin (
  to_tsvector(
    'english'::regconfig,
    (
      (
        (
          (
            (
              (COALESCE(title, ''::text) || ' '::text) || COALESCE(department, ''::text)
            ) || ' '::text
          ) || COALESCE(material_type, ''::text)
        ) || ' '::text
      ) || COALESCE(level, ''::text)
    )
  )
) TABLESPACE pg_default;