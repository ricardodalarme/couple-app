-- Declarative source of truth. Mirrors migration 20261110000300_slips.sql; edit both together when Docker/pg-delta is unavailable.
-- Slips: the private note about something good the partner did. (BE-007)
create type public.slip_kind as enum ('quick', 'specific', 'if_then', 'invisible');

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
comment on table public.slips is e'@graphql({"totalCount": {"enabled": true}, "description": "Private to the author. Reaches the partner only as a frozen copy inside a sent card."})';
comment on constraint slips_author_id_fkey on public.slips is e'@graphql({"foreign_name": "author", "local_name": "slips"})';
create trigger slips_set_updated_at before update on public.slips
  for each row execute function private.set_updated_at();

alter table public.slips enable row level security;
grant select on public.slips to authenticated;
create policy slips_select_author on public.slips for select to authenticated
  using (author_id = (select auth.uid()));

-- Idempotent create-or-update keyed by the client-generated id (offline-first).
create function public.save_slip(
  id uuid, body text, kind text default 'quick', feeling text default null, plan_note text default null,
  tags text[] default '{}', for_card boolean default true, occurred_on date default null,
  photo_path text default null, created_at timestamptz default null
) returns public.slips
language plpgsql security definer set search_path = '' as $$
declare
  v_uid uuid := private.require_user();
  v_kind public.slip_kind;
  v_row public.slips;
begin
  begin
    v_kind := kind::public.slip_kind;
  exception when invalid_text_representation then
    raise exception 'INVALID_SLIP_KIND' using errcode = 'P0001';
  end;
  insert into public.slips as s (id, author_id, kind, body, feeling, plan_note, tags, for_card, occurred_on, photo_path, created_at)
  values (save_slip.id, v_uid, v_kind, btrim(save_slip.body), nullif(btrim(save_slip.feeling), ''),
          nullif(btrim(save_slip.plan_note), ''), coalesce(save_slip.tags, '{}'),
          coalesce(save_slip.for_card, true) and v_kind <> 'invisible', save_slip.occurred_on, save_slip.photo_path,
          least(coalesce(save_slip.created_at, now()), now()))
  on conflict on constraint slips_pkey do update
    set kind = excluded.kind, body = excluded.body, feeling = excluded.feeling, plan_note = excluded.plan_note,
        tags = excluded.tags, for_card = excluded.for_card, occurred_on = excluded.occurred_on,
        photo_path = excluded.photo_path
    where s.author_id = v_uid and s.deleted_at is null
  returning s.* into v_row;
  if v_row.id is null then
    raise exception 'SLIP_NOT_FOUND' using errcode = 'P0001';
  end if;
  return v_row;
end $$;

create function public.archive_slip(id uuid, archived boolean default true) returns public.slips
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_row public.slips;
begin
  update public.slips s set archived_at = case when archived then coalesce(s.archived_at, now()) end
  where s.id = archive_slip.id and s.author_id = v_uid and s.deleted_at is null
  returning s.* into v_row;
  if v_row.id is null then
    raise exception 'SLIP_NOT_FOUND' using errcode = 'P0001';
  end if;
  return v_row;
end $$;

-- Soft delete (tombstone so other devices of the author can sync). Idempotent.
create function public.delete_slip(id uuid) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user();
begin
  update public.slips s set deleted_at = coalesce(s.deleted_at, now()), body = '[deleted]', feeling = null,
    plan_note = null, tags = '{}', photo_path = null
  where s.id = delete_slip.id and s.author_id = v_uid;
  return found;
end $$;
grant execute on function public.save_slip(uuid, text, text, text, text, text[], boolean, date, text, timestamptz),
  public.archive_slip(uuid, boolean), public.delete_slip(uuid) to authenticated;
