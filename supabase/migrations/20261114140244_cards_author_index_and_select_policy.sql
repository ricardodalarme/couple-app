DROP POLICY "cards_select_author" ON "public"."cards";

DROP POLICY "cards_select_recipient" ON "public"."cards";

CREATE INDEX cards_author_idx ON public.cards USING btree (author_id, sent_at DESC);

CREATE POLICY "cards_select" ON "public"."cards"
  FOR SELECT
  TO "authenticated"
  USING (((deleted_at IS NULL) AND ((author_id = ( SELECT auth.uid() AS uid)) OR ((recipient_id = ( SELECT auth.uid() AS uid)) AND (status = 'sent'::public.card_status)))));
