-- Scheduled jobs (pg_cron). Declared here so a declarative sync keeps them instead of unscheduling them.
select cron.schedule('weekly-card-drafts', '5 * * * *', 'select private.generate_weekly_cards()');
select cron.schedule('expire-pauses', '*/10 * * * *', 'select private.expire_pauses()');
select cron.schedule('purge-deleted-accounts', '17 3 * * *', 'select private.purge_deleted_accounts()');
select cron.schedule('daily-reminders', '0 * * * *', 'select private.enqueue_daily_reminders()');
