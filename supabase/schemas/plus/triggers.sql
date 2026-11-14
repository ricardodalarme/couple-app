-- Plus: trigger functions and triggers.

-- Free limit: applies to NEW slips and to sending cards. Nothing existing is ever locked or deleted.
-- Never applied to pause, repair, safety or deletion (those have no limit check at all).
create function private.enforce_free_slip_limit() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  -- saveSlip is an upsert: editing an existing slip must keep working at the limit.
  if exists (select 1 from public.slips where id = new.id) then
    return new;
  end if;
  if not private.has_plus(new.author_id)
     and private.month_usage(new.author_id, 'slips') >= private.free_limit('slips') then
    raise exception 'FREE_LIMIT_REACHED' using errcode = 'P0001';
  end if;
  return new;
end $$;
create trigger slips_free_limit before insert on public.slips
  for each row execute function private.enforce_free_slip_limit();

create function private.enforce_free_card_limit() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  if not private.has_plus(new.author_id)
     and private.month_usage(new.author_id, 'cards') >= private.free_limit('cards') then
    raise exception 'FREE_LIMIT_REACHED' using errcode = 'P0001';
  end if;
  return new;
end $$;
create trigger cards_free_limit before update of status on public.cards
  for each row when (new.status = 'sent' and old.status <> 'sent') execute function private.enforce_free_card_limit();
