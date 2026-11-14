-- Wellbeing: enum types.

create type public.conversation_guide as enum ('free', 'transition', 'money', 'apology', 'difficult');
create type public.cycle_day_kind as enum ('heavy', 'light', 'note');
create type public.mood as enum ('happy', 'tired', 'sad', 'stressed', 'loving', 'playful');
create type public.mood_need as enum ('listen', 'opinion', 'hug', 'space');
create type public.mood_share as enum ('none', 'mood', 'mood_need');
create type public.repair_feeling as enum ('calmer', 'still_tense', 'need_more_time');
create type public.repair_learning_kind as enum ('trigger', 'need', 'good_fix');
create type public.repair_path as enum ('pause', 'quick', 'soft_start', 'guided', 'apology');
create type public.temperature_level as enum ('good', 'so_so', 'turbulent', 'fight');
