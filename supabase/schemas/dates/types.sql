-- Important dates and date ideas: enum types.

create type public.date_idea_status as enum ('saved', 'planned', 'done');
create type public.important_date_kind as enum ('relationship', 'birthday', 'first', 'holiday', 'trip', 'reunion', 'custom');
create type public.important_date_origin as enum ('manual', 'auto', 'chat');
