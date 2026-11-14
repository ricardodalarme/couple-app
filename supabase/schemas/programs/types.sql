-- Programs, quizzes and daily ideas: enum types.

create type public.idea_response as enum ('will_do', 'done', 'skip', 'saved');
create type public.lesson_status as enum ('done', 'saved');
create type public.quiz_key as enum ('loved', 'conflict_style');
