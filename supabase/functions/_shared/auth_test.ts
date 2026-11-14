import { assertEquals } from "jsr:@std/assert@1";
import { isServiceCaller, safeEqual } from "./auth.ts";

const request = (headers: Record<string, string>) => new Request("https://example.test/fn", { method: "POST", headers });

Deno.test("safeEqual matches equal strings only", async () => {
  assertEquals(await safeEqual("abc", "abc"), true);
  assertEquals(await safeEqual("abc", "abd"), false);
  assertEquals(await safeEqual("abc", "abcd"), false);
  assertEquals(await safeEqual("", ""), true);
});

Deno.test("isServiceCaller accepts the apikey header with a named secret key", async () => {
  Deno.env.set("SUPABASE_SECRET_KEYS", JSON.stringify({ default: "sb_secret_default", automations: "sb_secret_auto" }));
  Deno.env.delete("SUPABASE_SERVICE_ROLE_KEY");
  assertEquals(await isServiceCaller(request({ apikey: "sb_secret_default" })), true);
  assertEquals(await isServiceCaller(request({ apikey: "sb_secret_auto" })), true);
  assertEquals(await isServiceCaller(request({ apikey: "sb_secret_other" })), false);
});

Deno.test("isServiceCaller still accepts the legacy service-role bearer token", async () => {
  Deno.env.delete("SUPABASE_SECRET_KEYS");
  Deno.env.set("SUPABASE_SERVICE_ROLE_KEY", "legacy.jwt.value");
  assertEquals(await isServiceCaller(request({ authorization: "Bearer legacy.jwt.value" })), true);
  assertEquals(await isServiceCaller(request({ authorization: "bearer legacy.jwt.value" })), true);
  assertEquals(await isServiceCaller(request({ authorization: "Bearer wrong" })), false);
});

Deno.test("isServiceCaller rejects requests without credentials or without any configured key", async () => {
  Deno.env.set("SUPABASE_SERVICE_ROLE_KEY", "legacy.jwt.value");
  assertEquals(await isServiceCaller(request({})), false);
  Deno.env.delete("SUPABASE_SERVICE_ROLE_KEY");
  Deno.env.delete("SUPABASE_SECRET_KEYS");
  assertEquals(await isServiceCaller(request({ apikey: "anything", authorization: "Bearer anything" })), false);
});

Deno.test("isServiceCaller ignores a malformed key dictionary", async () => {
  Deno.env.set("SUPABASE_SECRET_KEYS", "not json");
  Deno.env.set("SUPABASE_SERVICE_ROLE_KEY", "legacy.jwt.value");
  assertEquals(await isServiceCaller(request({ apikey: "legacy.jwt.value" })), true);
  assertEquals(await isServiceCaller(request({ apikey: "not json" })), false);
});
