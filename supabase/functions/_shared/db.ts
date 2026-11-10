// Shared helpers for Edge Functions. The database is reached with the built-in SUPABASE_DB_URL,
// because the functions call into the `private` schema, which is not exposed through the REST API.
import postgres from "npm:postgres@3.4.5";

export const sql = postgres(Deno.env.get("SUPABASE_DB_URL")!, { prepare: false, max: 2 });

export const json = (body: unknown, status = 200, headers: Record<string, string> = {}) =>
  new Response(JSON.stringify(body), {
    status,
    headers: { "content-type": "application/json", "cache-control": "no-store", ...cors, ...headers },
  });

export const cors = {
  "access-control-allow-origin": "*",
  "access-control-allow-headers": "content-type",
  "access-control-allow-methods": "GET, POST, OPTIONS",
};

export const clientIp = (req: Request) =>
  (req.headers.get("x-forwarded-for") ?? "unknown").split(",")[0].trim();

// Structured log line without personal data: never log tokens, bodies or names.
export const log = (event: string, fields: Record<string, string | number | boolean> = {}) =>
  console.log(JSON.stringify({ event, ...fields }));
