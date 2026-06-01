create table public.practical_students (
  id uuid not null default extensions.uuid_generate_v4 (),
  batch_id uuid null,
  roll_no text not null,
  name text not null,
  father_name text null,
  seat_no text null,
  category text null,
  created_at timestamp with time zone null default timezone ('utc'::text, now()),
  constraint practical_students_pkey primary key (id),
  constraint practical_students_batch_id_fkey foreign KEY (batch_id) references practical_batches (id) on delete CASCADE
) TABLESPACE pg_default;

create index IF not exists idx_practical_students_gin on public.practical_students using gin (
  to_tsvector(
    'english'::regconfig,
    (
      (
        (
          (
            (
              (COALESCE(name, ''::text) || ' '::text) || COALESCE(roll_no, ''::text)
            ) || ' '::text
          ) || COALESCE(father_name, ''::text)
        ) || ' '::text
      ) || COALESCE(seat_no, ''::text)
    )
  )
) TABLESPACE pg_default;