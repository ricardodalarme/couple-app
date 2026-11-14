-- Nothing reads totalCount or aggregate, and totalCount can be expensive on large tables, so the directive goes.
-- Re-enable it with `"totalCount": {"enabled": true}, "aggregate": {"enabled": true}` on the one table that gets a consumer.

comment on table public.journal_entries is e'@graphql({"description": "Private journal. Never visible to the partner."})';
comment on table public.partner_facts is e'@graphql({"max_rows": 200, "description": "What one person knows about their partner. Private to the author."})';
comment on table public.moods is e'@graphql({"description": "One mood per person per day. The partner only sees it through partner_mood_today, as far as `share` allows."})';
comment on table public.idea_responses is e'@graphql({"description": "What a person did with a daily idea. Private to the author."})';
comment on table public.lesson_progress is e'@graphql({"description": "A lesson a person finished or saved inside a program. Private to the author."})';
comment on table public.rituals is e'@graphql({"description": "A recurring thing to do together. Private while couple_id is null."})';
comment on table public.ritual_logs is e'@graphql({"description": "One occurrence of a ritual, done or skipped. Follows the visibility of its ritual."})';
comment on table public.logistic_items is e'@graphql({"max_rows": 200, "description": "A shared logistics task. Private while couple_id is null."})';
comment on table public.saved_date_ideas is e'@graphql({"description": "A saved date idea. Private while couple_id is null."})';
comment on table public.important_dates is e'@graphql({"max_rows": 200, "description": "A date that matters: month and day, with an optional year. Private while couple_id is null."})';
comment on table public.memories is e'@graphql({"max_rows": 200, "description": "A remembered moment. Private while couple_id is null."})';
comment on table public.story_events is e'@graphql({"description": "A milestone in the couple story. Private while couple_id is null."})';
comment on table public.lists is e'@graphql({"description": "A list of things to do together. Private while couple_id is null."})';
comment on table public.list_items is e'@graphql({"max_rows": 500, "description": "An item of a list, ordered by position. Follows the visibility of its list."})';
comment on table public.capsules is e'@graphql({"description": "A message sealed until opens_on. The partner can read it only after that day."})';
comment on table public.gift_ideas is e'@graphql({"max_rows": 200, "description": "A gift idea or wish. Shared with the partner while couple_id is set."})';
comment on table public.slips is e'@graphql({"description": "Private to the author. Reaches the partner only as a frozen copy inside a sent card."})';
comment on table public.cards is e'@graphql({"description": "A card made of slips. Drafts and held cards are private to the author; the recipient sees sent cards."})';
comment on table public.content_items is e'@graphql({"max_rows": 500, "description": "Editorial content. tags carry filters (phase, goal, budget, time, energy, place). holiday rows use month/day/country."})';
comment on table public.signals is e'@graphql({"description": "A one-tap message between partners. Visible to the sender and the recipient."})';
comment on table public.partner_messages is e'@graphql({"description": "A note, drawing, voice message or pack sent to the partner. Visible to the sender and the recipient."})';
comment on table public.question_answers is e'@graphql({"description": "An answer to a couple question. The partner''s answer stays hidden until the reader has answered too."})';
comment on table public.checkin_answers is e'@graphql({"description": "One of four weekly check-in answers. Revealed only when both partners have finished the week."})';
comment on table public.game_answers is e'@graphql({"max_rows": 200, "description": "An answer inside a game. Private to the author until the session is finished."})';
comment on table public.learned_items is e'@graphql({"description": "Something the assistant learned about the partner, waiting for the person to confirm or reject it."})';
comment on view public.timeline_items is e'@graphql({"primary_key_columns": ["id"], "description": "Memories, story events and important dates in one chronological feed."})';
