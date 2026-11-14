// Place search for date ideas (Y-34, Y-35) through Mapbox. Signed-in users only.
//   GET /places?q=bistro&near=-46.63,-23.55   (near = "lng,lat" of an address the person typed; optional)
// No location tracking: nothing is stored here, and the app never sends the device position on its own.
// Requires secret MAPBOX_TOKEN.
// verify_jwt = true only proves the token is valid, and the public anon key is a valid JWT, so the role is checked here.
import { cors, json, log } from "../_shared/db.ts";

function claims(token: string): { role?: string; sub?: string } | null {
  try {
    const part = token.split(".")[1].replace(/-/g, "+").replace(/_/g, "/");
    return JSON.parse(atob(part));
  } catch {
    return null;
  }
}

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response(null, { headers: cors });
  const c = claims((req.headers.get("authorization") ?? "").replace(/^Bearer /i, ""));
  if (c?.role !== "authenticated" || !c?.sub) return json({ error: "UNAUTHORIZED" }, 401);
  const token = Deno.env.get("MAPBOX_TOKEN");
  if (!token) return json({ error: "PLACES_NOT_CONFIGURED" }, 503);
  const url = new URL(req.url);
  const q = (url.searchParams.get("q") ?? "").trim().slice(0, 80);
  const near = url.searchParams.get("near") ?? "";
  if (q.length < 2) return json({ places: [] });

  const api = new URL("https://api.mapbox.com/search/geocode/v6/forward");
  api.searchParams.set("q", q);
  api.searchParams.set("limit", "8");
  api.searchParams.set("language", url.searchParams.get("lang") === "en" ? "en" : "pt");
  api.searchParams.set("types", "address,street,place,neighborhood,locality");
  if (/^-?\d+(\.\d+)?,-?\d+(\.\d+)?$/.test(near)) api.searchParams.set("proximity", near);
  api.searchParams.set("access_token", token);

  let res: Response;
  try {
    res = await fetch(api, { signal: AbortSignal.timeout(8_000) });
  } catch (_e) {
    log("places_error", { status: 0 });
    return json({ error: "PLACES_UNAVAILABLE" }, 502);
  }
  if (!res.ok) {
    log("places_error", { status: res.status });
    return json({ error: "PLACES_UNAVAILABLE" }, 502);
  }
  const data = await res.json();
  const places = (data.features ?? []).map((f: any) => ({
    id: f.id,
    name: f.properties?.name ?? "",
    address: f.properties?.full_address ?? f.properties?.place_formatted ?? "",
    lng: f.geometry?.coordinates?.[0],
    lat: f.geometry?.coordinates?.[1],
  }));
  return json({ places });
});
