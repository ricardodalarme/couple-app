-- Reference content for local/dev. Editorial content for production ships as migrations once copy is approved.
insert into public.content_items (kind, slug, locale, title, body, tags, position) values
  ('question', 'quirk-you-love', 'pt-BR', 'Qual é uma mania dele que você adora?', null, '{manias}', 1),
  ('question', 'quirk-you-love', 'en', 'What is one quirk of theirs that you love?', null, '{quirks}', 1),
  ('question', 'first-meeting', 'pt-BR', 'O que você se lembra da primeira vez que vocês se conheceram?', null, '{historia}', 2),
  ('question', 'first-meeting', 'en', 'What do you remember about the first time you met?', null, '{story}', 2),
  ('question', 'best-moment-week', 'pt-BR', 'Qual foi o melhor momento da semana?', null, '{semana}', 3),
  ('question', 'best-moment-week', 'en', 'What was the best moment of the week?', null, '{week}', 3),
  ('daily_idea', 'note-in-lunchbox', 'pt-BR', 'Deixe um bilhete na marmita dele', 'Pequeno, específico, grátis. Leva 2 minutos.', '{living_together,keep_romance,free}', 1),
  ('daily_idea', 'note-in-lunchbox', 'en', 'Leave a note in their lunch box', 'Small, specific, free. Takes 2 minutes.', '{living_together,keep_romance,free}', 1),
  ('date_idea', 'first-date-dish', 'pt-BR', 'Cozinhar um prato do primeiro encontro', '2 h · em casa', '{home,cheap}', 1),
  ('date_idea', 'park-picnic', 'pt-BR', 'Piquenique no parque', 'Leve: toalha, frutas, caixa de som.', '{outdoors,cheap}', 2),
  ('date_idea', 'museum-night', 'pt-BR', 'Noite no museu', 'Confira os horários.', '{new}', 3),
  ('touch_card', 'hold-hands', 'pt-BR', 'Deem as mãos por um minuto.', null, '{}', 1),
  ('touch_card', 'hug-20', 'pt-BR', 'Abracem por 20 segundos.', null, '{}', 2),
  ('repair_card', 'sorry-tone', 'pt-BR', 'Desculpa pelo meu tom.', null, '{}', 1),
  ('repair_card', 'start-over', 'pt-BR', 'Podemos recomeçar?', null, '{}', 2),
  ('repair_card', 'five-minutes', 'pt-BR', 'Preciso de cinco minutos.', null, '{}', 3),
  ('repair_card', 'love-you-now', 'pt-BR', 'Eu te amo, mesmo agora.', null, '{}', 4),
  ('me_or_you', 'organized', 'pt-BR', 'Quem é mais organizado?', null, '{}', 1),
  ('me_or_you', 'romantic', 'pt-BR', 'Quem é mais romântico?', null, '{}', 2),
  ('mission', 'no-phone-20', 'pt-BR', '20 minutos sem celular, só vocês dois.', null, '{}', 1),
  ('mood_tip', 'tired-dinner', 'pt-BR', 'Ofereça-se para cuidar do jantar.', 'Tira uma pequena decisão do dia dela.', '{tired}', 1),
  ('program', 'gratitude-7', 'pt-BR', '7 dias de gratidão', null, '{}', 1),
  ('program', 'fight-less', 'pt-BR', 'Brigar menos, reparar mais rápido', null, '{}', 2),
  ('notification', 'card_ready', 'pt-BR', 'Seu cartão está pronto', 'Abra para ler.', '{}', 0),
  ('notification', 'card_received', 'pt-BR', 'Você tem um cartão', 'Alguém te enviou algo.', '{}', 0),
  ('notification', 'daily_idea', 'pt-BR', 'Pequeno momento', 'Uma ideia para hoje.', '{}', 0),
  ('notification', 'date_coming', 'pt-BR', 'Data chegando', 'Em alguns dias.', '{}', 0),
  ('notification', 'pause_over', 'pt-BR', 'Pausa terminou', 'Chegou a hora combinada.', '{}', 0),
  ('notification', 'discreet', 'pt-BR', 'Lembrete', 'Você tem uma novidade.', '{}', 0)
on conflict do nothing;
insert into public.content_items (kind, slug, locale, title, body, parent_slug, position, plus_only) values
  ('lesson', 'gratitude-7-d1', 'pt-BR', 'Perceba as pequenas coisas', 'Tente isto hoje: diga um obrigado em voz alta.', 'gratitude-7', 1, false),
  ('lesson', 'gratitude-7-d2', 'pt-BR', 'Seja específico', 'Troque "você é legal" por um ato concreto.', 'gratitude-7', 2, true)
