-- Identity: views.

-- Return shape of create_invite: the plain code exists only in this response.
create view public.invite_created with (security_invoker = true) as
  select id, null::text as code, expires_at from public.invites where false;
comment on view public.invite_created is e'@graphql({"primary_key_columns": ["id"], "description": "Result of createInvite. The code is shown once and never stored."})';
grant select on public.invite_created to authenticated;
