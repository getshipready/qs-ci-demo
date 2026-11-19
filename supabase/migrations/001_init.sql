create table public.todos (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  title text not null,
  created_at timestamptz not null default now()
);
alter table public.todos enable row level security;
create policy "owner can read" on public.todos for select to authenticated using (user_id = (select auth.uid()));
create policy "owner can insert" on public.todos for insert to authenticated with check (user_id = (select auth.uid()));
create policy "owner can update" on public.todos for update to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
create policy "owner can delete" on public.todos for delete to authenticated using (user_id = (select auth.uid()));