on conflict do nothing;
insert into public.content_items (kind, slug, locale, title, month, day, country) values
  ('holiday', 'dia-dos-namorados', 'pt-BR', 'Dia dos Namorados', 6, 12, 'BR'),
  ('holiday', 'natal', 'pt-BR', 'Natal', 12, 25, 'BR'),
  ('holiday', 'valentines', 'en', 'Valentine''s Day', 2, 14, 'US')
on conflict do nothing;

-- Second batch: a few rows for every content kind, so each screen has something to show.
insert into public.content_items (kind, slug, locale, title, body, tags, position, plus_only, sensitive) values
  ('question', 'felt-cared', 'pt-BR', 'Quando você se sentiu cuidado por ele nesta semana?', null, '{semana}', 4, false, false),
  ('question', 'small-dream', 'pt-BR', 'Qual é um sonho pequeno que você quer realizar a dois?', null, '{futuro}', 5, false, false),
  ('question', 'felt-cared', 'en', 'When did you feel cared for this week?', null, '{week}', 4, false, false),
  ('daily_idea', 'thank-out-loud', 'pt-BR', 'Diga um obrigado em voz alta', 'Escolha uma coisa de hoje e agradeça olhando nos olhos.', '{free,keep_romance}', 2, false, false),
  ('daily_idea', 'six-second-kiss', 'pt-BR', 'Um beijo de seis segundos', 'Na saída ou na chegada. Seis segundos, sem pressa.', '{free,reconnect}', 3, false, false),
  ('daily_idea', 'ask-about-day', 'pt-BR', 'Pergunte como foi o dia, de verdade', 'Guarde o celular por cinco minutos e só escute.', '{free,fight_less}', 4, false, false),
  ('daily_idea', 'thank-out-loud', 'en', 'Say thank you out loud', 'Pick one thing from today and say it while looking at them.', '{free}', 2, false, false),
  ('date_idea', 'sunset-walk', 'pt-BR', 'Caminhada no pôr do sol', '1 h · grátis', '{outdoors,free}', 4, false, false),
  ('date_idea', 'movie-at-home', 'pt-BR', 'Cinema em casa com pipoca', '2 h · em casa', '{home,cheap}', 5, false, false),
  ('date_idea', 'new-restaurant', 'pt-BR', 'Um restaurante que nenhum dos dois conhece', '2 h', '{new}', 6, true, false),
  ('touch_card', 'forehead-kiss', 'pt-BR', 'Um beijo na testa, sem dizer nada.', null, '{}', 3, false, false),
  ('touch_card', 'back-rub', 'pt-BR', 'Dois minutos de carinho nas costas.', null, '{}', 4, false, false),
  ('spice_card', 'whisper-like', 'pt-BR', 'Sussurre uma coisa de que você gosta.', null, '{}', 1, true, true),
  ('spice_card', 'slow-new', 'pt-BR', 'Experimentem algo novo, devagar.', null, '{}', 2, true, true),
  ('mission', 'cook-together', 'pt-BR', 'Cozinhem uma receita nova juntos.', null, '{}', 2, false, false),
  ('mission', 'old-photos', 'pt-BR', 'Vejam dez fotos antigas de vocês e contem a história de uma.', null, '{}', 3, false, false),
  ('me_or_you', 'stubborn', 'pt-BR', 'Quem é mais teimoso?', null, '{}', 3, false, false),
  ('me_or_you', 'early-bird', 'pt-BR', 'Quem acorda mais cedo?', null, '{}', 4, false, false),
  ('me_or_you', 'plans-trips', 'pt-BR', 'Quem planeja melhor as viagens?', null, '{}', 5, false, false),
  ('how_well', 'favorite-drink', 'pt-BR', 'Qual é a bebida favorita dele?', 'Café|Chá|Suco|Refrigerante', '{}', 1, false, false),
  ('how_well', 'dream-trip', 'pt-BR', 'Qual viagem ele mais sonha em fazer?', null, '{}', 2, false, false),
  ('never_have_we', 'road-trip', 'pt-BR', 'Nós nunca fizemos uma viagem de carro sem destino.', null, '{}', 1, false, false),
  ('never_have_we', 'dance-kitchen', 'pt-BR', 'Nós nunca dançamos na cozinha.', null, '{}', 2, false, false),
  ('mood_tip', 'sad-listen', 'pt-BR', 'Pergunte se ela quer conversar ou só companhia.', 'Às vezes ficar junto já ajuda.', '{sad}', 2, false, false),
  ('mood_tip', 'stressed-task', 'pt-BR', 'Tire uma tarefa da lista dela hoje.', 'Escolha a menor e avise que está feito.', '{stressed}', 3, false, false),
  ('mood_tip', 'loving-hug', 'pt-BR', 'Um abraço demorado quando ela chegar.', null, '{loving}', 4, false, false),
  ('ritual_idea', 'sunday-walk', 'pt-BR', 'Caminhada de domingo', 'Semanal', '{weekly}', 1, false, false),
  ('ritual_idea', 'goodnight-text', 'pt-BR', 'Mensagem de boa noite', 'Diário', '{daily}', 2, false, false),
  ('ritual_idea', 'date-night', 'pt-BR', 'Noite de encontro', 'A cada 2 semanas', '{biweekly}', 3, false, false),
  ('ritual_idea', 'ten-min-no-phone', 'pt-BR', '10 minutos sem celular', 'Diário', '{daily}', 4, false, false),
  ('program', 'reconnect-5', 'pt-BR', 'Reencontro', '5 dias', '{}', 3, true, false),
  ('program', 'grief-together', 'pt-BR', 'Luto, juntos', 'Um caminho gentil para a perda.', '{}', 10, true, true),
  ('notification', 'card_reaction', 'pt-BR', 'Uma resposta chegou', 'Abra para ver.', '{}', 0, false, false),
  ('notification', 'partner_joined', 'pt-BR', 'Vocês estão conectados', 'Abra para começar.', '{}', 0, false, false),
  ('notification', 'unpaired', 'pt-BR', 'Uma mudança no seu espaço', 'Abra para ver.', '{}', 0, false, false),
  ('notification', 'pause_started', 'pt-BR', 'Uma mensagem para você', 'Abra para ler.', '{}', 0, false, false),
  ('notification', 'partner_message', 'pt-BR', 'Um recado para você', 'Abra para ver.', '{}', 0, false, false),
  ('notification', 'signal', 'pt-BR', 'Um toque para você', 'Abra para ver.', '{}', 0, false, false),
  ('notification', 'game_invite', 'pt-BR', 'Um convite para jogar', 'Leva poucos minutos.', '{}', 0, false, false),
  ('notification', 'ritual', 'pt-BR', 'Um ritual de vocês', 'Fazer ou pular, os dois são normais.', '{}', 0, false, false),
  ('notification', 'gentle_return', 'pt-BR', 'Quer anotar algo bom?', 'Sem pressa.', '{}', 0, false, false),
  ('notification', 'card_ready', 'en', 'Your card is ready', 'Open to read.', '{}', 0, false, false),
  ('notification', 'card_received', 'en', 'You have a card', 'Someone sent you something.', '{}', 0, false, false),
  ('notification', 'discreet', 'en', 'Reminder', 'You have something new.', '{}', 0, false, false)
