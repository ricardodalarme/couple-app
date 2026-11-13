import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/checkin/data/models/checkin_answer.dart';
import 'package:flutter_bloc_starter/features/checkin/data/models/checkin_week.dart';
import 'package:flutter_bloc_starter/features/checkin/data/repositories/checkin_repository.dart';
import 'package:flutter_bloc_starter/features/checkin/presentation/checkin/cubit/checkin_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

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
    String? partnerName = 'Marina',
  }) => CheckinWeek(
    weekStart: monday,
    coupleId: coupleId,
    isPaired: isPaired,
    partnerName: partnerName,
    ownAnswers: own ?? const {},
    partnerAnswers: partner ?? const {},
  );

  setUpAll(() {
    registerFallbackValue(
      CheckinWeek(weekStart: DateTime(2026, 11, 2), coupleId: 'couple-1', isPaired: true),
    );
  });

  setUp(() {
    repository = _MockCheckinRepository();
    when(() => repository.getWeek()).thenAnswer((_) async => week());
    when(() => repository.deleteAnswer(any())).thenAnswer((_) async {});
    when(() => repository.dismissWeek(any())).thenAnswer((_) async {});
  });

  CheckinCubit build() => CheckinCubit(repository: repository);

  test('an empty week opens the intro', () async {
    final cubit = build();

    await cubit.load();

    expect(cubit.state.week, isA<Success<CheckinWeek>>());
    expect(cubit.state.step, CheckinStep.intro);
  });

  test('an abandoned check-in resumes at the first unanswered question', () async {
    when(() => repository.getWeek())
        .thenAnswer((_) async => week(own: {1: answer(1), 2: answer(2)}));
    final cubit = build();

    await cubit.load();

    expect(cubit.state.step, CheckinStep.questions);
    expect(cubit.state.questionNumber, 3);
    expect(cubit.state.draft, isEmpty);
  });

  test('a completed week without partner rows waits privately', () async {
    when(() => repository.getWeek()).thenAnswer((_) async => week(own: answers(4)));
    final cubit = build();

    await cubit.load();

    expect(cubit.state.step, CheckinStep.waiting);
    expect(cubit.state.isOwnComplete, isTrue);
    expect(cubit.state.current?.isRevealed, isFalse);
  });

  test('four own and four partner answers reveal the answers together', () async {
    when(() => repository.getWeek())
        .thenAnswer((_) async => week(own: answers(4), partner: answers(4)));
    final cubit = build();

    await cubit.load();

    expect(cubit.state.step, CheckinStep.reveal);
    expect(cubit.state.current?.partnerAnswers.length, 4);
  });

  test('three own rows keep the reveal hidden even with four partner rows', () async {
    when(() => repository.getWeek())
        .thenAnswer((_) async => week(own: answers(3), partner: answers(4)));
    final cubit = build();

    await cubit.load();

    expect(cubit.state.step, CheckinStep.questions);
    expect(cubit.state.current?.isRevealed, isFalse);
  });

  test('four own rows and one partner row never reveal', () async {
    when(() => repository.getWeek())
        .thenAnswer((_) async => week(own: answers(4), partner: answers(1)));
    final cubit = build();

    await cubit.load();

    expect(cubit.state.step, CheckinStep.waiting);
    expect(cubit.state.current?.isRevealed, isFalse);
  });

  test('start opens the first unanswered question', () async {
    when(() => repository.getWeek()).thenAnswer((_) async => week(own: {1: answer(1)}));
    final cubit = build();
    await cubit.load();

    cubit.start();

    expect(cubit.state.step, CheckinStep.questions);
    expect(cubit.state.questionNumber, 2);
  });

  test('review returns to the first saved answer with its text', () async {
    when(() => repository.getWeek()).thenAnswer((_) async => week(own: answers(4)));
    final cubit = build();
    await cubit.load();

    cubit.review();

    expect(cubit.state.step, CheckinStep.questions);
    expect(cubit.state.questionNumber, 1);
    expect(cubit.state.draft, 'Resposta 1');
  });

  test('saving an answer advances and keeps it for the next question', () async {
    when(() => repository.getWeek()).thenAnswer((_) async => week(own: {1: answer(1)}));
    when(
      () => repository.saveAnswer(
        week: any(named: 'week'),
        question: any(named: 'question'),
        body: any(named: 'body'),
      ),
    ).thenAnswer((_) async => answer(2, 'Foi bom'));
    final cubit = build();
    await cubit.load();
    cubit.onDraftChanged('Foi bom');

    await cubit.next();

    expect(cubit.state.questionNumber, 3);
    expect(cubit.state.draft, isEmpty);
    expect(cubit.state.current?.answerFor(2)?.body, 'Foi bom');
    verify(
      () => repository.saveAnswer(
        week: any(named: 'week'),
        question: 2,
        body: 'Foi bom',
      ),
    ).called(1);
  });

  test('a save failure keeps the typed text and the question', () async {
    when(() => repository.getWeek()).thenAnswer((_) async => week(own: {1: answer(1)}));
    when(
      () => repository.saveAnswer(
        week: any(named: 'week'),
        question: any(named: 'question'),
        body: any(named: 'body'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: networkErrorCode));
    final cubit = build();
    await cubit.load();
    cubit.onDraftChanged('Não quero perder isto');

    await cubit.next();

    expect(cubit.state.questionNumber, 2);
    expect(cubit.state.draft, 'Não quero perder isto');
    expect(cubit.state.saveAction, isA<Initial>());
  });

  test('skip on a blank question moves on without saving', () async {
    when(() => repository.getWeek()).thenAnswer((_) async => week(own: {1: answer(1)}));
    final cubit = build();
    await cubit.load();

    await cubit.skip();

    expect(cubit.state.questionNumber, 3);
    verifyNever(
      () => repository.saveAnswer(
        week: any(named: 'week'),
        question: any(named: 'question'),
        body: any(named: 'body'),
      ),
    );
    verifyNever(() => repository.deleteAnswer(any()));
  });

  test('skip on an already saved answer deletes the row', () async {
    when(() => repository.getWeek()).thenAnswer((_) async => week(own: answers(4)));
    final cubit = build();
    await cubit.load();
    cubit.review();

    await cubit.skip();

    expect(cubit.state.current?.answerFor(1), isNull);
    expect(cubit.state.questionNumber, 2);
    verify(() => repository.deleteAnswer('a1')).called(1);
  });

  test('clearing a saved answer deletes the row and keeps the week incomplete', () async {
    when(() => repository.getWeek()).thenAnswer((_) async => week(own: answers(4)));
    final cubit = build();
    await cubit.load();
    cubit
      ..review()
      ..onDraftChanged('   ');

    await cubit.next();

    expect(cubit.state.current?.answerFor(1), isNull);
    expect(cubit.state.current?.isOwnComplete, isFalse);
    verify(() => repository.deleteAnswer('a1')).called(1);
    verifyNever(
      () => repository.saveAnswer(
        week: any(named: 'week'),
        question: any(named: 'question'),
        body: any(named: 'body'),
      ),
    );
  });

  test('a delete failure keeps the question and the saved answer', () async {
    when(() => repository.getWeek()).thenAnswer((_) async => week(own: answers(4)));
    when(() => repository.deleteAnswer(any()))
        .thenThrow(const LocalizedException(l10nKey: networkErrorCode));
    final cubit = build();
    await cubit.load();
    cubit.review();

    await cubit.skip();

    expect(cubit.state.questionNumber, 1);
    expect(cubit.state.current?.answerFor(1), isNotNull);
    expect(cubit.state.saveAction, isA<Initial>());
  });

  test('skipping the last blank question waits without inventing an answer', () async {
    when(() => repository.getWeek()).thenAnswer((_) async => week(own: answers(3)));
    final cubit = build();
    await cubit.load();

    await cubit.skip();

    expect(cubit.state.step, CheckinStep.waiting);
    expect(cubit.state.isOwnComplete, isFalse);
  });

  test('finishing the fourth answer after three rows reveals when both are complete', () async {
    when(() => repository.getWeek())
        .thenAnswer((_) async => week(own: answers(3), partner: answers(4)));
    when(
      () => repository.saveAnswer(
        week: any(named: 'week'),
        question: any(named: 'question'),
        body: any(named: 'body'),
      ),
    ).thenAnswer((_) async => answer(4, 'A última'));
    final cubit = build();
    await cubit.load();
    expect(cubit.state.step, CheckinStep.questions);
    expect(cubit.state.current?.isRevealed, isFalse);
    cubit.onDraftChanged('A última');

    await cubit.next();

    expect(cubit.state.current?.isOwnComplete, isTrue);
    expect(cubit.state.step, CheckinStep.reveal);
  });

  test('finishing without all partner rows waits instead of revealing', () async {
    var reads = 0;
    when(() => repository.getWeek()).thenAnswer((_) async {
      reads++;

      return week(own: answers(reads == 1 ? 3 : 4), partner: answers(1));
    });
    when(
      () => repository.saveAnswer(
        week: any(named: 'week'),
        question: any(named: 'question'),
        body: any(named: 'body'),
      ),
    ).thenAnswer((_) async => answer(4, 'A última'));
    final cubit = build();
    await cubit.load();
    cubit.onDraftChanged('A última');

    await cubit.next();

    expect(cubit.state.step, CheckinStep.waiting);
    expect(cubit.state.current?.isRevealed, isFalse);
    expect(reads, 2);
  });

  test('resuming a missing answer keeps the next saved answer in the draft', () async {
    when(() => repository.getWeek()).thenAnswer((_) async => week(own: {1: answer(1)}));
    when(
      () => repository.saveAnswer(
        week: any(named: 'week'),
        question: any(named: 'question'),
        body: any(named: 'body'),
      ),
    ).thenAnswer((invocation) async {
      final question = invocation.namedArguments[#question] as int;

      return answer(question, 'Resposta $question');
    });
    final cubit = build();
    await cubit.load();
    await cubit.skip();
    cubit.onDraftChanged('Estresse no trabalho');
    await cubit.next();
    cubit.onDraftChanged('Fim de semana');
    await cubit.next();

    expect(cubit.state.step, CheckinStep.waiting);

    cubit.start();
    expect(cubit.state.questionNumber, 2);

    cubit.onDraftChanged('Voltei');
    await cubit.next();

    expect(cubit.state.questionNumber, 3);
    expect(cubit.state.draft, 'Resposta 3');
  });

  test('dismissing stores this week', () async {
    final cubit = build();
    await cubit.load();

    await cubit.dismissThisWeek();

    verify(() => repository.dismissWeek(monday)).called(1);
  });

  test('a load failure becomes a failure resource', () async {
    when(() => repository.getWeek()).thenThrow(const LocalizedException(l10nKey: networkErrorCode));
    final cubit = build();

    await cubit.load();

    expect(cubit.state.week, isA<Failure>());
  });
}
