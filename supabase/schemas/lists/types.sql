-- Lists: enum types.

create type public.list_item_status as enum ('dream', 'planned', 'done');
create type public.list_kind as enum ('travel', 'restaurants', 'movies', 'custom');
