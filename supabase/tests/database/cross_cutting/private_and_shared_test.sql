begin;
set local search_path = tap, public, extensions;
select plan(39);
select tests.create_user('ana', 'Ana'); select tests.create_user('bia', 'Bia'); select tests.create_user('caio');
create temp table ids (k text primary key, id uuid) on commit drop; grant all on ids to authenticated;

-- owner-only tables: every one of them is invisible to partner and stranger, and cannot be forged
select tests.as('ana');
insert into public.temperature_checks (level) values ('fight');
insert into public.repair_learnings (kind, note) values ('trigger', 'Quando chego tarde');
insert into public.journal_entries (body) values ('Hoje eu me senti cansada');
insert into public.conversation_preps (topic) values ('Dividir as tarefas');
insert into public.partner_facts (label, value) values ('Flores favoritas', 'Girassóis');
insert into public.gift_ideas (title) values ('Carta escrita à mão');
insert into public.manual_entries (key, value) values ('comfort', 'Tempo só nosso'), ('shared_one', 'Gosto de abraço');
insert into public.moods (mood, need, share) values ('tired', 'hug', 'mood');
insert into public.cycle_days (day) values (current_date);
insert into public.quiz_results (quiz_key, ranked) values ('loved', '{time,words}');
select tests.pair('ana', 'bia');
select tests.as('bia');
select is((select count(*)::int from public.temperature_checks) + (select count(*)::int from public.repair_learnings)
  + (select count(*)::int from public.journal_entries) + (select count(*)::int from public.conversation_preps)
  + (select count(*)::int from public.partner_facts) + (select count(*)::int from public.gift_ideas)
  + (select count(*)::int from public.moods) + (select count(*)::int from public.cycle_days)
  + (select count(*)::int from public.quiz_results), 0, 'partner sees none of my private tables (temperature, journal, sheet, gifts, mood, cycle, quiz)');
select is((select count(*)::int from public.manual_entries), 0, 'my manual is private until I share an entry');
select throws_ok($$insert into public.journal_entries (author_id, body) values (tests.uid('ana'), 'forjado')$$, '42501', null, 'cannot write rows in someone else''s name');
update public.partner_facts set value = 'x'; delete from public.journal_entries;
select tests.as('ana');
select is((select value from public.partner_facts), 'Girassóis', 'partner update on my row does nothing');
select is((select count(*)::int from public.journal_entries), 1, 'partner delete on my row does nothing');
update public.manual_entries set shared = true where key = 'shared_one';
select is((select level from public.current_temperature()), 'fight', 'fight is the current temperature');
select tests.as_admin();
update public.temperature_checks set created_at = now() - interval '25 hours';
select tests.as('ana');
select is((select level from public.current_temperature()), null, 'a fight mark expires after 24 hours');
select tests.as('bia');
select is((select value from public.manual_entries), 'Gosto de abraço', 'partner reads only the manual entry I shared');
select is((select mood from public.partner_mood_today()), 'tired', 'partner sees the mood I shared');
select is((select need from public.partner_mood_today()), null, 'but not the need, which I did not share');
select tests.as('caio');
select is((select count(*)::int from public.manual_entries) + (select count(*)::int from public.moods), 0, 'stranger sees nothing');
select is((select mood from public.partner_mood_today()), null, 'stranger gets no partner mood');

