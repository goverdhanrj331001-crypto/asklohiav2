create extension IF not exists pg_trgm;
create extension IF not exists vector;
create extension IF not exists "uuid-ossp";

create table IF not exists public.knowledge_items (
  id uuid not null default extensions.uuid_generate_v4 (),
  title text not null,
  summary text null,
  answer_text text null,
  extracted_text text null,
  category text null default 'General',
  tags text[] null default '{}'::text[],
  source_type text null,
  main_file jsonb null,
  attachments jsonb null default '[]'::jsonb,
  search_text text null,
  embedding public.vector(768) null,
  is_active boolean null default true,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  updated_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint knowledge_items_pkey primary key (id)
) TABLESPACE pg_default;

create index IF not exists idx_knowledge_items_active_created
on public.knowledge_items using btree (is_active, created_at desc) TABLESPACE pg_default;

create index IF not exists idx_knowledge_items_category
on public.knowledge_items using btree (category) TABLESPACE pg_default;

create index IF not exists idx_knowledge_items_title_trgm
on public.knowledge_items using gin (title gin_trgm_ops) TABLESPACE pg_default;

create index IF not exists idx_knowledge_items_search_trgm
on public.knowledge_items using gin (search_text gin_trgm_ops) TABLESPACE pg_default;

create index IF not exists idx_knowledge_items_summary_trgm
on public.knowledge_items using gin (summary gin_trgm_ops) TABLESPACE pg_default;

create index IF not exists idx_knowledge_items_answer_trgm
on public.knowledge_items using gin (answer_text gin_trgm_ops) TABLESPACE pg_default;

create index IF not exists idx_knowledge_items_tags_gin
on public.knowledge_items using gin (tags) TABLESPACE pg_default;

create index IF not exists idx_knowledge_items_attachments_gin
on public.knowledge_items using gin (attachments jsonb_path_ops) TABLESPACE pg_default;

create index IF not exists idx_knowledge_items_tsv
on public.knowledge_items using gin (
  to_tsvector(
    'simple'::regconfig,
    COALESCE(search_text, ''::text)
  )
) TABLESPACE pg_default;

create index IF not exists idx_knowledge_items_embedding
on public.knowledge_items using hnsw (embedding vector_cosine_ops) TABLESPACE pg_default;
