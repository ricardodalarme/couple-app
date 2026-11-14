-- Realtime: signal and shared-change broadcast functions.

create function private.signal(p_topic text, p_event text) returns void
language plpgsql security definer set search_path = '' as $$
begin
  perform realtime.send('{}'::jsonb, p_event, p_topic, true);
exception when others then
  null; -- a realtime hiccup must never break the write that caused it
end $$;

-- Tell the couple when something they share changes, so a client can refetch instead of waiting for a resume.
-- Channels carry the event name and the table name only, never row content (see realtime_read_own_topics).

create function private.signal(p_topic text, p_event text, p_payload jsonb) returns void
language plpgsql security definer set search_path = '' as $$
begin
  perform realtime.send(p_payload, p_event, p_topic, true);
exception when others then
  null; -- a realtime hiccup must never break the write that caused it
end $$;

-- Rows that carry their own couple_id. Also covers the old couple when a row moves between couples or goes private.
create function private.broadcast_shared_change() returns trigger
language plpgsql security definer set search_path = '' as $$
declare
  v_new uuid; v_old uuid;
  v_payload jsonb := jsonb_build_object('table', tg_table_name);
begin
  if tg_op <> 'DELETE' then v_new := (to_jsonb(new) ->> 'couple_id')::uuid; end if;
  if tg_op <> 'INSERT' then v_old := (to_jsonb(old) ->> 'couple_id')::uuid; end if;
  if v_new is not null then perform private.signal('couple:' || v_new, 'shared_changed', v_payload); end if;
  if v_old is not null and v_old is distinct from v_new then perform private.signal('couple:' || v_old, 'shared_changed', v_payload); end if;
  return null;
end $$;

-- Children follow the couple of their parent row: tg_argv[0] is the parent table, tg_argv[1] the foreign key column.
create function private.broadcast_child_change() returns trigger
language plpgsql security definer set search_path = '' as $$
declare
  v_parent uuid; v_couple uuid;
  v_payload jsonb := jsonb_build_object('table', tg_table_name);
begin
  v_parent := (to_jsonb(case when tg_op = 'DELETE' then old else new end) ->> tg_argv[1])::uuid;
  execute format('select couple_id from public.%I where id = $1', tg_argv[0]) into v_couple using v_parent;
  if v_couple is not null then perform private.signal('couple:' || v_couple, 'shared_changed', v_payload); end if;
  return null;
end $$;

-- A shared mood or a game answer changes what the partner sees without touching a table with a couple_id.
create function private.broadcast_mood_change() returns trigger
language plpgsql security definer set search_path = '' as $$
declare v_couple uuid;
begin
  if new.share = 'none' and (tg_op = 'INSERT' or old.share = 'none') then return null; end if;
  select m.couple_id into v_couple from public.couple_members m where m.profile_id = new.author_id and m.left_at is null;
  if v_couple is not null then perform private.signal('couple:' || v_couple, 'partner_mood_changed', '{}'::jsonb); end if;
  return null;
end $$;

create function private.broadcast_game_answer() returns trigger
language plpgsql security definer set search_path = '' as $$
declare v_couple uuid;
begin
  select g.couple_id into v_couple from public.game_sessions g where g.id = new.session_id;
  if v_couple is not null then perform private.signal('couple:' || v_couple, 'game_changed', '{}'::jsonb); end if;
  return null;
end $$;
