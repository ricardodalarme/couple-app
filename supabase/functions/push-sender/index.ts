// Drains the notification outbox. Invoked every minute by pg_cron (see docs) with the service-role key.
// Preferences (quiet hours, muted types, daily cap, pause/fight silence) are decided in SQL by
// private.claim_notifications; this function only delivers. Payloads are generic: type + ref id, never content.
// Requires secret FCM_SERVICE_ACCOUNT (Firebase service account JSON). Without it, jobs are released untouched.
import { json, log, sql } from "../_shared/db.ts";
import { JWT } from "npm:google-auth-library@9";

type Job = { outbox_id: string; type: string; ref_id: string | null; discreet: boolean; tokens: string[] };

const account = JSON.parse(Deno.env.get("FCM_SERVICE_ACCOUNT") ?? "null");

async function accessToken(): Promise<string> {
  const jwt = new JWT({ email: account.client_email, key: account.private_key, scopes: ["https://www.googleapis.com/auth/firebase.messaging"] });
  return (await jwt.authorize()).access_token!;
}

Deno.serve(async (req) => {
  if (req.headers.get("authorization") !== `Bearer ${Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")}`) {
    return json({ error: "UNAUTHORIZED" }, 401);
  }
  if (!account) return json({ skipped: "FCM_SERVICE_ACCOUNT not set" });
  const jobs = await sql<Job[]>`select * from private.claim_notifications(50)`;
  if (jobs.length === 0) return json({ sent: 0 });
  const bearer = await accessToken();
  let sent = 0;
  for (const job of jobs) {
    const failed: string[] = [];
    for (const token of job.tokens) {
      // Data-only message: the app renders localized generic text (or the neutral text in discreet mode).
      const res = await fetch(`https://fcm.googleapis.com/v1/projects/${account.project_id}/messages:send`, {
        method: "POST",
        headers: { authorization: `Bearer ${bearer}`, "content-type": "application/json" },
        body: JSON.stringify({
          message: {
            token,
            data: { type: job.discreet ? "discreet" : job.type, ref: job.ref_id ?? "", id: job.outbox_id },
            apns: { payload: { aps: { "mutable-content": 1, "content-available": 1 } } },
            android: { priority: "high" },
          },
        }),
      });
      if (res.status === 404 || res.status === 400) failed.push(token);
    }
    await sql`select private.complete_notification(${job.outbox_id}, ${failed})`;
    sent++;
  }
  log("push_batch", { sent });
  return json({ sent });
});
