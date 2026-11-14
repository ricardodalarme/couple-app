-- Content: functions.

-- Spice cards exist only for couples where both switched the mode on; unpublished rows never leave the database.
create function private.spice_allowed() returns boolean
language sql stable security definer set search_path = '' as $$
  select coalesce((select bool_and(s.spice_enabled) and count(*) = 2
                   from public.profile_settings s
                   where s.profile_id in (auth.uid(), private.partner_id())), false);
$$;
grant execute on function private.spice_allowed() to authenticated;

-- The same question (or idea) for both partners on the same day: a deterministic pick from the catalog.
-- Compares as text so an unsupported kind still returns nothing instead of failing the cast.
create function public.daily_content(kind text) returns public.content_items
language sql stable security definer set search_path = '' as $$
  with me as (
    -- UTC day, so partners in different time zones still share the same pick
    select s.locale, (now() at time zone 'UTC')::date as today,
           coalesce(private.current_couple_id(), s.profile_id) as seed
    from public.profile_settings s where s.profile_id = auth.uid()),
  pool as (
    select c.*, row_number() over (order by c.position, c.slug) - 1 as n, count(*) over () as total
    from public.content_items c, me
    where c.kind::text = daily_content.kind and daily_content.kind in ('question', 'daily_idea', 'mission', 'touch_card')
      and c.published and not c.plus_only and c.locale = me.locale)
  select p.id, p.kind, p.slug, p.locale, p.title, p.body, p.parent_slug, p.position, p.tags, p.month, p.day, p.country,
         p.plus_only, p.sensitive, p.published
  from pool p, me
  where p.n = (((me.today - date '2026-01-01') + abs(hashtext(me.seed::text)) % 97) % p.total);
$$;
grant execute on function public.daily_content(text) to authenticated;
