create table public.gallery (
  id uuid not null default extensions.uuid_generate_v4 (),
  title text not null,
  category text null,
  type text null default 'image'::text,
  media_url text null,
  media_urls text[] null,
  tags text[] null,
  embedding public.vector null,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint gallery_pkey primary key (id)
) TABLESPACE pg_default;

create index IF not exists idx_gallery_embedding on public.gallery using hnsw (embedding vector_cosine_ops) TABLESPACE pg_default;

create index IF not exists idx_gallery_gin on public.gallery using gin (
  to_tsvector(
    'english'::regconfig,
    (
      (
        (
          (COALESCE(title, ''::text) || ' '::text) || COALESCE(category, ''::text)
        ) || ' '::text
      ) || COALESCE(
        immutable_array_to_string (tags, ' '::text),
        ''::text
      )
    )
  )
) TABLESPACE pg_default;