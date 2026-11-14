// Removes the files of erased accounts. Invoked daily by pg_cron through private.invoke_edge_function, with the project secret key in the apikey header.
import { createClient } from "npm:@supabase/supabase-js@2";
import { isServiceCaller } from "../_shared/auth.ts";
import { json, log, sql } from "../_shared/db.ts";

Deno.serve(async (req) => {
  if (!(await isServiceCaller(req))) return json({ error: "UNAUTHORIZED" }, 401);
  const supabase = createClient(Deno.env.get("SUPABASE_URL")!, Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!);
  const rows = await sql<{ id: number; bucket: string; path: string }[]>`
    select id, bucket, path from private.storage_deletions where done_at is null order by id limit 500`;
  let removed = 0;
  for (const bucket of new Set(rows.map((r) => r.bucket))) {
    const batch = rows.filter((r) => r.bucket === bucket);
    const { error } = await supabase.storage.from(bucket).remove(batch.map((r) => r.path));
    if (!error) {
      await sql`update private.storage_deletions set done_at = now() where id = any (${batch.map((r) => r.id)})`;
      removed += batch.length;
    }
  }
  log("storage_cleanup", { removed });
  return json({ removed });
});
