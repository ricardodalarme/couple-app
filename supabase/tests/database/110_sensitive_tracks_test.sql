begin;
set local search_path = tap, public, extensions;
select plan(12);
select tests.create_user('ana', 'Ana');
select tests.create_user('bia', 'Bia');
select tests.pair('ana', 'bia');

select tests.as('ana');

select is(
  (select count(*)::int from public.content_items
   where kind = 'program' and locale = 'pt-BR' and published and sensitive
     and slug in ('grief-together', 'illness-in-family', 'rebuild-trust')),
  3,
  'the three sensitive programs are published'
);
select is(
  (select count(*)::int from public.content_items
   where kind = 'program' and locale = 'pt-BR' and published and sensitive and not plus_only
     and slug in ('grief-together', 'illness-in-family', 'rebuild-trust')),
  3,
  'the sensitive programs are free'
);
select results_eq(
  $$select slug from public.content_items
    where kind = 'program' and locale = 'pt-BR'
      and slug in ('grief-together', 'illness-in-family', 'rebuild-trust')
    order by position$$,
  $$values ('grief-together'), ('illness-in-family'), ('rebuild-trust')$$,
  'the programs keep the 10, 11, 12 position order'
);
select is(
  (select count(*)::int from public.content_items
   where kind = 'lesson' and locale = 'pt-BR' and published and sensitive
     and parent_slug in ('grief-together', 'illness-in-family', 'rebuild-trust')),
  13,
  'there is a lesson row for every day'
);
select results_eq(
  $$select parent_slug, count(*)::int from public.content_items
    where kind = 'lesson' and locale = 'pt-BR'
      and parent_slug in ('grief-together', 'illness-in-family', 'rebuild-trust')
    group by parent_slug order by parent_slug$$,
  $$values ('grief-together', 4), ('illness-in-family', 4), ('rebuild-trust', 5)$$,
  'each program has its lesson count'
);
select is(
  (select count(*)::int from public.content_items l
   join public.content_items p
     on p.kind = 'program' and p.locale = l.locale and p.slug = l.parent_slug
   where l.kind = 'lesson' and l.locale = 'pt-BR'
     and l.parent_slug in ('grief-together', 'illness-in-family', 'rebuild-trust')),
  13,
  'every lesson points at an existing program in the same locale'
);
select is(
  (select count(*)::int from public.content_items
   where locale = 'en'
     and title in ('Luto, juntos', 'Doença na família', 'Reconstruir a confiança', 'O que ajuda hoje?',
                   'Pequenos rituais', 'Dias em que pesa mais', 'O que você quer guardar', 'Dividir a carga',
                   'Cuidar sem se esgotar', 'Falar sem alarme', 'O que não precisa ser dito', 'Conversa sincera 1',
                   'Limites', 'Pequenas provas', 'Quando a dúvida volta', 'O ritmo de cada um')),
  0,
  'the first-version copy ships in Portuguese only'
);
select lives_ok(
  $$insert into public.consents (kind, granted, version) values ('sensitive_tracks', true, '1')$$,
  'consents accept the sensitive_tracks kind'
);
select throws_ok(
  $$insert into public.consents (kind, granted, version) values ('unknown_track', true, '1')$$,
  '22P02',
  null,
  'consents reject an unknown kind'
);

insert into public.program_enrollments (program_slug, current_day)
values ('grief-together', 2);
insert into public.lesson_progress (program_slug, lesson_day, status)
values ('grief-together', 1, 'done');

select tests.as('bia');
select is(
  (select count(*)::int from public.program_enrollments),
  0,
  'the partner cannot read my enrollments'
);
select is(
  (select count(*)::int from public.lesson_progress),
  0,
  'the partner cannot read my lesson progress'
);
select is(
  (select count(*)::int from public.consents),
  0,
  'the partner cannot read my consents'
);

select * from finish();
rollback;
