-- Games: functions.

create function public.invite_to_game(game text, item_slugs text[] default '{}') returns public.game_sessions
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_couple uuid := private.current_couple_id(); v_row public.game_sessions;
begin
  if v_couple is null then raise exception 'NOT_PAIRED' using errcode = 'P0001'; end if;
  if exists (select 1 from public.game_sessions g
             where g.couple_id = v_couple and g.game = invite_to_game.game::public.game_kind
               and g.status in ('invited', 'active')) then
    raise exception 'GAME_ALREADY_OPEN' using errcode = 'P0001';
  end if;
  insert into public.game_sessions (couple_id, game, invited_by, item_slugs)
  values (v_couple, invite_to_game.game::public.game_kind, v_uid, coalesce(invite_to_game.item_slugs, '{}')) returning * into v_row;
  perform private.enqueue_notification(private.partner_id(), 'game_invite', v_row.id, 'game_invite:' || v_row.id);
  perform private.signal('couple:' || v_couple, 'game_changed');
  return v_row;
end $$;

-- Join, cancel, or finish (finish needs both to have answered every item when the game has items).
create function public.update_game(session_id uuid, action text, outcome text default null) returns public.game_sessions
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_row public.game_sessions; v_n integer;
begin
  select * into v_row from public.game_sessions g
  where g.id = session_id and g.couple_id = private.current_couple_id() for update;
  if not found then raise exception 'NOT_FOUND' using errcode = 'P0001'; end if;
  if action = 'join' and v_row.status = 'invited' and v_row.invited_by <> v_uid then
    update public.game_sessions g set status = 'active' where g.id = v_row.id returning g.* into v_row;
  elsif action = 'cancel' and v_row.status in ('invited', 'active') then
    update public.game_sessions g set status = 'cancelled' where g.id = v_row.id returning g.* into v_row;
  elsif action = 'finish' and v_row.status = 'active' then
    v_n := coalesce(array_length(v_row.item_slugs, 1), 0);
    if v_n > 0 then
      if (select count(*) from public.couple_members m
          where m.couple_id = v_row.couple_id and m.left_at is null) <> 2
         or exists (
           select 1
           from generate_series(0, v_n - 1) as gs(i)
           cross join (select m.profile_id from public.couple_members m
                       where m.couple_id = v_row.couple_id and m.left_at is null) as member(profile_id)
           where not exists (
             select 1 from public.game_answers a
             where a.session_id = v_row.id and a.author_id = member.profile_id and a.idx = gs.i
           )
         )
      then
        raise exception 'GAME_NOT_COMPLETE' using errcode = 'P0001';
      end if;
    end if;
    update public.game_sessions g set status = 'finished', finished_at = now(), outcome = update_game.outcome::public.game_outcome
    where g.id = v_row.id returning g.* into v_row;
  else
    raise exception 'INVALID_GAME_ACTION' using errcode = 'P0001';
  end if;
  perform private.signal('couple:' || v_row.couple_id, 'game_changed');
  return v_row;
end $$;

create function public.answer_game(session_id uuid, idx integer, answer text) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_row public.game_sessions;
begin
  select * into v_row from public.game_sessions g
  where g.id = session_id and g.couple_id = private.current_couple_id() and g.status = 'active';
  if not found then raise exception 'NOT_FOUND' using errcode = 'P0001'; end if;
  if answer_game.idx < 0 or answer_game.idx >= coalesce(array_length(v_row.item_slugs, 1), 0) then
    raise exception 'INVALID_GAME_INDEX' using errcode = 'P0001';
  end if;
  insert into public.game_answers as a (session_id, author_id, idx, answer)
  values (answer_game.session_id, v_uid, answer_game.idx, answer_game.answer)
  on conflict on constraint game_answers_once do update set answer = excluded.answer;
  return true;
end $$;
