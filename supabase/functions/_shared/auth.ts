// Caller checks for functions that run with verify_jwt = false and are invoked by a server (pg_cron through pg_net, a webhook).

const encoder = new TextEncoder();

const digest = async (value: string) => new Uint8Array(await crypto.subtle.digest("SHA-256", encoder.encode(value)));

// Compares two strings without leaking, through timing, how many leading characters match.
export async function safeEqual(a: string, b: string): Promise<boolean> {
  const [x, y] = await Promise.all([digest(a), digest(b)]);
  let diff = 0;
  for (let i = 0; i < x.length; i++) diff |= x[i] ^ y[i];
  return diff === 0;
}

// Secret keys of the project: the named keys in SUPABASE_SECRET_KEYS plus the legacy service-role key.
function secretKeys(): string[] {
  const keys: string[] = [];
  const legacy = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (legacy) keys.push(legacy);
  try {
    const named = JSON.parse(Deno.env.get("SUPABASE_SECRET_KEYS") ?? "{}");
    for (const value of Object.values(named)) if (typeof value === "string" && value) keys.push(value);
  } catch (_e) {
    // A malformed dictionary leaves only the legacy key.
  }
  return keys;
}

// Whether the request presents a project secret key in the `apikey` header or as a bearer token.
export async function isServiceCaller(req: Request): Promise<boolean> {
  const presented = [req.headers.get("apikey"), (req.headers.get("authorization") ?? "").replace(/^Bearer\s+/i, "")]
    .filter((value): value is string => !!value);
  const keys = secretKeys();
  let ok = false;
  for (const candidate of presented) {
    for (const key of keys) if (await safeEqual(candidate, key)) ok = true;
  }
  return ok;
}
