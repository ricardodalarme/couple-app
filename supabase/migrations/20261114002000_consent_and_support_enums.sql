-- Consents and support topics are closed sets, so they become enum types like the other value sets.
-- Function parameters stay text and are cast inside, because pg_graphql does not expose functions with enum arguments.

create type public.consent_kind as enum ('sensitive_data', 'analytics', 'marketing', 'ai', 'terms', 'sensitive_tracks');
create type public.support_topic as enum ('account', 'billing', 'bug', 'other');

alter table public.consents drop constraint consents_kind_check;
alter table public.consents
  alter column kind type public.consent_kind using kind::public.consent_kind;

alter table private.support_requests drop constraint support_requests_topic_check;
alter table private.support_requests
  alter column topic type public.support_topic using topic::public.support_topic;

create or replace function public.create_support_request(
  topic text,
  message text,
  reply_email text default null,
  app_version text default null
) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user();
begin
  if not private.hit_rate_limit('support:' || v_uid, 5, interval '1 day') then
    raise exception 'RATE_LIMITED' using errcode = 'P0001';
  end if;
  insert into private.support_requests (profile_id, topic, message, reply_email, app_version)
  values (v_uid, create_support_request.topic::public.support_topic, btrim(create_support_request.message),
          create_support_request.reply_email, create_support_request.app_version);
  return true;
end $$;
