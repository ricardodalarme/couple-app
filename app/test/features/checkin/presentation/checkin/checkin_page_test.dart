import 'package:design_system/design_system.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/checkin/data/models/checkin_answer.dart';
import 'package:flutter_bloc_starter/features/checkin/data/models/checkin_week.dart';
import 'package:flutter_bloc_starter/features/checkin/data/repositories/checkin_repository.dart';
import 'package:flutter_bloc_starter/features/checkin/presentation/checkin/checkin_page.dart';
import 'package:flutter_bloc_starter/features/checkin/presentation/checkin/cubit/checkin_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockCheckinRepository() extends Mock implements CheckinRepository;

void main() {
  late CheckinRepository repository;

  final monday = DateTime(2026, 11, 2);

  CheckinAnswer answer(int question, [String? body]) =>
      CheckinAnswer(id: 'a$question', question: question, body: body ?? 'Resposta $question');

  Map<int, CheckinAnswer> answers(int count) => {
    for (var question = 1; question <= count; question++) question: answer(question),
  };

  CheckinWeek week({
    Map<int, CheckinAnswer>? own,
    Map<int, CheckinAnswer>? partner,
    String? coupleId = 'couple-1',
    bool isPaired = true,
  }) => CheckinWeek(
    weekStart: monday,
    coupleId: coupleId,
    isPaired: isPaired,
    partnerName: 'Marina',
    ownAnswers: own ?? const {},
    partnerAnswers: partner ?? const {},
  );

  setUpAll(() {
    LocaleSettings.setLocaleSync(AppLocale.pt);
    registerFallbackValue(
      CheckinWeek(weekStart: DateTime(2026, 11, 2), coupleId: 'couple-1', isPaired: true),
    );
  });

  setUp(() {
    repository = _MockCheckinRepository();
  });

  testWidgets('a finished week without partner rows explains the privacy', (tester) async {
    when(() => repository.getWeek()).thenAnswer((_) async => week(own: answers(4)));
    final cubit = CheckinCubit(repository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const CheckinPage()));
    await tester.pump();

    expect(find.text('Suas respostas ficaram guardadas'), findsOneWidget);
    expect(
      find.text('As respostas aparecem quando vocês dois tiverem respondido as quatro.'),
      findsOneWidget,
    );
    expect(find.text('Verificar de novo'), findsOneWidget);
    expect(find.text('Rever minhas respostas'), findsOneWidget);
  });

  testWidgets('checking again reads the week without a countdown', (tester) async {
    when(() => repository.getWeek()).thenAnswer((_) async => week(own: answers(4)));
    final cubit = CheckinCubit(repository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const CheckinPage()));
    await tester.pump();
    await tester.tap(find.text('Verificar de novo'));
    await tester.pump();

    verify(() => repository.getWeek()).called(2);
    expect(find.textContaining('dias'), findsNothing);
  });

  testWidgets('returning while waiting checks again', (tester) async {
    when(() => repository.getWeek()).thenAnswer((_) async => week(own: answers(4)));
    final cubit = CheckinCubit(repository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const CheckinPage()));
    await tester.pump();
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump();

    verify(() => repository.getWeek()).called(2);
  });

  testWidgets('resuming a missing answer shows the next saved answer in the field', (tester) async {
    when(() => repository.getWeek()).thenAnswer((_) async => week(own: {1: answer(1)}));
    when(
      () => repository.saveAnswer(
        week: any(named: 'week'),
        question: any(named: 'question'),
        body: any(named: 'body'),
      ),
    ).thenAnswer((invocation) async {
      final question = invocation.namedArguments[#question] as int;
      final body = invocation.namedArguments[#body] as String;

      return answer(question, body);
    });
    final cubit = CheckinCubit(repository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const CheckinPage()));
    await tester.pump();

    await tester.tap(find.text('Pular esta pergunta'));
    await tester.pump();
    await tester.enterText(find.byType(EditableText), 'Estresse no trabalho');
    await tester.tap(find.text('Próximo'));
    await tester.pump();
    await tester.pump();
    await tester.enterText(find.byType(EditableText), 'Fim de semana');
    await tester.tap(find.text('Concluir'));
    await tester.pump();
    await tester.pump();

    await tester.tap(find.text('Responder as que faltam'));
    await tester.pump();
    await tester.enterText(find.byType(EditableText), 'Voltei');
    await tester.tap(find.text('Próximo'));
    await tester.pump();
    await tester.pump();

    expect(find.text('Pergunta 3 de 4'), findsOneWidget);
    expect(
      tester.widget<EditableText>(find.byType(EditableText)).controller.text,
      'Estresse no trabalho',
    );
  });

  testWidgets('partner rows reveal both answers with no score', (tester) async {
    when(() => repository.getWeek()).thenAnswer(
      (_) async =>
          week(own: answers(4), partner: {...answers(4), 1: answer(1, 'A caminhada de domingo')}),
    );
    final cubit = CheckinCubit(repository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const CheckinPage()));
    await tester.pump();

    expect(find.text('A caminhada de domingo'), findsOneWidget);
    expect(find.text('Você'), findsWidgets);
    expect(find.text('Marina'), findsWidgets);
    expect(find.textContaining('Sem notas'), findsOneWidget);
  });

  testWidgets('an unpaired week shows the solo explanation', (tester) async {
    when(() => repository.getWeek())
        .thenAnswer((_) async => week(isPaired: false, coupleId: 'archived'));
    final cubit = CheckinCubit(repository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const CheckinPage()));
    await tester.pump();

    expect(find.text('O check-in é para vocês dois'), findsOneWidget);
  });

  testWidgets('leaving with an unsaved draft asks before discarding', (tester) async {
    when(() => repository.getWeek()).thenAnswer((_) async => week(own: {1: answer(1)}));
    final cubit = CheckinCubit(repository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    await tester.pumpApp(
      Builder(
        builder: (context) => Center(
          child: BaseButton.primary(
            text: 'Abrir',
            onPressed: () => Navigator.of(context).push<void>(
              PageRouteBuilder<void>(
                pageBuilder: (_, _, _) =>
                    BlocProvider.value(value: cubit, child: const CheckinPage()),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Abrir'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(EditableText), 'Rascunho');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pump();

    final navigator = tester.state<NavigatorState>(find.byType(Navigator));
    await navigator.maybePop();
    await tester.pumpAndSettle();

    expect(find.text('Descartar esta resposta?'), findsOneWidget);
    await tester.tap(find.text('Continuar escrevendo'));
    await tester.pumpAndSettle();
    expect(find.byType(CheckinPage), findsOneWidget);

    await navigator.maybePop();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Descartar'));
    await tester.pumpAndSettle();
    expect(find.byType(CheckinPage), findsNothing);
  });

  testWidgets('answering sends no haptic or notification platform call', (tester) async {
    when(() => repository.getWeek()).thenAnswer((_) async => week(own: {1: answer(1)}));
    when(
      () => repository.saveAnswer(
        week: any(named: 'week'),
        question: any(named: 'question'),
        body: any(named: 'body'),
      ),
    ).thenAnswer((_) async => answer(2, 'Uma resposta'));
    final cubit = CheckinCubit(repository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    final calls = <MethodCall>[];
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(SystemChannels.platform, (
      call,
    ) async {
      calls.add(call);

      return null;
    });
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        null,
      ),
    );

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const CheckinPage()));
    await tester.pump();
    await tester.enterText(find.byType(EditableText), 'Uma resposta');
    await tester.pump();
    await tester.tap(find.text('Próximo'));
    await tester.pump();
    await tester.pump();

    expect(find.text('Pergunta 3 de 4'), findsOneWidget);
    expect(
      calls.where(
        (call) =>
            call.method == 'HapticFeedback.vibrate' ||
            call.method.toLowerCase().contains('notification'),
      ),
      isEmpty,
    );
  });
}
