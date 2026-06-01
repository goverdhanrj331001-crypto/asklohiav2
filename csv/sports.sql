create table public.sports (
  id bigserial not null,
  category text not null,
  year text not null,
  student_name text not null,
  sport text null,
  division text null,
  position_in_college text null,
  remarks text null,
  created_at timestamp with time zone null default now(),
  constraint sports_pkey primary key (id)
) TABLESPACE pg_default;

create index IF not exists idx_sports_title_trgm on public.sports using gin (sport gin_trgm_ops) TABLESPACE pg_default;