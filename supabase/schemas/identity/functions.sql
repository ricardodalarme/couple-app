-- Identity: functions.

-- Membership helpers used by every policy. Security definer so policies do not recurse into RLS.
create function private.current_couple_id() returns uuid
language sql stable security definer set search_path = '' as $$
  select couple_id from public.couple_members where profile_id = auth.uid() and left_at is null;
$$;
create function private.is_couple_member(p_couple_id uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select exists (
    select 1 from public.couple_members
    where couple_id = p_couple_id and profile_id = auth.uid() and left_at is null);
$$;
create function private.partner_id() returns uuid
language sql stable security definer set search_path = '' as $$
  select other.profile_id
  from public.couple_members me
  join public.couple_members other on other.couple_id = me.couple_id and other.profile_id <> me.profile_id
  where me.profile_id = auth.uid() and me.left_at is null and other.left_at is null;
$$;
grant execute on function private.current_couple_id(), private.is_couple_member(uuid), private.partner_id() to authenticated;

-- Self-healing: the app calls this once after sign-in; creates the rows if the trigger ever failed.
create function public.ensure_profile() returns public.profiles
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_row public.profiles;
begin
  perform private.bootstrap_profile(v_uid, null);
  select * into v_row from public.profiles where id = v_uid;
  return v_row;
end $$;

create function public.my_profile() returns public.profiles
language sql stable set search_path = '' as $$
  select * from public.profiles where id = auth.uid();
$$;
create function public.my_settings() returns public.profile_settings
language sql stable set search_path = '' as $$
  select * from public.profile_settings where profile_id = auth.uid();
$$;
create function public.my_couple() returns public.couples
language sql stable set search_path = '' as $$
  select * from public.couples where id = private.current_couple_id();
$$;
create function public.my_partner() returns public.profiles
language sql stable set search_path = '' as $$
  select * from public.profiles where id = private.partner_id();
$$;
grant execute on function public.ensure_profile(), public.my_profile(), public.my_settings(), public.my_couple(), public.my_partner() to authenticated;

create function private.bootstrap_profile(p_user_id uuid, p_name text) returns void
language plpgsql security definer set search_path = '' as $$
begin
  insert into public.profiles (id, display_name)
  values (p_user_id, nullif(left(btrim(coalesce(p_name, '')), 60), ''))
  on conflict (id) do nothing;
  insert into public.profile_settings (profile_id) values (p_user_id) on conflict (profile_id) do nothing;
  insert into public.notification_settings (profile_id) values (p_user_id) on conflict (profile_id) do nothing;
end $$;

create function public.partner_time_zone() returns text
language sql stable security definer set search_path = '' as $$
  select s.time_zone from public.profile_settings s where s.profile_id = private.partner_id();
$$;
grant execute on function public.partner_time_zone() to authenticated;

-- "Terminamos" / after unpairing: remove what I created in the shared space, or keep it private to me.
create function public.resolve_shared_items(keep boolean) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); t text;
begin
  if private.current_couple_id() is not null then raise exception 'STILL_PAIRED' using errcode = 'P0001'; end if;
  foreach t in array array['rituals', 'logistic_items', 'logistics_meetings', 'planning_areas', 'saved_date_ideas', 'important_dates',
    'memories', 'story_events', 'lists', 'agreements', 'capsules', 'decisions', 'gift_ideas'] loop
    if keep then
      execute format('update public.%I set couple_id = null where author_id = $1 and couple_id is not null', t) using v_uid;
    else
      execute format('delete from public.%I where author_id = $1 and couple_id is not null', t) using v_uid;
    end if;
  end loop;
  return true;
end $$;
grant execute on function public.resolve_shared_items(boolean) to authenticated;

-- Either person can switch touch topics off for both; the flag lives on the couple.
create function public.set_touch_topics(enabled boolean) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_couple uuid := private.current_couple_id();
begin
  if v_couple is null then raise exception 'NOT_PAIRED' using errcode = 'P0001'; end if;
  update public.couples c set touch_topics_enabled = set_touch_topics.enabled where c.id = v_couple;
  perform private.signal('couple:' || v_couple, 'touch_topics_changed');
  return set_touch_topics.enabled;
end $$;
grant execute on function public.set_touch_topics(boolean) to authenticated;
