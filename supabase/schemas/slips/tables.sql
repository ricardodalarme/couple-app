-- Slips: tables, indexes and constraints.

create table public.slips (
  id uuid primary key default gen_random_uuid(),
  author_id uuid not null references public.profiles (id) on delete cascade,
  kind public.slip_kind not null default 'quick',
  body text not null check (char_length(btrim(body)) between 1 and 500),
  feeling text check (char_length(feeling) <= 200),
  plan_note text check (char_length(plan_note) <= 200),
  tags text[] not null default '{}' check (cardinality(tags) <= 10),
  for_card boolean not null default true,
  photo_path text check (char_length(photo_path) <= 300),
  occurred_on date,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  archived_at timestamptz,
  deleted_at timestamptz,
  constraint slips_invisible_never_for_card check (kind <> 'invisible' or not for_card)
);
create index slips_author_created_idx on public.slips (author_id, created_at desc);
comment on constraint slips_author_id_fkey on public.slips is e'@graphql({"foreign_name": "author", "local_name": "slips"})';
create trigger slips_set_updated_at before update on public.slips
  for each row execute function private.set_updated_at();

-- Slip extras ---------------------------------------------------------------------------------------
alter table public.slips
  add column category public.slip_category,
  add column work_area public.work_area,
  add column in_jar boolean not null default false;

-- Slips: the UI allows 140 characters; the database keeps headroom at 280.
alter table public.slips drop constraint slips_body_check;
alter table public.slips add constraint slips_body_check check (char_length(btrim(body)) between 1 and 280);