-- shared tables: private until couple_id is set, then both can read and edit
select tests.as('ana');
with x as (insert into public.rituals (title) values ('Meditar') returning id) insert into ids select 'private_ritual', id from x;
with x as (insert into public.rituals (title, couple_id) values ('Caminhada de domingo', private.current_couple_id()) returning id) insert into ids select 'shared_ritual', id from x;
insert into public.memories (title, happened_on, couple_id) values ('Primeiro beijo', '2025-11-02', private.current_couple_id());
insert into public.memories (title) values ('Só minha');
insert into public.important_dates (title, kind, month, day, couple_id) values ('Aniversário de namoro', 'relationship', 3, 14, private.current_couple_id());
insert into public.capsules (body, opens_on, couple_id) values ('Para nós, daqui a um ano', current_date + 365, private.current_couple_id());
with x as (insert into public.agreements (title, couple_id) values ('Celular no jantar', private.current_couple_id()) returning id) insert into ids select 'agreement', id from x;
with x as (insert into public.lists (title, couple_id) values ('Viagens', private.current_couple_id()) returning id) insert into ids select 'list', id from x;
with x as (insert into public.decisions (title, couple_id) values ('Próxima viagem', private.current_couple_id()) returning id) insert into ids select 'decision', id from x;
with x as (insert into public.decision_options (decision_id, title) select id, t from ids, (values ('Lisboa'), ('Paraty')) v (t) where k = 'decision' returning id, title) insert into ids select title, id from x;
insert into public.decision_ranks (option_id, rank) select id, case k when 'Lisboa' then 1 else 2 end from ids where k in ('Lisboa', 'Paraty');
select throws_ok($$insert into public.rituals (title, couple_id) values ('x', gen_random_uuid())$$, '42501', null, 'cannot attach a row to a couple I am not in');
select tests.as('bia');
select is((select count(*)::int from public.rituals), 1, 'partner sees the shared ritual, not my private one');
select is((select count(*)::int from public.memories), 1, 'partner sees only the shared memory');
select is((select count(*)::int from public.capsules), 0, 'a sealed capsule is hidden from the partner until it opens');
select lives_ok($$update public.rituals set title = 'Caminhada' where couple_id is not null$$, 'partner can edit shared rows');
select lives_ok($$insert into public.ritual_logs (ritual_id) select id from ids where k = 'shared_ritual'$$, 'partner logs the shared ritual');
select throws_ok($$insert into public.ritual_logs (ritual_id) select id from ids where k = 'private_ritual'$$, '42501', null, 'partner cannot log my private ritual');
select lives_ok($$insert into public.list_items (list_id, title) select id, 'Lisboa' from ids where k = 'list'$$, 'partner adds to the shared list');
select is((select count(*)::int from public.decision_ranks), 0, 'partner never reads my ranking');
select is((select count(*)::int from public.decision_result((select id from ids where k = 'decision'))), 0, 'no result until both ranked');
insert into public.decision_ranks (option_id, rank) select id, case k when 'Lisboa' then 1 else 2 end from ids where k in ('Lisboa', 'Paraty');
select is((select title from public.decision_result((select id from ids where k = 'decision')) limit 1), 'Lisboa', 'result shows the shared tendency once both ranked');
select throws_ok($$update public.agreements set agreed_by = array[tests.uid('ana')]$$, '42501', null, 'nobody can agree on behalf of the other');
select is((select cardinality(agreed_by) from public.agree((select id from ids where k = 'agreement'))), 1, 'I agree for myself');
select tests.as('ana');
select is((select cardinality(agreed_by) from public.agree((select id from ids where k = 'agreement'))), 2, 'both agreed');
select is((select title from public.rituals where couple_id is not null), 'Caminhada', 'I see my partner''s edit');
select tests.as('caio');
select is((select count(*)::int from public.rituals) + (select count(*)::int from public.memories) + (select count(*)::int from public.important_dates)
  + (select count(*)::int from public.lists) + (select count(*)::int from public.list_items) + (select count(*)::int from public.agreements)
  + (select count(*)::int from public.decisions) + (select count(*)::int from public.ritual_logs), 0, 'stranger sees nothing of the couple');
select is((select count(*)::int from public.timeline_items), 0, 'stranger timeline is empty');

-- timeline and jar
select tests.as('ana');
select public.save_slip('00000000-0000-4000-8000-0000000000e1', 'Fez o café');
select is((select in_jar from public.set_slip_details('00000000-0000-4000-8000-0000000000e1', 'did', null, true)), true, 'slip goes to the bad-day jar');
select is((select id from public.draw_from_jar()), '00000000-0000-4000-8000-0000000000e1'::uuid, 'the jar draws my own slip');
select is((select count(*)::int from public.timeline_items), 3, 'my timeline: 2 memories + 1 slip');
select tests.as('bia');
select is((select count(*)::int from public.timeline_items), 1, 'partner timeline has the shared memory only, never my slips');
select is((select id from public.draw_from_jar()), null, 'partner jar is empty');

-- unpair, then decide what happens to shared items
select tests.as('ana');
select throws_ok('select public.resolve_shared_items(true)', 'P0001', 'STILL_PAIRED', 'shared items are only resolved after unpairing');
select public.unpair();
select tests.as('bia');
select is((select count(*)::int from public.rituals) + (select count(*)::int from public.memories), 0, 'after unpair the partner loses the shared space');
select tests.as('ana');
select is((select count(*)::int from public.rituals), 2, 'I keep what I created');
select is(public.resolve_shared_items(true), true, 'keep a private copy of what I shared');
select is((select count(*)::int from public.memories where couple_id is not null), 0, 'kept items are private again');

select * from finish();
rollback;
