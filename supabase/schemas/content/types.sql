-- Content: enum types.

create type public.content_kind as enum ('question', 'daily_idea', 'date_idea', 'touch_card', 'spice_card', 'mission', 'me_or_you',
  'how_well', 'never_have_we', 'program', 'lesson', 'mood_tip', 'repair_card', 'ritual_idea', 'holiday', 'notification');
