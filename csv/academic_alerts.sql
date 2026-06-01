create table public.academic_alerts (
  id uuid not null default extensions.uuid_generate_v4 (),
  title text not null,
  description text not null,
  type text null default 'info'::text,
  target_stream text null default 'All'::text,
  is_active boolean null default true,
  attachments jsonb null default '[]'::jsonb,
  expires_at timestamp with time zone null,
  embedding public.vector null,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint academic_alerts_pkey primary key (id)
) TABLESPACE pg_default;

create index IF not exists idx_alerts_active on public.academic_alerts using btree (is_active) TABLESPACE pg_default;

create index IF not exists idx_academic_alerts_embedding on public.academic_alerts using hnsw (embedding vector_cosine_ops) TABLESPACE pg_default;

create index IF not exists idx_alerts_gin on public.academic_alerts using gin (
  to_tsvector(
    'english'::regconfig,
    (
      (
        (
          (
            (
              (COALESCE(title, ''::text) || ' '::text) || COALESCE(description, ''::text)
            ) || ' '::text
          ) || COALESCE(target_stream, ''::text)
        ) || ' '::text
      ) || COALESCE(type, ''::text)
    )
  )
) TABLESPACE pg_default;