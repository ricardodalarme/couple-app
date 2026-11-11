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
  ),
];
