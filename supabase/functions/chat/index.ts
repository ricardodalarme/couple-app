// Calm chat with the mascot (Z-01..Z-06). Signed-in users only. The reply streams as server-sent events.
//   POST /chat  { message, history?: [{ role: "user" | "mascot", text }], locale?: "pt-BR" | "en", mode?: "free" | "hard_conversation" }
//   -> text/event-stream, one JSON object per `data:` line:
//        { type: "delta", text }       a piece of the reply
//        { type: "done", options }     the end, with up to three short answer chips
//        { type: "crisis" }            crisis wording: the app shows its safety message, the model is never called
//        { type: "error", code }       CHAT_UNAVAILABLE | CHAT_DISABLED | CHAT_LIMIT | UPSTREAM
// Nothing the person writes and nothing the model answers is stored: a row without text counts against the
// daily limit, and that is all. Message texts and the model reply are never logged.
// Requires secrets CHAT_API_URL (an OpenAI-compatible base, e.g. https://host/v1), CHAT_API_KEY and CHAT_MODEL.
// verify_jwt = true only proves the token is valid, and the public anon key is a valid JWT, so the role is checked here.
import { cors, json, log, sql } from "../_shared/db.ts";
import { type ChatEvent, relay } from "./relay.ts";

const MAX_MESSAGE = 1000;
const MAX_HISTORY = 12;

function claims(token: string): { role?: string; sub?: string } | null {
  try {
    const part = token.split(".")[1].replace(/-/g, "+").replace(/_/g, "/");
    return JSON.parse(atob(part));
  } catch {
    return null;
  }
}

// Words that mean the person may be in danger. The app answers with its own safety message instead of a model reply.
const CRISIS = new RegExp(
  [
    "suic[ií]d", "me matar", "quero morrer", "n[aã]o quero mais viver", "acabar com tudo", "me machucar",
    "me cortar", "autolesion", "automutila", "tirar minha vida",
    "kill myself", "want to die", "end it all", "hurt myself", "self[- ]harm", "take my own life",
    "ele me bate", "ela me bate", "me agrid", "me amea[cç]", "tenho medo (dele|dela|do meu)",
    "hits me", "beats me", "afraid of (him|her|my partner)", "threatens me",
  ].join("|"),
  "i",
);

const sse = (stream: ReadableStream<Uint8Array>) =>
  new Response(stream, {
    headers: { "content-type": "text/event-stream", "cache-control": "no-store", ...cors },
  });

const oneEvent = (event: Record<string, unknown>, status = 200) => {
  const body = `data: ${JSON.stringify(event)}\n\n`;
  return new Response(body, {
    status,
    headers: { "content-type": "text/event-stream", "cache-control": "no-store", ...cors },
  });
};

function systemPrompt(locale: string, mode: string): string {
  const pt = locale.startsWith("pt");
  const base = pt
    ? "Você é a mascote de um app para casais: calma, acolhedora e curta. Responda em português do Brasil, em no máximo 90 palavras, com no máximo uma pergunta. Nunca diagnostique, nunca dê conselho médico, jurídico ou clínico, nunca tome partido contra a outra pessoa e nunca pressione a pessoa a ficar ou a terminar. Não use pontuação, ranking ou cobrança. Se houver sinal de perigo, sugira procurar alguém de confiança ou o serviço de emergência da região. Termine sempre com uma última linha no formato [[options: resposta curta 1 | resposta curta 2 | resposta curta 3]], com no máximo três opções de até quatro palavras."
    : "You are the mascot of a couples app: calm, warm and brief. Answer in English, in at most 90 words, with at most one question. Never diagnose, never give medical, legal or clinical advice, never take sides against the other person and never push the person to stay or to leave. No scores, rankings or guilt. If there is any sign of danger, suggest reaching someone they trust or local emergency services. Always end with a last line in the format [[options: short answer 1 | short answer 2 | short answer 3]], with at most three options of up to four words.";
  if (mode !== "hard_conversation") return base;

  return base + (pt
    ? " Neste modo você ajuda a pessoa a se preparar para uma conversa difícil: primeiro escute, depois ajude a nomear o que ela sente e precisa, e por fim ofereça uma frase de abertura suave que ela possa dizer com as próprias palavras."
    : " In this mode you help the person prepare for a hard conversation: first listen, then help name what they feel and need, and finally offer one soft opening sentence they can say in their own words.");
}

