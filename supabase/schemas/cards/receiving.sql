-- Cards: receiving, read receipts and reactions.

create function private.shares_read_receipts(p_profile_id uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select coalesce((select share_read_receipts from public.profile_settings where profile_id = p_profile_id), false);
$$;
grant execute on function private.shares_read_receipts(uuid) to authenticated;

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
