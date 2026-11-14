-- Notifications: views.

-- Shape handed to the sender. Payloads are generic: never names or content, only type and ref id.
create view private.push_job with (security_invoker = true) as
  select o.id as outbox_id, o.profile_id, o.type, o.ref_id, false as discreet, null::text[] as tokens
  from private.notification_outbox o where false;