type Turn = { role: "user" | "mascot"; text: string };

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response(null, { headers: cors });
  if (req.method !== "POST") return json({ error: "METHOD_NOT_ALLOWED" }, 405);
  const c = claims((req.headers.get("authorization") ?? "").replace(/^Bearer /i, ""));
  if (c?.role !== "authenticated" || !c?.sub) return json({ error: "UNAUTHORIZED" }, 401);
  const userId = c.sub;

  const body = await req.json().catch(() => ({}));
  const message = String(body.message ?? "").trim().slice(0, MAX_MESSAGE);
  if (!message) return json({ error: "EMPTY_MESSAGE" }, 400);
  const locale = String(body.locale ?? "pt-BR");
  const mode = body.mode === "hard_conversation" ? "hard_conversation" : "free";
  const history: Turn[] = (Array.isArray(body.history) ? body.history : [])
    .filter((t: Turn) => (t?.role === "user" || t?.role === "mascot") && typeof t?.text === "string")
    .slice(-MAX_HISTORY)
    .map((t: Turn) => ({ role: t.role, text: t.text.slice(0, MAX_MESSAGE) }));

  // Crisis wording is answered by the app itself, before any limit, setting or model call.
  if (CRISIS.test(message)) {
    log("chat_crisis");
    return oneEvent({ type: "crisis" });
  }

  const apiUrl = Deno.env.get("CHAT_API_URL");
  const apiKey = Deno.env.get("CHAT_API_KEY");
  const model = Deno.env.get("CHAT_MODEL");
  if (!apiUrl || !apiKey || !model) return oneEvent({ type: "error", code: "CHAT_UNAVAILABLE" }, 503);

  const [settings] = await sql`select chat_enabled from public.profile_settings where profile_id = ${userId}`;
  if (!settings?.chat_enabled) return oneEvent({ type: "error", code: "CHAT_DISABLED" }, 403);

  const [{ left }] = await sql`
    select greatest(0,
      (select value::integer from public.app_config
        where key = case when private.has_plus(${userId}) then 'chat_messages_per_day_plus' else 'chat_messages_per_day_free' end)
      - (select count(*)::integer from public.chat_messages m
          where m.author_id = ${userId} and m.role = 'user' and m.created_at >= date_trunc('day', now()))) as left`;
  if (left <= 0) return oneEvent({ type: "error", code: "CHAT_LIMIT" }, 429);
  await sql`insert into public.chat_messages (author_id, role) values (${userId}, 'user')`;

  const messages = [
    { role: "system", content: systemPrompt(locale, mode) },
    ...history.map((t) => ({ role: t.role === "mascot" ? "assistant" : "user", content: t.text })),
    { role: "user", content: message },
  ];

  const upstream = await fetch(`${apiUrl.replace(/\/$/, "")}/chat/completions`, {
    method: "POST",
    headers: { "content-type": "application/json", authorization: `Bearer ${apiKey}` },
    body: JSON.stringify({ model, messages, stream: true, temperature: 0.6, max_tokens: 400 }),
  }).catch(() => null);
  if (!upstream || !upstream.ok || !upstream.body) {
    log("chat_upstream_failed", { status: upstream?.status ?? 0 });
    return oneEvent({ type: "error", code: "UPSTREAM" }, 502);
  }

  const encoder = new TextEncoder();
  const reader = upstream.body.getReader();

  const stream = new ReadableStream<Uint8Array>({
    async start(controller) {
      const send = (event: ChatEvent) =>
        controller.enqueue(encoder.encode(`data: ${JSON.stringify(event)}\n\n`));
      try {
        await relay(reader, send);
      } catch {
        log("chat_stream_failed");
        send({ type: "error", code: "UPSTREAM" });
      } finally {
        controller.close();
      }
    },
    cancel() {
      reader.cancel().catch(() => {});
    },
  });
  return sse(stream);
});
