import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/questions/data/models/question_thread.dart';
import 'package:flutter_bloc_starter/features/questions/data/repositories/questions_repository.dart';
import 'package:flutter_bloc_starter/features/questions/presentation/questions/cubit/questions_cubit.dart';
import 'package:flutter_bloc_starter/features/questions/presentation/questions/questions_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockQuestionsRepository() extends Mock implements QuestionsRepository;

void main() {
  late QuestionsRepository repository;

  QuestionPrompt prompt({bool isPaired = true, String? coupleId = 'couple-1'}) => QuestionPrompt(
    slug: 'first-meeting',
    title: 'O que você se lembra da primeira vez?',
    isPaired: isPaired,
    selfId: 'me',
    partnerName: 'Marina',
    coupleId: coupleId,
  );

  QuestionThread thread({
    QuestionAnswer? own,
    QuestionAnswer? partner,
    bool partnerAnswered = false,
    bool isPaired = true,
  }) => QuestionThread(
    prompt: prompt(isPaired: isPaired),
    ownAnswer: own,
    partnerAnswer: partner,
    partnerHasAnswered: partnerAnswered,
  );

  const own = QuestionAnswer(id: 'own', body: 'Foi na festa da Ana.');

  setUpAll(() {
    LocaleSettings.setLocaleSync(AppLocale.pt);
    registerFallbackValue(thread());
  });

  setUp(() {
    repository = _MockQuestionsRepository();
    when(() => repository.getThread()).thenAnswer((_) async => thread());
  });

  Future<QuestionsCubit> loaded(QuestionThread value) async {
    when(() => repository.getThread()).thenAnswer((_) async => value);
    final cubit = QuestionsCubit(repository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    return cubit;
  }

  testWidgets('the first frame shows a skeleton instead of a blank page', (tester) async {
    final cubit = QuestionsCubit(repository: repository);
    addTearDown(cubit.close);

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const QuestionsPage()));
    await tester.pump();

    expect(find.byWidgetPredicate((widget) => widget is Skeletonizer), findsOneWidget);
    expect(find.text('Sua resposta ficou guardada'), findsOneWidget);
    expect(find.text('Uma resposta gentil.'), findsOneWidget);
  });

  testWidgets('the answer screen keeps voice honestly disabled', (tester) async {
    final cubit = await loaded(thread());

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const QuestionsPage()));
    await tester.pump();

    expect(find.text('O que você se lembra da primeira vez?'), findsOneWidget);
    expect(find.text('Só você vê isto até seu par responder também.'), findsOneWidget);
    final voice = tester.widget<BaseButton>(
      find.ancestor(of: find.text('Recado de voz'), matching: find.byType(BaseButton)),
    );
    expect(voice.isEnabled, isFalse);
    await tester.tap(find.text('Recado de voz'));
    await tester.pump();

    expect(tester.takeException(), isNull);
  });

  testWidgets('an empty send shows the field error instead of doing nothing', (tester) async {
    final cubit = await loaded(thread());

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const QuestionsPage()));
    await tester.pump();

    await tester.tap(find.text('Enviar'));
    await tester.pump();

    expect(find.text('Escreva uma resposta'), findsOneWidget);
    verifyNever(
      () => repository.saveAnswer(
        thread: any(named: 'thread'),
        body: any(named: 'body'),
      ),
    );
  });

  testWidgets('a saved answer waits quietly and can be checked again', (tester) async {
    final cubit = await loaded(thread(own: own, partnerAnswered: true));

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const QuestionsPage()));
    await tester.pump();

    expect(find.text('Sua resposta ficou guardada'), findsOneWidget);
    expect(find.text('Foi na festa da Ana.'), findsOneWidget);
    expect(find.text('Verificar de novo'), findsOneWidget);
    expect(find.text('Editar minha resposta'), findsOneWidget);
    expect(find.textContaining('dias'), findsNothing);

    await tester.tap(find.text('Verificar de novo'));
    await tester.pump();

    verify(() => repository.getThread()).called(2);
  });

  testWidgets('returning while waiting checks again', (tester) async {
    final cubit = await loaded(thread(own: own));

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const QuestionsPage()));
    await tester.pump();
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump();

    verify(() => repository.getThread()).called(2);
  });

  testWidgets('backgrounding while editing keeps the draft', (tester) async {
    final cubit = await loaded(thread(own: own));

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const QuestionsPage()));
    await tester.pump();
    await tester.tap(find.text('Editar minha resposta'));
    await tester.pump();
    await tester.enterText(find.byType(EditableText), 'Texto em edição');
    await tester.pump();

    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump();

    expect(
      tester.widget<EditableText>(find.byType(EditableText)).controller.text,
      'Texto em edição',
    );
    verify(() => repository.getThread()).called(1);
  });

  testWidgets('both answers appear together with no scores', (tester) async {
    final cubit = await loaded(
      thread(
        own: own,
        partner: const QuestionAnswer(id: 'partner', body: 'Achei você sério demais.'),
      ),
    );

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const QuestionsPage()));
    await tester.pump();

    expect(find.text('Foi na festa da Ana.'), findsOneWidget);
    expect(find.text('Achei você sério demais.'), findsOneWidget);
    expect(find.text('Marina'), findsOneWidget);
    expect(find.text('Sem notas. Só o que cada um escreveu.'), findsOneWidget);
    expect(find.textContaining('nota'), findsOneWidget);
  });

  testWidgets('a solo question explains the partner will see it later', (tester) async {
    final cubit = await loaded(thread(isPaired: false));

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const QuestionsPage()));
    await tester.pump();

    expect(
      find.text('Sua resposta fica privada. Seu par vai ver depois que vocês se conectarem.'),
      findsOneWidget,
    );
    expect(find.byType(EditableText), findsOneWidget);
  });

  testWidgets('a failed send keeps the typed text', (tester) async {
    when(() => repository.getThread()).thenAnswer((_) async => thread());
    when(
      () => repository.saveAnswer(
        thread: any(named: 'thread'),
        body: any(named: 'body'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: networkErrorCode));
    final cubit = QuestionsCubit(repository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const QuestionsPage()));
    await tester.pump();
    await tester.enterText(find.byType(EditableText), 'Não quero perder isto');
    await tester.pump();
    await tester.tap(find.text('Enviar'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(
      tester.widget<EditableText>(find.byType(EditableText)).controller.text,
      'Não quero perder isto',
    );
    expect(find.text('Não deu para salvar agora. Tente de novo.'), findsOneWidget);

    await tester.pump(const Duration(seconds: 7));
  });
}
