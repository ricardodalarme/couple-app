-- Capsules: sealed until the open date, author-only writes, and nobody edits after sealing.
drop policy capsules_update_own_or_couple on public.capsules;
drop policy capsules_delete_own_or_couple on public.capsules;
revoke update on public.capsules from authenticated;
create policy capsules_delete_own on public.capsules for delete to authenticated
  using (author_id = (select auth.uid()));

create function private.enforce_capsule_open_window() returns trigger
language plpgsql set search_path = '' as $$
begin
  if new.opens_on < current_date + 7 then
    raise exception 'CAPSULE_OPENS_TOO_SOON' using errcode = '23514';
  end if;
  if new.opens_on > (current_date + interval '50 years')::date then
    raise exception 'CAPSULE_OPENS_TOO_FAR' using errcode = '23514';
  end if;
  return new;
end $$;
create trigger capsules_open_window before insert on public.capsules
  for each row execute function private.enforce_capsule_open_window();
