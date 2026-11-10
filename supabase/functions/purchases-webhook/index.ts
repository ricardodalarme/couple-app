// RevenueCat webhook -> entitlements. Auth: the Authorization header must equal secret REVENUECAT_WEBHOOK_AUTH.
// Idempotent by event id; out-of-order events are ignored in SQL (private.apply_purchase_event).
// app_user_id must be the Supabase user id (set it with Purchases.logIn(userId) in the app).
import { json, log, sql } from "../_shared/db.ts";

const STATUS: Record<string, string> = {
  INITIAL_PURCHASE: "active", RENEWAL: "active", UNCANCELLATION: "active", PRODUCT_CHANGE: "active",
  CANCELLATION: "active", BILLING_ISSUE: "billing_issue", EXPIRATION: "expired", SUBSCRIPTION_PAUSED: "expired",
};

Deno.serve(async (req) => {
  const secret = Deno.env.get("REVENUECAT_WEBHOOK_AUTH");
  if (!secret || req.headers.get("authorization") !== secret) return json({ error: "UNAUTHORIZED" }, 401);
  const { event } = await req.json().catch(() => ({ event: null }));
  if (!event?.id || !event?.app_user_id || !/^[0-9a-f-]{36}$/.test(event.app_user_id)) return json({ ok: true, ignored: true });

  let status = STATUS[event.type];
  if (!status) return json({ ok: true, ignored: true });
  if (event.type === "CANCELLATION" && event.cancel_reason === "CUSTOMER_SUPPORT") status = "refunded";
  if (status === "active" && event.period_type === "TRIAL") status = "trialing";
  const plan = event.period_type === "PROMOTIONAL" ? "plus_gift" : /annual|year/i.test(event.product_id ?? "") ? "plus_annual" : "plus_monthly";
  const store = event.store === "PLAY_STORE" ? "play_store" : event.store === "APP_STORE" ? "app_store" : "promo";
  const willRenew = !["CANCELLATION", "EXPIRATION", "BILLING_ISSUE"].includes(event.type);

  const [{ applied }] = await sql`
    select private.apply_purchase_event(${event.id}, ${event.app_user_id}::uuid, ${event.type},
      to_timestamp(${event.event_timestamp_ms} / 1000.0), ${plan}, ${status},
      ${event.expiration_at_ms ? new Date(event.expiration_at_ms) : null}, ${willRenew}, ${store}) as applied`;
  log("purchase_event", { type: event.type, applied });
  return json({ ok: true, applied });
});
