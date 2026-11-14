-- Agreements: functions.

-- Agreements: each partner adds their own agreement, nobody can agree for the other.
create function public.agree(agreement_id uuid, agreed boolean default true) returns public.agreements
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_row public.agreements;
begin
  update public.agreements a
  set agreed_by = case when agreed then array(select distinct unnest(a.agreed_by || v_uid)) else array_remove(a.agreed_by, v_uid) end
  where a.id = agreement_id and (a.author_id = v_uid or a.couple_id = private.current_couple_id())
  returning a.* into v_row;
  if v_row.id is null then raise exception 'NOT_FOUND' using errcode = 'P0001'; end if;
  return v_row;
end $$;
