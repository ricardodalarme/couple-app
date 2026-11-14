-- Gifts: enum types.

create type public.gift_budget as enum ('free', 'low', 'medium', 'high');
create type public.gift_idea_kind as enum ('idea', 'wish');
create type public.gift_idea_status as enum ('idea', 'planned', 'given');
