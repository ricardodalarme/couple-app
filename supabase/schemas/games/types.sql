-- Games: enum types.

create type public.game_kind as enum ('me_or_you', 'how_well', 'twenty_questions', 'never_have_we', 'compliments', 'mission');
create type public.game_outcome as enum ('great', 'ok', 'did_not_happen');
create type public.game_status as enum ('invited', 'active', 'finished', 'cancelled');
