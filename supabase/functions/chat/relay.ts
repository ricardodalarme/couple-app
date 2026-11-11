// Turns an OpenAI-compatible streaming response into the app's events, and keeps the answer chips
// (a final `[[options: a | b | c]]` line) out of the text.
export const OPTIONS_MARKER = "[[options:";

export type ChatEvent =
  | { type: "delta"; text: string }
  | { type: "done"; options: string[] }
  | { type: "error"; code: string };

/** Reads the answer chips from the end of a full reply, or an empty list when there are none. */
export function parseOptions(full: string): string[] {
  const at = full.toLowerCase().indexOf(OPTIONS_MARKER);
  if (at < 0) return [];
  return full
    .slice(at + OPTIONS_MARKER.length)
    .replace(/\]\].*$/s, "")
    .split("|")
    .map((option) => option.trim())
    .filter(Boolean)
    .slice(0, 3)
    .map((option) => option.slice(0, 40));
}

/**
 * Reads the upstream stream and calls [send] for each piece of text and once at the end.
 * Text from a possible options marker on is held back, so the chips never show up as text.
 */
export async function relay(
  reader: ReadableStreamDefaultReader<Uint8Array>,
  send: (event: ChatEvent) => void,
): Promise<void> {
  const decoder = new TextDecoder();
  let buffered = "";
  let full = "";
  let emitted = 0;
  for (;;) {
    const { done, value } = await reader.read();
    if (done) break;
    buffered += decoder.decode(value, { stream: true });
    const lines = buffered.split("\n");
    buffered = lines.pop() ?? "";
    for (const line of lines) {
      if (!line.startsWith("data:")) continue;
      const data = line.slice(5).trim();
      if (!data || data === "[DONE]") continue;
      let piece = "";
      try {
        piece = JSON.parse(data).choices?.[0]?.delta?.content ?? "";
      } catch {
        continue;
      }
      if (!piece) continue;
      full += piece;
      const marker = full.indexOf("[[");
      let safeEnd = marker >= 0 ? marker : full.length;
      if (marker < 0 && full.endsWith("[")) safeEnd = full.length - 1;
      if (safeEnd > emitted) {
        send({ type: "delta", text: full.slice(emitted, safeEnd) });
        emitted = safeEnd;
      }
    }
  }
  const options = parseOptions(full);
  if (!full.toLowerCase().includes(OPTIONS_MARKER) && emitted < full.length) {
    send({ type: "delta", text: full.slice(emitted) });
  }
  send({ type: "done", options });
}
