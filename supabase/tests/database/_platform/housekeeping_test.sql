begin;
set local search_path = tap, public, extensions;
select plan(8);

select tests.create_user('ana', 'Ana');
select tests.as_admin();

insert into private.rate_limits (key, window_start) values
  ('test:old', now() - interval '3 days'), ('test:fresh', now() - interval '1 hour');
insert into private.notification_outbox (profile_id, type, dedupe_key, sent_at, outcome) values
  (tests.uid('ana'), 'ritual', 'prune:old', now() - interval '31 days', 'sent'),
  (tests.uid('ana'), 'ritual', 'prune:recent', now() - interval '29 days', 'sent'),
  (tests.uid('ana'), 'ritual', 'prune:unsent', null, null);
insert into private.notification_outbox (profile_id, type, dedupe_key, created_at) values
  (tests.uid('ana'), 'ritual', 'prune:stale', now() - interval '40 days');
insert into cron.job_run_details (jobid, runid, status, start_time, end_time) values
  (999999, 999990001, 'succeeded', now() - interval '10 days', now() - interval '10 days'),
  (999999, 999990002, 'succeeded', now() - interval '1 hour', now() - interval '1 hour');

select private.purge_deleted_accounts();
select is((select count(*)::int from private.rate_limits where key = 'test:old'), 1, 'purging accounts leaves old rate-limit windows alone');
select is((select count(*)::int from private.notification_outbox where dedupe_key = 'prune:old'), 1, 'purging accounts leaves old sent notifications alone');

select private.prune_expired_rows();
select is((select count(*)::int from private.rate_limits where key = 'test:old'), 0, 'pruning drops rate-limit windows older than two days');
select is((select count(*)::int from private.rate_limits where key = 'test:fresh'), 1, 'pruning keeps recent rate-limit windows');
select is((select array_agg(dedupe_key order by dedupe_key) from private.notification_outbox where dedupe_key like 'prune:%'),
  array['prune:recent', 'prune:unsent'], 'pruning drops notifications queued more than 30 days ago, sent or not, and keeps the rest');
select is((select count(*)::int from cron.job_run_details where jobid = 999999 and end_time < now() - interval '7 days'), 0, 'pruning drops job history older than a week');
select is((select count(*)::int from cron.job_run_details where jobid = 999999), 1, 'pruning keeps recent job history');
select is((select count(*)::int from cron.job where jobname = 'prune-expired-rows' and command = 'select private.prune_expired_rows()'), 1, 'the pruning job is scheduled');

select * from finish();
rollback;
