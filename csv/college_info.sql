create table public.college_info (
  key text not null,
  value text null,
  image_url text null,
  constraint college_info_pkey primary key (key)
) TABLESPACE pg_default;