-- Memories, story and capsules: enum types.

create type public.date_precision as enum ('day', 'month', 'year');
create type public.memory_origin as enum ('manual', 'slip', 'card', 'question', 'game', 'mission', 'share', 'chat', 'first');
create type public.story_event_kind as enum ('met', 'dating', 'engaged', 'married', 'custom');
