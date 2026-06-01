create table public.events (
  id uuid not null default extensions.uuid_generate_v4 (),
  title text not null,
  date date not null,
  time text null,
  category text null,
  speakers text null,
  description text null,
  image_url text null,
  embedding public.vector null,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint events_pkey primary key (id)
) TABLESPACE pg_default;

create index IF not exists idx_events_date on public.events using btree (date desc) TABLESPACE pg_default;

create index IF not exists idx_events_embedding on public.events using hnsw (embedding vector_cosine_ops) TABLESPACE pg_default;

create index IF not exists idx_events_gin on public.events using gin (
  to_tsvector(
    'english'::regconfig,
    (
      (
        (
          (
            (
              (COALESCE(title, ''::text) || ' '::text) || COALESCE(description, ''::text)
            ) || ' '::text
          ) || COALESCE(category, ''::text)
        ) || ' '::text
      ) || COALESCE(speakers, ''::text)
    )
  )
) TABLESPACE pg_default;