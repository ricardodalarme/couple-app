-- TODO(review): first-version copy; human author must rewrite before release.
-- First-version content for the sensitive tracks. (APP-075)
-- TODO(owner): help lines intentionally not implemented; APP-075 acceptance is not fully met.
insert into public.content_items (kind, slug, locale, title, body, parent_slug, position, plus_only, sensitive, published)
values
  -- TODO(review): first-version copy; human author must rewrite before release.
  ('program', 'grief-together', 'pt-BR', 'Luto, juntos', 'Um caminho gentil para a perda.', null, 10, false, true, true),
  -- TODO(review): first-version copy; human author must rewrite before release.
  ('program', 'illness-in-family', 'pt-BR', 'Doença na família', 'Prático, silencioso. Para quando a doença entra em casa.', null, 11, false, true, true),
  -- TODO(review): first-version copy; human author must rewrite before release.
  ('program', 'rebuild-trust', 'pt-BR', 'Reconstruir a confiança', 'Passos lentos, cada um por escolha. Não substitui a terapia.', null, 12, false, true, true),
  -- TODO(review): first-version copy; human author must rewrite before release.
  ('lesson', 'grief-together-d1', 'pt-BR', 'O que ajuda hoje?', 'Hoje, escolha uma coisa pequena que traga algum alívio: um copo de água, uma janela aberta, cinco minutos em silêncio. Não precisa dar conta do resto.', 'grief-together', 1, false, true, true),
  -- TODO(review): first-version copy; human author must rewrite before release.
  ('lesson', 'grief-together-d2', 'pt-BR', 'Pequenos rituais', 'Escolha um gesto simples para lembrar quem você perdeu: acender uma vela, separar uma foto, dizer o nome em voz alta. Faça no seu tempo.', 'grief-together', 2, false, true, true),
  -- TODO(review): first-version copy; human author must rewrite before release.
  ('lesson', 'grief-together-d3', 'pt-BR', 'Dias em que pesa mais', 'Em dias mais pesados, diminua o que for possível. Avise alguém de confiança que hoje você precisa de menos perguntas e mais presença.', 'grief-together', 3, false, true, true),
  -- TODO(review): first-version copy; human author must rewrite before release.
  ('lesson', 'grief-together-d4', 'pt-BR', 'O que você quer guardar', 'Escreva uma lembrança curta: um cheiro, uma frase, um lugar. Guardar não apaga a falta; só dá um lugar para ela.', 'grief-together', 4, false, true, true),
  -- TODO(review): first-version copy; human author must rewrite before release.
  ('lesson', 'illness-in-family-d1', 'pt-BR', 'Dividir a carga', 'Liste as tarefas de hoje e marque uma que outra pessoa pode fazer. Pedir ajuda concreta costuma ser mais fácil do que pedir ajuda em geral.', 'illness-in-family', 1, false, true, true),
  -- TODO(review): first-version copy; human author must rewrite before release.
  ('lesson', 'illness-in-family-d2', 'pt-BR', 'Cuidar sem se esgotar', 'Escolha um momento do dia para parar por dez minutos. Descanso não é abandono; é o que permite continuar.', 'illness-in-family', 2, false, true, true),
  -- TODO(review): first-version copy; human author must rewrite before release.
  ('lesson', 'illness-in-family-d3', 'pt-BR', 'Falar sem alarme', 'Combine uma palavra ou um sinal para dizer ‘preciso de pausa’ sem precisar explicar tudo na hora.', 'illness-in-family', 3, false, true, true),
  -- TODO(review): first-version copy; human author must rewrite before release.
  ('lesson', 'illness-in-family-d4', 'pt-BR', 'O que não precisa ser dito', 'Nem todo silêncio é ausência. Ficar perto, sem perguntas, também é uma forma de cuidado.', 'illness-in-family', 4, false, true, true),
  -- TODO(review): first-version copy; human author must rewrite before release.
  ('lesson', 'rebuild-trust-d1', 'pt-BR', 'Conversa sincera 1', 'Escolha um momento calmo e diga uma coisa que você precisa que o outro entenda. Uma frase de cada vez, sem cobrar resposta imediata.', 'rebuild-trust', 1, false, true, true),
  -- TODO(review): first-version copy; human author must rewrite before release.
  ('lesson', 'rebuild-trust-d2', 'pt-BR', 'Limites', 'Escreva um limite que protege você e que você consegue sustentar. Limite não é castigo; é o que torna a convivência possível.', 'rebuild-trust', 2, false, true, true),
  -- TODO(review): first-version copy; human author must rewrite before release.
  ('lesson', 'rebuild-trust-d3', 'pt-BR', 'Pequenas provas', 'Confiança volta por atos pequenos e repetidos. Escolha um combinado simples para esta semana e cumpra.', 'rebuild-trust', 3, false, true, true),
  -- TODO(review): first-version copy; human author must rewrite before release.
  ('lesson', 'rebuild-trust-d4', 'pt-BR', 'Quando a dúvida volta', 'Nomeie a dúvida sem transformar em acusação: ‘quando isso acontece, eu sinto...’. Depois escolha se é hora de conversar ou de esperar.', 'rebuild-trust', 4, false, true, true),
  -- TODO(review): first-version copy; human author must rewrite before release.
  ('lesson', 'rebuild-trust-d5', 'pt-BR', 'O ritmo de cada um', 'Cada pessoa repara em um tempo diferente. Diga em que ponto você está hoje, sem prometer o que ainda não consegue.', 'rebuild-trust', 5, false, true, true)
on conflict (kind, slug, locale) do update set
  title = excluded.title,
  body = excluded.body,
  parent_slug = excluded.parent_slug,
  position = excluded.position,
  plus_only = excluded.plus_only,
  sensitive = excluded.sensitive,
  published = excluded.published;
