-- Sunday card: weekly draft from slips, hold/send, receive, open and react. (BE-009, BE-010)
create type public.card_status as enum ('draft', 'held', 'sent');

alter table public.profile_settings add column share_read_receipts boolean not null default false;
grant update (share_read_receipts) on public.profile_settings to authenticated;

create table public.cards (
  id uuid primary key default gen_random_uuid(),
  author_id uuid not null references public.profiles (id) on delete cascade,
  recipient_id uuid references public.profiles (id) on delete set null,
  couple_id uuid references public.couples (id) on delete set null,
  week_start date not null,
  status public.card_status not null default 'draft',
  note text check (char_length(note) <= 500),
  sent_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  deleted_at timestamptz,
  constraint cards_one_per_week unique (author_id, week_start),
  constraint cards_sent_has_time check ((status = 'sent') = (sent_at is not null))
);
create index cards_recipient_idx on public.cards (recipient_id, sent_at desc) where status = 'sent';
create index cards_couple_id_idx on public.cards (couple_id);
comment on table public.cards is e'@graphql({"totalCount": {"enabled": true}})';
comment on constraint cards_author_id_fkey on public.cards is e'@graphql({"foreign_name": "author", "local_name": "authoredCards"})';
comment on constraint cards_recipient_id_fkey on public.cards is e'@graphql({"foreign_name": "recipient", "local_name": "receivedCards"})';
create trigger cards_set_updated_at before update on public.cards
  for each row execute function private.set_updated_at();

-- Frozen copy of the slip text: later edits to a slip never change a card.
create table public.card_items (
  id uuid primary key default gen_random_uuid(),
  card_id uuid not null references public.cards (id) on delete cascade,
  slip_id uuid references public.slips (id) on delete set null,
  body text not null,
  feeling text,
  position integer not null,
  constraint card_items_slip_once unique (card_id, slip_id)
);
create index card_items_slip_id_idx on public.card_items (slip_id);
comment on constraint card_items_card_id_fkey on public.card_items is e'@graphql({"foreign_name": "card", "local_name": "items"})';

create table public.card_reactions (
  card_id uuid primary key references public.cards (id) on delete cascade,
  reaction text check (char_length(reaction) between 1 and 16),
  reply text check (char_length(btrim(reply)) between 1 and 500),
  from_guest boolean not null default false,
  reacted_at timestamptz not null default now(),
  constraint card_reactions_not_empty check (reaction is not null or reply is not null)
);
comment on constraint card_reactions_card_id_fkey on public.card_reactions is e'@graphql({"foreign_name": "card", "local_name": "reaction"})';

-- Opened only when a person taps Open. The author sees it only if the recipient shares read receipts.
create table public.card_opens (
  card_id uuid primary key references public.cards (id) on delete cascade,
  opened_at timestamptz not null default now()
);
comment on constraint card_opens_card_id_fkey on public.card_opens is e'@graphql({"foreign_name": "card", "local_name": "open"})';

