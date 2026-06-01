create table public.past_principals (
  id uuid not null default extensions.uuid_generate_v4 (),
  name text not null,
  from_date text null,
  to_date text null,
  order_index integer null default 0,
  image_url text null,
  bio text null,
  embedding public.vector null,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint past_principals_pkey primary key (id)
) TABLESPACE pg_default;

create index IF not exists idx_past_principals_embedding on public.past_principals using hnsw (embedding vector_cosine_ops) TABLESPACE pg_default;

create index IF not exists idx_past_principals_gin on public.past_principals using gin (
  to_tsvector(
    'english'::regconfig,
    (
      (COALESCE(name, ''::text) || ' '::text) || COALESCE(bio, ''::text)
    )
  )
) TABLESPACE pg_default;

create index IF not exists idx_principals_name_trgm on public.past_principals using gin (name gin_trgm_ops) TABLESPACE pg_default;

create index IF not exists idx_principals_order on public.past_principals using btree (order_index) TABLESPACE pg_default;