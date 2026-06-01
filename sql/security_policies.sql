-- Replace this email list with your real admin login email(s), then run in Supabase SQL Editor.
-- Example: array['youradmin@gmail.com', 'anotheradmin@gmail.com']

create or replace function public.is_admin()
returns boolean
language sql
stable
as $$
  select lower(coalesce(auth.jwt() ->> 'email', '')) = any (
    array['REPLACE_WITH_YOUR_ADMIN_EMAIL@gmail.com']
  );
$$;

alter table public.knowledge_items enable row level security;
alter table public.faculty enable row level security;
alter table public.materials enable row level security;
alter table public.academic_alerts enable row level security;
alter table public.gallery enable row level security;
alter table public.events enable row level security;
alter table public.courses enable row level security;

drop policy if exists "public read knowledge_items" on public.knowledge_items;
create policy "public read knowledge_items" on public.knowledge_items
for select using (is_active is true);

drop policy if exists "admin write knowledge_items" on public.knowledge_items;
create policy "admin write knowledge_items" on public.knowledge_items
for all using (public.is_admin()) with check (public.is_admin());

drop policy if exists "public read faculty" on public.faculty;
create policy "public read faculty" on public.faculty
for select using (true);

drop policy if exists "admin write faculty" on public.faculty;
create policy "admin write faculty" on public.faculty
for all using (public.is_admin()) with check (public.is_admin());

drop policy if exists "public read materials" on public.materials;
create policy "public read materials" on public.materials
for select using (true);

drop policy if exists "admin write materials" on public.materials;
create policy "admin write materials" on public.materials
for all using (public.is_admin()) with check (public.is_admin());

drop policy if exists "public read academic_alerts" on public.academic_alerts;
create policy "public read academic_alerts" on public.academic_alerts
for select using (is_active is not false);

drop policy if exists "admin write academic_alerts" on public.academic_alerts;
create policy "admin write academic_alerts" on public.academic_alerts
for all using (public.is_admin()) with check (public.is_admin());

drop policy if exists "public read gallery" on public.gallery;
create policy "public read gallery" on public.gallery
for select using (true);

drop policy if exists "admin write gallery" on public.gallery;
create policy "admin write gallery" on public.gallery
for all using (public.is_admin()) with check (public.is_admin());

drop policy if exists "public read events" on public.events;
create policy "public read events" on public.events
for select using (true);

drop policy if exists "admin write events" on public.events;
create policy "admin write events" on public.events
for all using (public.is_admin()) with check (public.is_admin());

drop policy if exists "public read courses" on public.courses;
create policy "public read courses" on public.courses
for select using (true);

drop policy if exists "admin write courses" on public.courses;
create policy "admin write courses" on public.courses
for all using (public.is_admin()) with check (public.is_admin());
