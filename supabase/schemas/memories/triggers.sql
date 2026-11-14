-- Memories, story and capsules: trigger functions and triggers.

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
