create table public.materials (
  id uuid not null default extensions.uuid_generate_v4 (),
  title text not null,
  files jsonb null default '[]'::jsonb,
  embedding public.vector null,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint materials_pkey primary key (id)
) TABLESPACE pg_default;

create index IF not exists idx_materials_embedding on public.materials using hnsw (embedding vector_cosine_ops) TABLESPACE pg_default;

create index IF not exists idx_materials_gin on public.materials using gin (
  to_tsvector('english'::regconfig, COALESCE(title, ''::text))
) TABLESPACE pg_default;