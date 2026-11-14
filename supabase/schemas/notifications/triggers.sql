-- Notifications: trigger functions and triggers.

create function private.on_card_sent() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  if new.recipient_id is not null then
    perform private.enqueue_notification(new.recipient_id, 'card_received', new.id, 'card_received:' || new.id);
    perform private.signal('user:' || new.recipient_id, 'card_received');
  end if;
  return new;
end $$;
create trigger cards_after_sent after update of status on public.cards
  for each row when (new.status = 'sent' and old.status <> 'sent') execute function private.on_card_sent();

create function private.on_card_reaction() returns trigger
language plpgsql security definer set search_path = '' as $$
declare v_author uuid;
begin
  select author_id into v_author from public.cards where id = new.card_id;
  perform private.enqueue_notification(v_author, 'card_reaction', new.card_id, 'card_reaction:' || new.card_id);
  perform private.signal('user:' || v_author, 'card_reaction');
  return new;
end $$;
create trigger card_reactions_after_write after insert or update on public.card_reactions
  for each row execute function private.on_card_reaction();

-- The person who was unpaired gets a neutral notice, not only a realtime signal.
create function private.on_membership_change() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  if tg_op = 'INSERT' then
    if new.role = 'inviter' then
      perform private.enqueue_notification(new.profile_id, 'partner_joined', new.couple_id, 'partner_joined:' || new.couple_id);
    end if;
    perform private.signal('user:' || new.profile_id, 'paired');
  elsif new.left_at is not null and old.left_at is null then
    if new.profile_id is distinct from auth.uid() then
      perform private.enqueue_notification(new.profile_id, 'unpaired', new.couple_id, 'unpaired:' || new.couple_id || ':' || new.profile_id);
    end if;
    perform private.signal('user:' || new.profile_id, 'unpaired');
  end if;
  return new;
end $$;
create trigger couple_members_after_change after insert or update of left_at on public.couple_members
  for each row execute function private.on_membership_change();
