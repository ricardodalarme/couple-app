import 'package:flutter_bloc_starter/features/guides/data/models/guide.dart';

/// The six private conversation guides, authored in Portuguese and English.
const List<GuideDefinition> guideCatalogue = [
  GuideDefinition(
    slug: 'transition',
    guideType: 'transition',
    title: GuideText(pt: 'Transição', en: 'Transition'),
    description: GuideText(
      pt: 'Mudanças de vida, uma de cada vez.',
      en: 'Life changes, one at a time.',
    ),
    prompts: [
      GuideText(
        pt: 'O que está mudando na sua vida agora, do seu jeito?',
        en: 'What is changing in your life right now, in your own words?',
      ),
      GuideText(
        pt: 'O que você quer que continue igual nesse período?',
        en: 'What would you like to keep the same during this time?',
      ),
      GuideText(
        pt: 'O que você precisa de mim enquanto isso acontece?',
        en: 'What do you need from me while this is happening?',
      ),
      GuideText(
        pt: 'Que primeiro passo pequeno faz sentido para vocês esta semana?',
        en: 'What small first step makes sense for you both this week?',
      ),
    ],
  ),
  GuideDefinition(
    slug: 'money',
    guideType: 'money',
    title: GuideText(pt: 'Dinheiro', en: 'Money'),
    description: GuideText(
      pt: 'Sem números, com o que importa.',
      en: 'No numbers, just what matters.',
    ),
    prompts: [
      GuideText(
        pt: 'O que dinheiro significa para você hoje?',
        en: 'What does money mean to you today?',
      ),
      GuideText(
        pt: 'O que te traz mais calma quando o assunto é dinheiro?',
        en: 'What helps you feel calmer when it comes to money?',
      ),
      GuideText(
        pt: 'Que gasto é importante para você e nem sempre parece importante para mim?',
        en: 'Which expense matters to you and may not look important to me?',
      ),
      GuideText(
        pt: 'Que combinação pequena poderia deixar os dois mais leves?',
        en: 'What small agreement could make things lighter for both of you?',
      ),
    ],
  ),
  GuideDefinition(
    slug: 'family',
    guideType: 'difficult',
    title: GuideText(pt: 'Família', en: 'Family'),
    description: GuideText(
      pt: 'Família, limites e o que aproxima.',
      en: 'Family, boundaries and what brings you closer.',
    ),
    prompts: [
      GuideText(
        pt: 'Como você quer que a gente lide com a família nas datas e visitas?',
        en: 'How would you like us to handle family around dates and visits?',
      ),
      GuideText(
        pt: 'O que da sua família você gostaria de manter perto?',
        en: 'What from your family would you like to keep close?',
      ),
      GuideText(
        pt: 'O que costuma ficar difícil quando a família entra na conversa?',
        en: 'What tends to get hard when family enters the conversation?',
      ),
      GuideText(
        pt: 'Qual limite pequeno protegeria vocês dois?',
        en: 'Which small boundary would protect the two of you?',
      ),
    ],
  ),
  GuideDefinition(
    slug: 'chores',
    guideType: 'difficult',
    title: GuideText(pt: 'Tarefas', en: 'Chores'),
    description: GuideText(
      pt: 'O peso invisível da rotina.',
      en: 'The invisible weight of routine.',
    ),
    prompts: [
      GuideText(
        pt: 'Quais tarefas você sente que carrega sem ajuda?',
        en: 'Which tasks feel like you carry them alone?',
      ),
      GuideText(
        pt: 'O que faria sua rotina ficar mais leve nesta semana?',
        en: 'What would make your routine lighter this week?',
      ),
      GuideText(
        pt: 'Que tarefa você gostaria de dividir de outro jeito?',
        en: 'Which task would you like to split differently?',
      ),
      GuideText(
        pt: 'Como vocês podem lembrar da combinação sem cobrança?',
        en: 'How can you remember the agreement without it feeling like a demand?',
      ),
    ],
  ),
  GuideDefinition(
    slug: 'plans',
    guideType: 'difficult',
    title: GuideText(pt: 'Planos', en: 'Plans'),
    description: GuideText(
      pt: 'O que vocês imaginam para frente.',
      en: 'What you picture for the months ahead.',
    ),
    prompts: [
      GuideText(
        pt: 'O que você imagina para os próximos meses?',
        en: 'What do you picture for the coming months?',
      ),
      GuideText(
        pt: 'O que é importante para você nesse plano?',
        en: 'What matters to you in that plan?',
      ),
      GuideText(
        pt: 'O que você teme que mude no caminho?',
        en: 'What are you afraid might change along the way?',
      ),
      GuideText(
        pt: 'Que passo pequeno vocês podem dar primeiro?',
        en: 'What small step can you take first?',
      ),
    ],
  ),
  GuideDefinition(
    slug: 'intimacy',
    guideType: 'difficult',
    title: GuideText(pt: 'Intimidade', en: 'Intimacy'),
    description: GuideText(
      pt: 'Proximidade, com calma e respeito.',
      en: 'Closeness, with calm and respect.',
    ),
    prompts: [
      GuideText(
        pt: 'O que te faz sentir perto de mim no dia a dia?',
        en: 'What makes you feel close to me day to day?',
      ),
      GuideText(
        pt: 'O que você gostaria que a gente conversasse com mais calma?',
        en: 'What would you like us to talk about more calmly?',
      ),
      GuideText(
        pt: 'O que te ajuda a se sentir à vontade para falar sobre isso?',
        en: 'What helps you feel safe to talk about this?',
      ),
      GuideText(
        pt: 'Que cuidado pequeno vocês podem combinar?',
        en: 'What small act of care could you agree on?',
      ),
    ],
    isSensitive: true,
    gateKey: 'intimacy',
  ),
  GuideDefinition(
    slug: 'year',
    guideType: 'transition',
    title: GuideText(pt: 'O nosso ano', en: 'Our year'),
    description: GuideText(
      pt: 'Olhar para o ano sem notas nem comparações.',
      en: 'Look back on the year, no grades, no comparing.',
    ),
    prompts: [
      GuideText(
        pt: 'Que coisas boas você notou em nós neste ano?',
        en: 'What good things did you notice about us this year?',
      ),
      GuideText(
        pt: 'Qual foi um momento em que você se sentiu cuidado ou cuidada?',
        en: 'When did you feel cared for this year?',
      ),
      GuideText(
        pt: 'O que foi mais difícil, e o que ajudou a atravessar?',
        en: 'What was hardest, and what helped you through?',
      ),
      GuideText(
        pt: 'O que você deseja para o próximo ano, em uma frase?',
        en: 'What do you wish for next year, in one sentence?',
      ),
    ],
  ),
  GuideDefinition(
    slug: 'cycle',
    guideType: 'difficult',
    title: GuideText(pt: 'Ciclos e energia', en: 'Cycles and energy'),
    description: GuideText(
      pt: 'Como o corpo e o humor mudam ao longo do mês.',
      en: 'How body and mood shift through the month.',
    ),
    prompts: [
      GuideText(
        pt: 'Como você costuma se sentir ao longo do mês, do seu jeito?',
        en: 'How do you usually feel through the month, in your own words?',
      ),
      GuideText(
        pt: 'Em quais dias você precisa de mais calma ou espaço?',
        en: 'On which days do you need more calm or space?',
      ),
      GuideText(
        pt: 'O que ajuda você nesses dias, e o que não ajuda?',
        en: 'What helps you on those days, and what does not?',
      ),
      GuideText(
        pt: 'Como vocês podem combinar isso sem nenhum julgamento?',
        en: 'How can you agree on this with no judgment?',
      ),
    ],
    isSensitive: true,
    gateKey: 'cycle',
  ),
  GuideDefinition(
    slug: 'apology',
    guideType: 'apology',
    title: GuideText(pt: 'Um pedido de desculpas', en: 'An apology'),
    description: GuideText(
      pt: 'Orienta, não escreve por você.',
      en: 'It guides you, it does not write for you.',
    ),
    prompts: [
      GuideText(
        pt: 'O que aconteceu, dito sem culpar ninguém?',
        en: 'What happened, said without blaming anyone?',
      ),
      GuideText(
        pt: 'Como você acha que isso foi para a outra pessoa?',
        en: 'How do you think it was for the other person?',
      ),
      GuideText(
        pt: 'O que você assume como seu, sem “mas”?',
        en: 'What do you own, with no “but”?',
      ),
      GuideText(
        pt: 'O que você pode fazer diferente da próxima vez?',
        en: 'What can you do differently next time?',
      ),
    ],
  ),
  GuideDefinition(
    slug: 'dreams',
    guideType: 'transition',
    title: GuideText(pt: 'Sonhos a dois', en: 'Dreams together'),
    description: GuideText(
      pt: 'O que cada um sonha e como caber no mesmo caminho.',
      en: 'What each of you dreams of, and how to fit one path.',
    ),
    prompts: [
      GuideText(
        pt: 'Com o que você sonha para daqui a cinco anos, sem filtro?',
        en: 'What do you dream of five years from now, with no filter?',
      ),
      GuideText(
        pt: 'Qual desses sonhos é só seu, e qual é nosso?',
        en: 'Which of those dreams is only yours, and which is ours?',
      ),
      GuideText(
        pt: 'O que faria um sonho meu pesar para você?',
        en: 'What would make a dream of mine feel heavy for you?',
      ),
      GuideText(
        pt: 'Que primeiro passo pequeno vocês podem dar neste mês?',
        en: 'What small first step could you take this month?',
      ),
    ],
    isPlusOnly: true,
  ),
  GuideDefinition(
    slug: 'values',
    guideType: 'transition',
    title: GuideText(pt: 'O que importa para nós', en: 'What matters to us'),
    description: GuideText(
      pt: 'Valores que guiam as escolhas de vocês.',
      en: 'Values that guide your choices.',
    ),
    prompts: [
      GuideText(
        pt: 'Que três coisas você não abre mão na sua vida?',
        en: 'What three things would you never give up in your life?',
      ),
      GuideText(
        pt: 'Quando você sentiu que vivemos de acordo com isso?',
        en: 'When did you feel we lived by those?',
      ),
      GuideText(
        pt: 'Onde nossos valores se encontram, e onde eles se separam?',
        en: 'Where do our values meet, and where do they part?',
      ),
      GuideText(
        pt: 'Que combinado respeita os dois quando eles se separam?',
        en: 'What agreement respects both of you when they part?',
      ),
    ],
    isPlusOnly: true,
  ),
  GuideDefinition(
    slug: 'distance',
    guideType: 'difficult',
    title: GuideText(pt: 'Distância', en: 'Distance'),
    description: GuideText(
      pt: 'Manter a proximidade mesmo longe.',
      en: 'Staying close, even when apart.',
    ),
    prompts: [
      GuideText(
        pt: 'O que mais pesa para você na distância agora?',
        en: 'What weighs on you most about the distance right now?',
      ),
      GuideText(
        pt: 'Que pequeno hábito faz você se sentir perto de mim?',
        en: 'What small habit makes you feel close to me?',
      ),
      GuideText(
        pt: 'Como você prefere falar nos dias corridos?',
        en: 'How do you prefer we talk on busy days?',
      ),
      GuideText(
        pt: 'Que combinado leve ajudaria a gente esta semana?',
        en: 'What light agreement would help us this week?',
      ),
    ],
  ),
];
