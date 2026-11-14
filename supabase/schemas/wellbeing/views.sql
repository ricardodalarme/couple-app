-- Wellbeing: views.

-- Mood the partner chose to share today (need only when they shared it).
create view public.partner_mood with (security_invoker = true) as
  select m.id, m.day, m.mood, m.need from public.moods m where false;
grant select on public.partner_mood to authenticated;
