create or replace function private.chat_messages_left(p_profile_id uuid) returns integer
language sql stable security definer set search_path = '' as $$
  select greatest(0,
    coalesce((select value::integer from public.app_config
      where key = case when private.has_plus(p_profile_id) then 'chat_messages_per_day_plus' else 'chat_messages_per_day_free' end), 0)
    - (select count(*)::integer from public.chat_messages m
       where m.author_id = p_profile_id and m.role = 'user' and m.created_at >= date_trunc('day', now())));
$$;

create or replace function private.take_chat_message(p_profile_id uuid) returns uuid
language plpgsql security definer set search_path = '' as $$
declare
  v_left integer;
  v_id uuid;
begin
  perform pg_advisory_xact_lock(hashtextextended(p_profile_id::text, 0));
  v_left := private.chat_messages_left(p_profile_id);
  if v_left <= 0 then return null; end if;
  insert into public.chat_messages (author_id, role) values (p_profile_id, 'user') returning id into v_id;
  return v_id;
end $$;

create or replace function public.chat_messages_left() returns integer
language sql stable security definer set search_path = '' as $$
  select private.chat_messages_left(auth.uid());
$$;
grant execute on function public.chat_messages_left() to authenticated;

revoke delete on public.chat_messages from authenticated;
drop policy if exists chat_messages_delete_own on public.chat_messages;
