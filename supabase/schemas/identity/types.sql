-- Identity: enum types.

create type public.avatar_kind as enum ('photo', 'illustration', 'initials');
create type public.card_channel as enum ('link', 'app');
create type public.heavy_day_sharing as enum ('off', 'ask', 'always');

create type public.app_theme as enum ('rosa', 'azul', 'neutro');
create type public.relationship_goal as enum ('keep', 'reconnect', 'after_fight');
create type public.relationship_phase as enum ('beginning', 'dating', 'living_together', 'married', 'with_kids', 'long_distance');
create type public.member_role as enum ('inviter', 'invitee');

alter type public.relationship_phase add value if not exists 'engaged';
alter type public.relationship_phase add value if not exists 'restarting';
alter type public.relationship_phase add value if not exists 'with_parents';
create type public.relationship_status as enum ('together', 'on_break', 'ended', 'bereaved');
