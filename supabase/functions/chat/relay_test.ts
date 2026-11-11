// Run with: deno test supabase/functions/chat/relay_test.ts
import { assertEquals } from "jsr:@std/assert@1";
import { type ChatEvent, parseOptions, relay } from "./relay.ts";

const sse = (pieces: string[]) => {
  const encoder = new TextEncoder();
  const lines = pieces.map((p) => `data: ${JSON.stringify({ choices: [{ delta: { content: p } }] })}\n\n`);
  lines.push("data: [DONE]\n\n");
  return new ReadableStream<Uint8Array>({
    start(controller) {
      for (const line of lines) controller.enqueue(encoder.encode(line));
      controller.close();
    },
  });
};

async function run(pieces: string[]): Promise<ChatEvent[]> {
  const events: ChatEvent[] = [];
  await relay(sse(pieces).getReader(), (event) => events.push(event));
  return events;
}

const text = (events: ChatEvent[]) =>
  events.filter((e) => e.type === "delta").map((e) => (e as { text: string }).text).join("");

Deno.test("plain text streams through and ends with no options", async () => {
  const events = await run(["Oi, ", "estou aqui."]);
  assertEquals(text(events), "Oi, estou aqui.");
  assertEquals(events.at(-1), { type: "done", options: [] });
});

Deno.test("the options line is parsed and never shown as text", async () => {
  const events = await run(["Estou aqui.", "\n[[opt", "ions: Estou cansada | Quero desabafar]]"]);
  assertEquals(text(events).trim(), "Estou aqui.");
  assertEquals(events.at(-1), { type: "done", options: ["Estou cansada", "Quero desabafar"] });
});

Deno.test("a marker split mid-way across pieces is still held back", async () => {
  const events = await run(["Um passo pequeno.\n[", "[options: a | b | c | d]]"]);
  assertEquals(text(events).trim(), "Um passo pequeno.");
  assertEquals(events.at(-1), { type: "done", options: ["a", "b", "c"] });
});

Deno.test("a lone bracket in the text is released at the end", async () => {
  const events = await run(["Veja [isto"]);
  assertEquals(text(events), "Veja [isto");
});

Deno.test("options are cut to three and forty characters", () => {
  assertEquals(
    parseOptions("x [[options: a | b | c | d]]"),
    ["a", "b", "c"],
  );
  assertEquals(parseOptions(`x [[options: ${"y".repeat(60)}]]`)[0].length, 40);
  assertEquals(parseOptions("sem opções"), []);
});
