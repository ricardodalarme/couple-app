// Public endpoints for the guest partner (no account). Authenticated only by the link token.
//   GET  /guest/card/:token          -> card to render (does NOT mark it opened: link-preview bots hit this)
//   POST /guest/card/:token/open     -> a person tapped Open
//   POST /guest/card/:token/react    -> { reaction?, reply? }
//   POST /guest/card/:token/stop     -> stop receiving from this sender (idempotent)
//   POST /guest/card/:token/report   -> { reason, details?, includeCard? }
//   POST /guest/card/:token/resume   -> undo "stop receiving"
//   POST /guest/card/:token/forget   -> delete what the guest left (reaction, opened state)
//   GET  /guest/invite/:code         -> { inviterName, expiresAt } for the invite landing page
// Every invalid, expired, revoked or stopped token gets the same 404 body.
import { clientIp, cors, json, log, sql } from "../_shared/db.ts";

const GONE = { error: "LINK_NOT_AVAILABLE" };

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response(null, { headers: cors });
  const parts = new URL(req.url).pathname.split("/").filter(Boolean);
  const at = parts.indexOf("card");
  const inviteAt = parts.indexOf("invite");
  if (req.method === "GET" && inviteAt >= 0) {
    const [{ ok: allowed }] = await sql`select private.hit_rate_limit(${"guest:" + clientIp(req)}, 60, interval '1 minute') as ok`;
    if (!allowed) return json({ error: "RATE_LIMITED" }, 429);
    const [{ invite }] = await sql`select private.invite_preview(${parts[inviteAt + 1] ?? ""}) as invite`;
    return invite ? json(invite) : json(GONE, 404);
  }
  const token = at >= 0 ? parts[at + 1] : undefined;
  const action = at >= 0 ? parts[at + 2] : undefined;
  if (!token || !/^[0-9a-f]{48}$/.test(token)) return json(GONE, 404);

  const [{ ok }] = await sql`select private.hit_rate_limit(${"guest:" + clientIp(req)}, 60, interval '1 minute') as ok`;
  if (!ok) return json({ error: "RATE_LIMITED" }, 429);

  try {
    if (req.method === "GET" && !action) {
      const [{ card }] = await sql`select private.guest_card(${token}) as card`;
      return card ? json(card) : json(GONE, 404);
    }
    if (req.method !== "POST") return json({ error: "METHOD_NOT_ALLOWED" }, 405);
    const body = await req.json().catch(() => ({}));
    let done = false;
    if (action === "open") {
      [{ done }] = await sql`select private.guest_open(${token}) as done`;
    } else if (action === "react") {
      [{ done }] = await sql`select private.guest_react(${token}, ${body.reaction ?? null}, ${body.reply ?? null}) as done`;
    } else if (action === "stop") {
      [{ done }] = await sql`select private.guest_stop(${token}) as done`;
    } else if (action === "resume") {
      [{ done }] = await sql`select private.guest_resume(${token}) as done`;
    } else if (action === "forget") {
      [{ done }] = await sql`select private.guest_forget(${token}) as done`;
    } else if (action === "report") {
      [{ done }] = await sql`select private.guest_report(${token}, ${body.reason ?? null}, ${body.details ?? null}, ${body.includeCard === true}) as done`;
    } else {
      return json({ error: "NOT_FOUND" }, 404);
    }
    log("guest_action", { action, done });
    return done ? json({ ok: true }) : json(GONE, 404);
  } catch (_e) {
    log("guest_error", { action: action ?? "card" });
    return json({ error: "TEMPORARY_FAILURE" }, 500);
  }
});
