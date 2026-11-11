// Words that mean the person may be in danger. The app answers with its own safety message instead of a model reply.
export const CRISIS = new RegExp(
  [
    "suic[ií]d", "me matar(?! de rir)", "quero morrer", "n[aã]o quero mais viver", "n[aã]o quero viver",
    "acabar com tudo", "me machucar", "me cortar", "me cortei", "autolesion", "autoles[aã]o",
    "automutila", "tirar minha vida", "queria desaparecer", "n[aã]o aguento mais",
    "tomei os rem[eé]dios",
    "kill myself", "want to die", "end it all", "end my life", "hurt myself", "self[- ]harm",
    "take my own life", "i don'?t want to live", "better off dead",
    "ele me bate", "ela me bate", "me agrid", "me amea[cç]", "tenho medo (dele|dela|do meu)",
    "hits me", "beats me", "afraid of (him|her|my partner)", "threatens me",
  ].join("|"),
  "i",
);

/** Whether [text] may mean the person is in danger. */
export const looksLikeCrisis = (text: string): boolean => CRISIS.test(text);
