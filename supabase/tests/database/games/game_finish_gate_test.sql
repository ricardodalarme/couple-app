begin;
set local search_path = tap, public, extensions;
select plan(9);
select tests.create_user('gate_ana', 'Ana');
select tests.create_user('gate_bia', 'Bia');
select tests.create_user('gate_caio', 'Caio');
select tests.create_user('gate_davi', 'Davi');
create temp table ids (k text primary key, id uuid) on commit drop;
grant all on ids to authenticated;

select tests.pair('gate_ana', 'gate_bia');
select tests.pair('gate_caio', 'gate_davi');

-- one open session per game
select tests.as('gate_ana');
with x as (select id from public.invite_to_game('me_or_you', array['organized', 'romantic']))
insert into ids select 'open', id from x;

select throws_ok(
  $$select public.invite_to_game('me_or_you', array['organized'])$$,
  'P0001', 'GAME_ALREADY_OPEN',
  'a second invite is blocked while a session is open'
);

select tests.as('gate_bia');
select is(
  (select status from public.update_game((select id from ids where k = 'open'), 'join')),
  'active',
  'the partner joins the open session'
);

-- answer indexes stay inside the item grid
select throws_ok(
  format($$select public.answer_game(%L, 2, 'x')$$, (select id from ids where k = 'open')),
  'P0001', 'INVALID_GAME_INDEX',
  'an index past the item grid is rejected'
);
select throws_ok(
  format($$select public.answer_game(%L, -1, 'x')$$, (select id from ids where k = 'open')),
  'P0001', 'INVALID_GAME_INDEX',
  'a negative index is rejected'
);

-- one partner answering every index is not enough to finish
select public.answer_game((select id from ids where k = 'open'), 0, 'me');
select public.answer_game((select id from ids where k = 'open'), 1, 'you');

select throws_ok(
  format($$select public.update_game(%L, 'finish')$$, (select id from ids where k = 'open')),
  'P0001', 'GAME_NOT_COMPLETE',
  'one partner answering every index does not finish the game'
);

-- answers stay couple-scoped before and after the reveal
select tests.as('gate_caio');
select is(
  (select count(*)::int from public.game_answers
   where session_id = (select id from ids where k = 'open')),
  0,
  'another couple cannot select answers before the game finishes'
);
select is(
  (select count(*)::int from public.game_sessions
   where id = (select id from ids where k = 'open')),
  0,
  'another couple cannot select the session'
);

select tests.as('gate_ana');
select public.answer_game((select id from ids where k = 'open'), 0, 'you');
select public.answer_game((select id from ids where k = 'open'), 1, 'me');

select is(
  (select status from public.update_game((select id from ids where k = 'open'), 'finish')),
  'finished',
  'the game finishes once both answered every index'
);

select tests.as('gate_caio');
select is(
  (select count(*)::int from public.game_answers
   where session_id = (select id from ids where k = 'open')),
  0,
  'another couple still cannot select answers after the game finishes'
);

select * from finish();
rollback;
