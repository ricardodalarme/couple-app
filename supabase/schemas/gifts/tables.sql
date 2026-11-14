-- Gifts: tables, indexes and constraints.

create table public.gift_ideas (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  kind public.gift_idea_kind not null default 'idea',
  title text not null check (char_length(title) between 1 and 120), note text check (char_length(note) <= 1000),
  occasion_date_id uuid, status public.gift_idea_status not null default 'idea', budget public.gift_budget,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());

alter table public.gift_ideas add constraint gift_ideas_occasion_date_id_fkey foreign key (occasion_date_id) references public.important_dates (id) on delete set null;

create index if not exists gift_ideas_author_idx on public.gift_ideas (author_id, created_at desc);
create index if not exists gift_ideas_couple_idx on public.gift_ideas (couple_id);
create index if not exists gift_ideas_couple_created_idx on public.gift_ideas (couple_id, created_at desc);
create trigger gift_ideas_set_updated_at before update on public.gift_ideas
  for each row execute function private.set_updated_at();

create index gift_ideas_occasion_idx on public.gift_ideas (occasion_date_id);
