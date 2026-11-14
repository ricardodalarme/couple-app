-- Identity: invites, pairing and unpairing.

create function private.hash_invite_code(p_code text) returns bytea
language sql immutable set search_path = '' as $$
  select extensions.digest(upper(regexp_replace(coalesce(p_code, ''), '[^A-Za-z0-9]', '', 'g')), 'sha256');
$$;

create function public.create_invite() returns public.invite_created
language plpgsql security definer set search_path = '' as $$
declare
  v_uid uuid := private.require_user();
  v_alphabet constant text := 'ABCDEFGHJKMNPQRSTUVWXYZ23456789';
  v_code text := '';
  v_bytes bytea := extensions.gen_random_bytes(8);
  v_row public.invite_created;
begin
  if private.current_couple_id() is not null then
    raise exception 'ALREADY_PAIRED' using errcode = 'P0001';
  end if;
  if not private.hit_rate_limit('create_invite:' || v_uid, 10, interval '1 day') then
    raise exception 'RATE_LIMITED' using errcode = 'P0001';
  end if;
  for i in 0..7 loop
    v_code := v_code || substr(v_alphabet, 1 + get_byte(v_bytes, i) % length(v_alphabet), 1);
  end loop;
  update public.invites set cancelled_at = now()
  where created_by = v_uid and used_at is null and cancelled_at is null;
  insert into public.invites (created_by, code_hash, expires_at)
  values (v_uid, private.hash_invite_code(v_code), now() + interval '7 days')
  returning id, v_code, expires_at into v_row;
  return v_row;
end $$;

-- Returns the couple on success and NULL for any invalid code (expired, used, cancelled, own, unknown,
-- or either side already paired): one generic answer, no enumeration. Failed attempts are counted.
create function public.accept_invite(code text) returns public.couples
language plpgsql security definer set search_path = '' as $$
declare
  v_uid uuid := private.require_user();
  v_invite public.invites;
  v_couple public.couples;
begin
  if not private.hit_rate_limit('accept_invite:' || v_uid, 10, interval '1 hour') then
    raise exception 'RATE_LIMITED' using errcode = 'P0001';
  end if;
  select * into v_invite from public.invites where code_hash = private.hash_invite_code(code) for update;
  if not found or v_invite.cancelled_at is not null or v_invite.created_by = v_uid then
    return null;
  end if;
  if v_invite.used_at is not null then
    -- Retry after a dropped response: same person, still paired with the inviter.
    if v_invite.used_by = v_uid then
      select c.* into v_couple from public.couples c
      where c.id = private.current_couple_id()
        and exists (select 1 from public.couple_members m
                    where m.couple_id = c.id and m.profile_id = v_invite.created_by and m.left_at is null);
      return v_couple;
    end if;
    return null;
  end if;
  if v_invite.expires_at <= now()
     or private.current_couple_id() is not null
     or exists (select 1 from public.couple_members where profile_id = v_invite.created_by and left_at is null) then
    return null;
  end if;
  insert into public.couples default values returning * into v_couple;
  insert into public.couple_members (couple_id, profile_id, role)
  values (v_couple.id, v_invite.created_by, 'inviter'), (v_couple.id, v_uid, 'invitee');
  update public.question_answers set couple_id = v_couple.id
  where author_id in (v_invite.created_by, v_uid) and couple_id is null;
  update public.invites set used_at = now(), used_by = v_uid where id = v_invite.id;
  return v_couple;
end $$;

create function public.cancel_invite(invite_id uuid) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user();
begin
  update public.invites set cancelled_at = now()
  where id = invite_id and created_by = v_uid and used_at is null and cancelled_at is null;
  return found;
end $$;

-- Ends the shared space for both. Private data of each person is untouched; shared rows become unreachable.
create function public.unpair() returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_couple_id uuid := private.current_couple_id();
begin
  if v_couple_id is null then
    return false;
  end if;
  insert into private.storage_deletions (bucket, path)
  select 'couple_photos', storage_path from public.couple_photos where couple_id = v_couple_id;
  delete from public.couple_photos where couple_id = v_couple_id;
  update public.couple_members set left_at = now() where couple_id = v_couple_id and left_at is null;
  update public.couples set archived_at = now() where id = v_couple_id;
  return true;
end $$;
grant execute on function public.create_invite(), public.accept_invite(text), public.cancel_invite(uuid), public.unpair() to authenticated;

-- Invite landing page (X-104): shows who invited, only for a code that is still valid.
create function private.invite_preview(p_code text) returns jsonb
language sql stable security definer set search_path = '' as $$
  select jsonb_build_object('inviterName', p.display_name, 'expiresAt', i.expires_at)
  from public.invites i join public.profiles p on p.id = i.created_by
  where i.code_hash = private.hash_invite_code(p_code) and i.used_at is null and i.cancelled_at is null and i.expires_at > now();
$$;
