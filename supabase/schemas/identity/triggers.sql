-- Identity: trigger functions and triggers.

create function private.enforce_couple_size() returns trigger
language plpgsql set search_path = '' as $$
begin
  perform 1 from public.couples where id = new.couple_id for update;
  if (select count(*) from public.couple_members where couple_id = new.couple_id and left_at is null) >= 2 then
    raise exception 'COUPLE_FULL' using errcode = '23514';
  end if;
  return new;
end $$;
create trigger couple_members_max_two before insert on public.couple_members
  for each row execute function private.enforce_couple_size();

create function private.handle_new_user() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  perform private.bootstrap_profile(
    new.id, coalesce(new.raw_user_meta_data ->> 'full_name', new.raw_user_meta_data ->> 'name'));
  return new;
end $$;
create trigger on_auth_user_created after insert on auth.users
  for each row execute function private.handle_new_user();
