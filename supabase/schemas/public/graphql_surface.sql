-- Declarative mirror of migration 20261113130000_graphql_surface.sql. The single place for table-level GraphQL settings: page limits, counts and descriptions.
-- GraphQL surface: one place for page limits, counts and descriptions.
-- A `first` above `max_rows` is silently capped by pg_graphql, so every collection the app reads in one page gets a limit that covers it.

comment on schema public is e'@graphql({"inflect_names": true, "max_rows": 100, "introspection": true})';

-- Owner-only tables ---------------------------------------------------------------------------------
comment on table public.temperature_checks is e'@graphql({"description": "How the relationship feels right now. Private to the author; a `fight` level expires after 24 hours."})';
comment on table public.repair_sessions is e'@graphql({"description": "One guided repair after a fight. Private to the author."})';
comment on table public.repair_learnings is e'@graphql({"description": "What a person learned from a repair: a trigger, a need or a fix that worked. Private to the author."})';
comment on table public.journal_entries is e'@graphql({"totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "Private journal. Never visible to the partner."})';
comment on table public.conversation_preps is e'@graphql({"description": "Notes and a draft for a hard conversation. Private to the author."})';
comment on table public.partner_facts is e'@graphql({"max_rows": 200, "totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "What one person knows about their partner. Private to the author."})';
comment on table public.manual_entries is e'@graphql({"description": "My manual: how to love me. The partner reads only entries marked shared."})';
comment on table public.moods is e'@graphql({"totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "One mood per person per day. The partner only sees it through partner_mood_today, as far as `share` allows."})';
comment on table public.cycle_days is e'@graphql({"description": "Heavy-day tracking. Private to the author."})';
comment on table public.idea_responses is e'@graphql({"totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "What a person did with a daily idea. Private to the author."})';
comment on table public.program_enrollments is e'@graphql({"description": "A person''s enrollment in a program. Private to the author."})';
comment on table public.lesson_progress is e'@graphql({"totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "A lesson a person finished or saved inside a program. Private to the author."})';
comment on table public.quiz_results is e'@graphql({"description": "A person''s ranked quiz result (love style or conflict style). Private to the author."})';
comment on table public.decision_ranks is e'@graphql({"description": "A person''s private ranking of one decision option. Only the combined result is ever shared."})';

-- Owner + optional couple tables -----------------------------------------------------------------------
comment on table public.rituals is e'@graphql({"totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "A recurring thing to do together. Private while couple_id is null."})';
comment on table public.ritual_logs is e'@graphql({"totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "One occurrence of a ritual, done or skipped. Follows the visibility of its ritual."})';
comment on table public.logistic_items is e'@graphql({"max_rows": 200, "totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "A shared logistics task. Private while couple_id is null."})';
comment on table public.logistics_meetings is e'@graphql({"description": "The weekly logistics meeting notes. Private while couple_id is null."})';
comment on table public.planning_areas is e'@graphql({"description": "An area of shared planning and who owns it. Private while couple_id is null."})';
comment on table public.saved_date_ideas is e'@graphql({"totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "A saved date idea. Private while couple_id is null."})';
comment on table public.important_dates is e'@graphql({"max_rows": 200, "totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "A date that matters: month and day, with an optional year. Private while couple_id is null."})';
comment on table public.memories is e'@graphql({"max_rows": 200, "totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "A remembered moment. Private while couple_id is null."})';
comment on table public.story_events is e'@graphql({"totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "A milestone in the couple story. Private while couple_id is null."})';
comment on table public.lists is e'@graphql({"totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "A list of things to do together. Private while couple_id is null."})';
comment on table public.list_items is e'@graphql({"max_rows": 500, "totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "An item of a list, ordered by position. Follows the visibility of its list."})';
comment on table public.agreements is e'@graphql({"description": "An agreement between partners. Each person agrees for themselves through the agree function."})';
comment on table public.capsules is e'@graphql({"totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "A message sealed until opens_on. The partner can read it only after that day."})';
comment on table public.decisions is e'@graphql({"description": "Something to decide together. Private while couple_id is null."})';
comment on table public.decision_options is e'@graphql({"description": "An option of a decision. Follows the visibility of its decision."})';
comment on table public.gift_ideas is e'@graphql({"max_rows": 200, "totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "A gift idea or wish. Shared with the partner while couple_id is set."})';

