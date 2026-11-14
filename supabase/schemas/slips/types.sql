-- Slips: enum types.

create type public.slip_category as enum ('said', 'did', 'noticed', 'helped');
create type public.work_area as enum ('planning', 'dates', 'kitchen', 'cleaning', 'kids', 'emotional', 'finances', 'other');

create type public.slip_kind as enum ('quick', 'specific', 'if_then', 'invisible');
