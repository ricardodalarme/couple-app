-- Lists: tables, indexes and constraints.

create table public.lists (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  title text not null check (char_length(title) between 1 and 80), kind public.list_kind not null default 'custom',
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());

create table public.list_items (
  id uuid primary key default gen_random_uuid(), list_id uuid not null references public.lists (id) on delete cascade,
  author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  title text not null check (char_length(title) between 1 and 160), status public.list_item_status not null default 'dream',
  position integer not null default 0, created_at timestamptz not null default now(), updated_at timestamptz not null default now());

create trigger list_items_set_updated_at before update on public.list_items
  for each row execute function private.set_updated_at();
