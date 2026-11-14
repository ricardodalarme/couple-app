-- Cards: enum types.

create type public.card_kind as enum ('weekly', 'single');

create type public.card_status as enum ('draft', 'held', 'sent');