on conflict do nothing;
insert into public.content_items (kind, slug, locale, title, body, parent_slug, position, plus_only) values
  ('lesson', 'gratitude-7-d3', 'pt-BR', 'Diga em voz alta', 'Escolha um slip desta semana e leia para ele.', 'gratitude-7', 3, true),
  ('lesson', 'fight-less-d1', 'pt-BR', 'Comece com suavidade', 'Troque "você nunca" por "eu sinto... quando... eu preciso de...".', 'fight-less', 1, false),
  ('lesson', 'fight-less-d2', 'pt-BR', 'A pausa que volta', 'Combine um sinal de pausa e sempre diga quando volta.', 'fight-less', 2, true),
  ('lesson', 'reconnect-5-d1', 'pt-BR', 'Dez minutos só de vocês', 'Sem telas, sem logística. Só contar como foi o dia.', 'reconnect-5', 1, true)
on conflict do nothing;
insert into public.content_items (kind, slug, locale, title, month, day, country) values
  ('holiday', 'dia-das-maes', 'pt-BR', 'Dia das Mães', 5, 10, 'BR'),
  ('holiday', 'dia-dos-pais', 'pt-BR', 'Dia dos Pais', 8, 9, 'BR'),
  ('holiday', 'ano-novo', 'pt-BR', 'Ano Novo', 1, 1, 'BR'),
  ('holiday', 'christmas', 'en', 'Christmas', 12, 25, 'US')
on conflict do nothing;
