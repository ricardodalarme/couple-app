-- A couple living with parents gets its own Juntos variant.
alter type public.relationship_phase add value if not exists 'with_parents';
