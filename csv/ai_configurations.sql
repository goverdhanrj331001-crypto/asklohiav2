create table public.ai_configurations (
  id uuid not null default extensions.uuid_generate_v4 (),
  provider_name text not null,
  model_id text not null,
  api_key text not null,
  base_url text null,
  is_active boolean null default false,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  updated_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint ai_configurations_pkey primary key (id)
) TABLESPACE pg_default;