create function private.shares_read_receipts(p_profile_id uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select coalesce((select share_read_receipts from public.profile_settings where profile_id = p_profile_id), false);
$$;
grant execute on function private.shares_read_receipts(uuid) to authenticated;

alter table public.cards enable row level security;
alter table public.card_items enable row level security;
alter table public.card_reactions enable row level security;
alter table public.card_opens enable row level security;
grant select on public.cards, public.card_items, public.card_reactions, public.card_opens to authenticated;

create policy cards_select_author on public.cards for select to authenticated
  using (author_id = (select auth.uid()) and deleted_at is null);
create policy cards_select_recipient on public.cards for select to authenticated
  using (recipient_id = (select auth.uid()) and status = 'sent' and deleted_at is null);
create policy card_items_select_visible_card on public.card_items for select to authenticated
  using (exists (select 1 from public.cards c where c.id = card_id));
create policy card_reactions_select_visible_card on public.card_reactions for select to authenticated
  using (exists (select 1 from public.cards c where c.id = card_id));
create policy card_opens_select_recipient_or_shared on public.card_opens for select to authenticated
  using (exists (
    select 1 from public.cards c
    where c.id = card_id
      and (c.recipient_id = (select auth.uid())
           or (c.author_id = (select auth.uid()) and private.shares_read_receipts(c.recipient_id)))));

-- Monday of the current week in the person's time zone.
create function private.local_week_start(p_profile_id uuid) returns date
language sql stable security definer set search_path = '' as $$
  select date_trunc('week', now() at time zone s.time_zone)::date
  from public.profile_settings s where s.profile_id = p_profile_id;
$$;

-- Creates this week's draft from eligible slips. Never overwrites an existing card. Returns the card id or null.
create function private.build_card_draft(p_profile_id uuid) returns uuid
language plpgsql security definer set search_path = '' as $$
declare
  v_week date := private.local_week_start(p_profile_id);
  v_tz text;
  v_card uuid;
begin
  select id into v_card from public.cards where author_id = p_profile_id and week_start = v_week;
  if v_card is not null then
    return v_card;
  end if;
  select time_zone into v_tz from public.profile_settings where profile_id = p_profile_id;
  if not exists (
    select 1 from public.slips s
    where s.author_id = p_profile_id and s.for_card and s.kind <> 'invisible'
      and s.deleted_at is null and s.archived_at is null
      and (s.created_at at time zone v_tz)::date >= v_week) then
    return null;
  end if;
  insert into public.cards (author_id, week_start) values (p_profile_id, v_week)
  on conflict on constraint cards_one_per_week do nothing returning id into v_card;
  if v_card is null then
    select id into v_card from public.cards where author_id = p_profile_id and week_start = v_week;
    return v_card;
  end if;
  insert into public.card_items (card_id, slip_id, body, feeling, position)
  select v_card, s.id, s.body, s.feeling, row_number() over (order by s.created_at)
  from public.slips s
  where s.author_id = p_profile_id and s.for_card and s.kind <> 'invisible'
    and s.deleted_at is null and s.archived_at is null
    and (s.created_at at time zone v_tz)::date >= v_week;
  return v_card;
end $$;

-- Hourly job: drafts for everyone whose local time is Sunday 09:00 or later.
create function private.generate_weekly_cards() returns integer
language plpgsql security definer set search_path = '' as $$
declare v_profile uuid; v_count integer := 0;
begin
  for v_profile in
    select s.profile_id from public.profile_settings s
    where extract(dow from now() at time zone s.time_zone) = 0
      and extract(hour from now() at time zone s.time_zone) >= 9
      and not exists (select 1 from public.cards c
                      where c.author_id = s.profile_id
                        and c.week_start = date_trunc('week', now() at time zone s.time_zone)::date)
  loop
    if private.build_card_draft(v_profile) is not null then
      v_count := v_count + 1;
    end if;
  end loop;
  return v_count;
end $$;
select cron.schedule('weekly-card-drafts', '5 * * * *', 'select private.generate_weekly_cards()');

create function private.own_editable_card(p_card_id uuid) returns public.cards
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_card public.cards;
begin
  select * into v_card from public.cards
  where id = p_card_id and author_id = v_uid and deleted_at is null for update;
  if not found then
    raise exception 'CARD_NOT_FOUND' using errcode = 'P0001';
  end if;
  if v_card.status = 'sent' then
    raise exception 'CARD_ALREADY_SENT' using errcode = 'P0001';
  end if;
  return v_card;
end $$;
grant execute on function private.own_editable_card(uuid) to authenticated;

-- This week's card for the caller (any status), or null. Read-only.
create function public.sunday_card() returns public.cards
language sql stable set search_path = '' as $$
  select c.* from public.cards c
  where c.author_id = auth.uid() and c.week_start = private.local_week_start(auth.uid()) and c.deleted_at is null;
$$;
grant execute on function private.local_week_start(uuid) to authenticated;

-- Builds the draft on demand (same rules as the Sunday job). Null when the week has no eligible slips.
create function public.prepare_card() returns public.cards
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_id uuid; v_card public.cards;
begin
  v_id := private.build_card_draft(v_uid);
  select * into v_card from public.cards where id = v_id and deleted_at is null;
  return v_card;
end $$;

-- Replaces the items with exactly these slips (in this order) and optionally the note.
create function public.update_card_draft(card_id uuid, slip_ids uuid[], note text default null) returns public.cards
language plpgsql security definer set search_path = '' as $$
declare v_card public.cards := private.own_editable_card(card_id);
begin
  if exists (
    select 1 from unnest(slip_ids) as wanted (id)
    where not exists (select 1 from public.slips s
                      where s.id = wanted.id and s.author_id = v_card.author_id and s.kind <> 'invisible'
                        and s.for_card and s.deleted_at is null)) then
    raise exception 'SLIP_NOT_ELIGIBLE' using errcode = 'P0001';
  end if;
  delete from public.card_items i where i.card_id = v_card.id;
  insert into public.card_items (card_id, slip_id, body, feeling, position)
  select v_card.id, s.id, s.body, s.feeling, w.ord
  from unnest(slip_ids) with ordinality as w (id, ord) join public.slips s on s.id = w.id;
  update public.cards c set note = nullif(btrim(update_card_draft.note), '')
  where c.id = v_card.id returning c.* into v_card;
  return v_card;
end $$;

create function public.hold_card(card_id uuid) returns public.cards
language plpgsql security definer set search_path = '' as $$
declare v_card public.cards := private.own_editable_card(card_id);
begin
  update public.cards c set status = 'held' where c.id = v_card.id returning c.* into v_card;
  return v_card;
end $$;

-- Sends to the current partner (recipient is null when alone: the card then travels only by guest link).
create function public.send_card(card_id uuid) returns public.cards
language plpgsql security definer set search_path = '' as $$
declare v_card public.cards := private.own_editable_card(card_id);
begin
  if not exists (select 1 from public.card_items i where i.card_id = v_card.id) then
    raise exception 'CARD_EMPTY' using errcode = 'P0001';
  end if;
  update public.card_items i set body = s.body, feeling = s.feeling
  from public.slips s where i.card_id = v_card.id and s.id = i.slip_id and s.deleted_at is null;
  update public.cards c
  set status = 'sent', sent_at = now(), recipient_id = private.partner_id(), couple_id = private.current_couple_id()
  where c.id = v_card.id returning c.* into v_card;
  return v_card;
end $$;

-- Author removes the card for both sides.
create function public.delete_card(card_id uuid) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user();
begin
  update public.cards c set deleted_at = now()
  where c.id = delete_card.card_id and c.author_id = v_uid and c.deleted_at is null;
  return found;
end $$;

create function private.received_card(p_card_id uuid) returns public.cards
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_card public.cards;
begin
  select * into v_card from public.cards
  where id = p_card_id and recipient_id = v_uid and status = 'sent' and deleted_at is null;
  if not found then
    raise exception 'CARD_NOT_FOUND' using errcode = 'P0001';
  end if;
  return v_card;
end $$;
grant execute on function private.received_card(uuid) to authenticated;

create function public.mark_card_read(card_id uuid) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_card public.cards := private.received_card(card_id);
begin
  insert into public.card_opens (card_id) values (v_card.id) on conflict do nothing;
  return true;
end $$;

create function public.react_to_card(card_id uuid, reaction text default null, reply text default null) returns public.card_reactions
language plpgsql security definer set search_path = '' as $$
declare v_card public.cards := private.received_card(card_id); v_row public.card_reactions;
begin
  insert into public.card_reactions as r (card_id, reaction, reply)
  values (v_card.id, nullif(btrim(react_to_card.reaction), ''), nullif(btrim(react_to_card.reply), ''))
  on conflict on constraint card_reactions_pkey do update
    set reaction = excluded.reaction, reply = excluded.reply, reacted_at = now(), from_guest = false
  returning r.* into v_row;
  return v_row;
end $$;

-- A deleted slip leaves unsent cards; sent cards keep their frozen copy.
create function private.drop_deleted_slip_from_drafts() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  delete from public.card_items i using public.cards c
  where i.slip_id = new.id and c.id = i.card_id and c.status <> 'sent';
  return new;
end $$;
create trigger slips_deleted_leave_drafts after update of deleted_at on public.slips
  for each row when (new.deleted_at is not null and old.deleted_at is null)
  execute function private.drop_deleted_slip_from_drafts();

grant execute on function public.sunday_card(), public.prepare_card(), public.update_card_draft(uuid, uuid[], text),
  public.hold_card(uuid), public.send_card(uuid), public.delete_card(uuid), public.mark_card_read(uuid),
  public.react_to_card(uuid, text, text) to authenticated;
