-- Mascot chat: enum types.

create type public.learned_item_status as enum ('pending', 'confirmed', 'rejected');
create type public.learned_item_target as enum ('partner_fact', 'date', 'memory', 'commitment');
