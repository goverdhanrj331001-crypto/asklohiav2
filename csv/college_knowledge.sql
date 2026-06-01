create table public.college_knowledge (
  id uuid not null default extensions.uuid_generate_v4 (),
  category text not null,
  search_key text not null,
  title text not null,
  content text not null,
  image_url text null,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  updated_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint college_knowledge_pkey primary key (id),
  constraint college_knowledge_search_key_key unique (search_key)
) TABLESPACE pg_default;

create index IF not exists idx_college_knowledge_category on public.college_knowledge using btree (category) TABLESPACE pg_default;

create index IF not exists idx_college_knowledge_key on public.college_knowledge using btree (search_key) TABLESPACE pg_default;