-- Cards: weekly draft, editing, hold, send and single-slip send.

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

create or replace function private.build_card_draft(p_profile_id uuid) returns uuid
language plpgsql security definer set search_path = '' as $$
declare
  v_week date := private.local_week_start(p_profile_id);
  v_tz text;
  v_card uuid;
begin
  select id into v_card from public.cards where author_id = p_profile_id and week_start = v_week and kind = 'weekly';
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
  on conflict (author_id, week_start) where kind = 'weekly' do nothing returning id into v_card;
  if v_card is null then
    select id into v_card from public.cards where author_id = p_profile_id and week_start = v_week and kind = 'weekly';
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

create or replace function public.sunday_card() returns public.cards
language sql stable set search_path = '' as $$
  select c.* from public.cards c
  where c.author_id = auth.uid() and c.week_start = private.local_week_start(auth.uid())
    and c.kind = 'weekly' and c.deleted_at is null;
$$;

create function public.send_slip_now(slip_id uuid, note text default null) returns public.cards
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_slip public.slips; v_card public.cards;
begin
  select * into v_slip from public.slips s
  where s.id = slip_id and s.author_id = v_uid and s.deleted_at is null and s.kind <> 'invisible';
  if not found then raise exception 'SLIP_NOT_ELIGIBLE' using errcode = 'P0001'; end if;
  insert into public.cards (author_id, week_start, kind, note)
  values (v_uid, private.local_week_start(v_uid), 'single', nullif(btrim(send_slip_now.note), '')) returning * into v_card;
  insert into public.card_items (card_id, slip_id, body, feeling, position) values (v_card.id, v_slip.id, v_slip.body, v_slip.feeling, 1);
  return public.send_card(v_card.id);
end $$;
grant execute on function public.send_slip_now(uuid, text) to authenticated;

grant execute on function public.sunday_card(), public.prepare_card(), public.update_card_draft(uuid, uuid[], text),
  public.hold_card(uuid), public.send_card(uuid), public.delete_card(uuid), public.mark_card_read(uuid),
  public.react_to_card(uuid, text, text) to authenticated;
