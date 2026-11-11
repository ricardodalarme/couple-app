-- Question answers belong to the couple that was current when they were written. (APP-067)

alter table public.question_answers drop constraint question_answers_once;
alter table public.question_answers
  add constraint question_answers_once unique (author_id, couple_id, question_slug);
create unique index question_answers_solo_once on public.question_answers (author_id, question_slug)
  where couple_id is null;

create or replace function private.answered_question(p_slug text) returns boolean
language sql stable security definer set search_path = '' as $$
  select exists (select 1 from public.question_answers
                 where author_id = auth.uid() and question_slug = p_slug
                   and couple_id is not distinct from private.current_couple_id());
$$;

create or replace function public.accept_invite(code text) returns public.couples
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
