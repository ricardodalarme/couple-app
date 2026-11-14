-- Partner messages: tables, indexes and constraints.

-- Messages to the partner (note, drawing, voice, "thinking of you" pack) ------------------------------
create table public.partner_messages (
  id uuid primary key default gen_random_uuid(),
  sender_id uuid not null references public.profiles (id) on delete cascade,
  recipient_id uuid not null references public.profiles (id) on delete cascade,
  kind public.partner_message_kind not null,
  body text check (char_length(body) <= 280),
  media_path text check (char_length(media_path) <= 300),
  for_widget boolean not null default false,
  seen_at timestamptz,
  hearted_at timestamptz,
  created_at timestamptz not null default now(),
  constraint partner_messages_has_content check (body is not null or media_path is not null)
);
create index partner_messages_recipient_idx on public.partner_messages (recipient_id, created_at desc);
create index partner_messages_sender_idx on public.partner_messages (sender_id, created_at desc);
