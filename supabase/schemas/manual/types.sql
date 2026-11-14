-- My manual and partner facts: enum types.

create type public.partner_fact_category as enum ('likes', 'dislikes', 'sizes', 'health', 'comfort', 'people', 'other');
create type public.partner_fact_source as enum ('manual', 'chat', 'game', 'learning');
