-- Either person can switch touch topics off for both; the flag lives on the couple.

alter table public.couples add column touch_topics_enabled boolean not null default true;

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
