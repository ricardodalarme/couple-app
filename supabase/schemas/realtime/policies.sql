-- Realtime: who may read which channel.

-- Realtime ------------------------------------------------------------------------------------------
-- Private channels `couple:<couple_id>` and `user:<profile_id>` carry event names only, never content.
create policy realtime_read_own_topics on realtime.messages for select to authenticated
  using (realtime.topic() = 'user:' || (select auth.uid())::text
      or realtime.topic() = 'couple:' || (select private.current_couple_id())::text);