-- Slips, cards, content ----------------------------------------------------------------------------
comment on table public.slips is e'@graphql({"totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "Private to the author. Reaches the partner only as a frozen copy inside a sent card."})';
comment on table public.cards is e'@graphql({"totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "A card made of slips. Drafts and held cards are private to the author; the recipient sees sent cards."})';
comment on table public.card_items is e'@graphql({"description": "A frozen copy of a slip inside a card."})';
comment on table public.card_reactions is e'@graphql({"description": "How the recipient reacted to a card."})';
comment on table public.card_opens is e'@graphql({"description": "When the recipient opened a card."})';
comment on table public.guest_links is e'@graphql({"description": "A shareable link to one card. The token is never stored, only its hash."})';
comment on table public.content_items is e'@graphql({"max_rows": 500, "totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "Editorial content. tags carry filters (phase, goal, budget, time, energy, place). holiday rows use month/day/country."})';
comment on table public.app_config is e'@graphql({"description": "Small key/value configuration readable by anyone, such as limits and the minimum app version."})';

-- Couple flows -------------------------------------------------------------------------------------------
comment on table public.pauses is e'@graphql({"description": "A pause with a promise to return. The partner sees only the message and the return time."})';
comment on table public.signals is e'@graphql({"totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "A one-tap message between partners. Visible to the sender and the recipient."})';
comment on table public.partner_messages is e'@graphql({"totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "A note, drawing, voice message or pack sent to the partner. Visible to the sender and the recipient."})';
comment on table public.question_answers is e'@graphql({"totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "An answer to a couple question. The partner''s answer stays hidden until the reader has answered too."})';
comment on table public.checkin_answers is e'@graphql({"totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "One of four weekly check-in answers. Revealed only when both partners have finished the week."})';
comment on table public.game_sessions is e'@graphql({"description": "A game one partner invited the other to. No score, no winner."})';
comment on table public.game_answers is e'@graphql({"max_rows": 200, "totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "An answer inside a game. Private to the author until the session is finished."})';

-- Identity, notifications, account ---------------------------------------------------------------------
comment on table public.couples is e'@graphql({"description": "A couple of two people."})';
comment on table public.couple_members is e'@graphql({"description": "A person''s membership in a couple. left_at is set when they leave."})';
comment on table public.invites is e'@graphql({"description": "An invitation to pair. Only the hash of the code is stored."})';
comment on table public.devices is e'@graphql({"description": "A device registered for push notifications. Push tokens themselves are never readable."})';
comment on table public.consents is e'@graphql({"description": "Versioned consent history; the newest row per kind is the current answer. Visible only to its owner."})';
comment on table public.deletion_requests is e'@graphql({"description": "A pending account deletion. The account is erased at purge_after unless the request is cancelled."})';
comment on table public.entitlements is e'@graphql({"description": "A person''s Plus subscription state. Readable by the person and their partner; written only by the purchase webhook."})';
comment on table public.chat_messages is e'@graphql({"description": "A message in the mascot conversation. Private to the author; the Edge Function writes the mascot side."})';
comment on table public.learned_items is e'@graphql({"totalCount": {"enabled": true}, "aggregate": {"enabled": true}, "description": "Something the assistant learned about the partner, waiting for the person to confirm or reject it."})';
comment on table public.couple_photos is e'@graphql({"description": "The photo a couple chose for their widget. Visible to the two members."})';
comment on table public.profiles is e'@graphql({"description": "Public part of a person: visible to the person and to the current partner."})';
comment on table public.profile_settings is e'@graphql({"description": "Private settings of a person. Never visible to the partner."})';
comment on table public.notification_settings is e'@graphql({"description": "card_day: 0 = Sunday. muted_types: notification type keys switched off."})';

-- Views: primary key columns are required for them to appear in the schema -------------------------------
comment on view public.partner_mood is e'@graphql({"primary_key_columns": ["id"], "description": "The mood the partner chose to share today. need is present only when they shared it."})';
comment on view public.plus_state is e'@graphql({"primary_key_columns": ["profile_id"], "description": "Whether the person has Plus, and the free-plan usage this month."})';
comment on view public.timeline_items is e'@graphql({"primary_key_columns": ["id"], "totalCount": {"enabled": true}, "description": "Memories, story events and important dates in one chronological feed."})';
comment on view public.widget_state is e'@graphql({"primary_key_columns": ["profile_id"], "description": "Everything the home-screen widget shows."})';
comment on view public.year_recap is e'@graphql({"primary_key_columns": ["profile_id"], "description": "A year in review for one person."})';
