create table public.projects (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null
);
alter table public.projects enable row level security;
create policy "owner can read" on public.projects for select to authenticated using (user_id = (select auth.uid()));
create policy "owner can insert" on public.projects for insert to authenticated with check (user_id = (select auth.uid()));
create policy "owner can update" on public.projects for update to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
create policy "owner can delete" on public.projects for delete to authenticated using (user_id = (select auth.uid()));
