import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/checkin/data/data_sources/local/checkin_local_data_source.dart';
import 'package:flutter_bloc_starter/features/checkin/data/data_sources/remote/checkin_data_source.dart';
import 'package:flutter_bloc_starter/features/checkin/data/models/checkin_answer.dart';
import 'package:flutter_bloc_starter/features/checkin/data/models/checkin_week.dart';
import 'package:flutter_bloc_starter/features/checkin/data/repositories/checkin_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockCheckinDataSource() extends Mock implements CheckinDataSource;

class _MockCheckinLocalDataSource() extends Mock implements CheckinLocalDataSource;

void main() {
  late CheckinDataSource dataSource;
  late CheckinLocalDataSource localDataSource;
  late CheckinRepository repository;

  final sunday = DateTime(2026, 11, 8, 22, 30);
  final monday = DateTime(2026, 11, 2);

  CheckinTodayRecord today({
    DateTime? localDate,
    String? partnerName = 'Marina',
    String? coupleId = 'couple-1',
    bool isPaired = true,
  }) => (
    localDate: localDate ?? sunday,
    partnerName: partnerName,
    coupleId: coupleId,
    isPaired: isPaired,
  );

  CheckinAnswerRecord row({
    String id = 'a1',
    bool isMine = true,
    int question = 1,
    String body = 'Foi uma boa semana.',
  }) => (id: id, isMine: isMine, question: question, body: body);

  CheckinAnswerWriteRecord writeRow({
    String id = 'a1',
    int question = 1,
    String body = 'Foi uma boa semana.',
  }) => (id: id, question: question, body: body);

  Map<int, CheckinAnswerRecord> rowsFor({
    required int count,
    bool isMine = true,
    String prefix = 'a',
  }) => {
    for (var question = 1; question <= count; question++)
      question: row(
        id: '$prefix$question',
        isMine: isMine,
        question: question,
        body: 'Resposta $question',
      ),
  };

  void stubAnswers(List<CheckinAnswerRecord> rows) {
    when(
      () => dataSource.getAnswers(
        weekStart: any(named: 'weekStart'),
        coupleId: any(named: 'coupleId'),
      ),
    ).thenAnswer((_) async => rows);
  }

  setUpAll(() => registerFallbackValue(DateTime(2026, 11, 2)));

  setUp(() {
    dataSource = _MockCheckinDataSource();
    localDataSource = _MockCheckinLocalDataSource();
    repository = CheckinRepository(dataSource: dataSource, localDataSource: localDataSource);
    when(() => dataSource.getToday()).thenAnswer((_) async => today());
    stubAnswers([]);
  });

  test('the week starts on Monday from the server local day', () async {
    final week = await repository.getWeek();

    expect(week.weekStart, monday);
    verify(() => dataSource.getAnswers(weekStart: monday, coupleId: 'couple-1')).called(1);
  });

  test('the read is scoped to the current couple, never another', () async {
    await repository.getWeek();

    verify(() => dataSource.getAnswers(weekStart: monday, coupleId: 'couple-1')).called(1);
    verifyNever(() => dataSource.getAnswers(weekStart: monday, coupleId: 'couple-2'));
  });

  test('own and partner rows are kept apart', () async {
    stubAnswers([
      ...rowsFor(count: 1).values,
      ...rowsFor(count: 2, isMine: false, prefix: 'p').values,
    ]);

    final week = await repository.getWeek();

    expect(week.ownAnswers.keys, [1]);
    expect(week.partnerAnswers.keys, [1, 2]);
    expect(week.partnerName, 'Marina');
    expect(week.coupleId, 'couple-1');
    expect(week.isRevealed, isFalse);
  });

  test('four own rows and four partner rows reveal together', () async {
    stubAnswers([
      ...rowsFor(count: 4).values,
      ...rowsFor(count: 4, isMine: false, prefix: 'p').values,
    ]);

    final week = await repository.getWeek();

    expect(week.isOwnComplete, isTrue);
    expect(week.partnerAnswers.length, 4);
    expect(week.isRevealed, isTrue);
  });

  test('three own rows keep the reveal hidden even with four partner rows', () async {
    stubAnswers([
      ...rowsFor(count: 3).values,
      ...rowsFor(count: 4, isMine: false, prefix: 'p').values,
    ]);

    final week = await repository.getWeek();

    expect(week.isOwnComplete, isFalse);
    expect(week.isRevealed, isFalse);
  });

  test('four own rows and one partner row must not reveal', () async {
    stubAnswers([
      ...rowsFor(count: 4).values,
      ...rowsFor(count: 1, isMine: false, prefix: 'p').values,
    ]);

    final week = await repository.getWeek();

    expect(week.isOwnComplete, isTrue);
    expect(week.partnerAnswers.length, 1);
    expect(week.isRevealed, isFalse);
  });

  test('an own-only week is complete but not revealed', () async {
    stubAnswers(rowsFor(count: 4).values.toList());

    final week = await repository.getWeek();

    expect(week.isOwnComplete, isTrue);
    expect(week.isRevealed, isFalse);
  });

  test('a solo week has no couple and never reads answers', () async {
    when(() => dataSource.getToday())
        .thenAnswer((_) async => today(coupleId: null, isPaired: false));

    final week = await repository.getWeek();

    expect(week.canParticipate, isFalse);
    expect(week.coupleId, isNull);
    verifyNever(
      () => dataSource.getAnswers(
        weekStart: any(named: 'weekStart'),
        coupleId: any(named: 'coupleId'),
      ),
    );
  });

  test('an archived or unpaired couple never reads answers', () async {
    when(() => dataSource.getToday()).thenAnswer((_) async => today(isPaired: false));

    final week = await repository.getWeek();

    expect(week.canParticipate, isFalse);
    verifyNever(
      () => dataSource.getAnswers(
        weekStart: any(named: 'weekStart'),
        coupleId: any(named: 'coupleId'),
      ),
    );
  });

  test('editing before the reveal updates the existing row', () async {
    when(
      () => dataSource.saveAnswer(
        id: any(named: 'id'),
        coupleId: any(named: 'coupleId'),
        weekStart: any(named: 'weekStart'),
        question: any(named: 'question'),
        body: any(named: 'body'),
      ),
    ).thenAnswer((_) async => writeRow(id: 'a1', body: 'Texto novo'));
    final week = CheckinWeek(
      weekStart: monday,
      coupleId: 'couple-1',
      isPaired: true,
      ownAnswers: {1: const CheckinAnswer(id: 'a1', question: 1, body: 'Texto antigo')},
    );

    final answer = await repository.saveAnswer(week: week, question: 1, body: '  Texto novo  ');

    expect(answer.body, 'Texto novo');
    verify(
      () => dataSource.saveAnswer(
        id: 'a1',
        coupleId: 'couple-1',
        weekStart: monday,
        question: 1,
        body: 'Texto novo',
      ),
    ).called(1);
  });

  test('a new answer inserts without an id', () async {
    when(
      () => dataSource.saveAnswer(
        id: any(named: 'id'),
        coupleId: any(named: 'coupleId'),
        weekStart: any(named: 'weekStart'),
        question: any(named: 'question'),
        body: any(named: 'body'),
      ),
    ).thenAnswer((_) async => writeRow(question: 2, body: 'Uma resposta'));

    await repository.saveAnswer(
      week: CheckinWeek(weekStart: monday, coupleId: 'couple-1', isPaired: true),
      question: 2,
      body: 'Uma resposta',
    );

    verify(
      () => dataSource.saveAnswer(
        id: null,
        coupleId: 'couple-1',
        weekStart: monday,
        question: 2,
        body: 'Uma resposta',
      ),
    ).called(1);
  });

  test('a unique race updates the row that already exists', () async {
    stubAnswers([row(id: 'a1')]);
    var attempts = 0;
    when(
      () => dataSource.saveAnswer(
        id: any(named: 'id'),
        coupleId: any(named: 'coupleId'),
        weekStart: any(named: 'weekStart'),
        question: any(named: 'question'),
        body: any(named: 'body'),
      ),
    ).thenAnswer((_) async {
      attempts++;
      if (attempts == 1) throw const LocalizedException(l10nKey: '23505');

      return writeRow(id: 'a1', body: 'Oi');
    });

    await repository.saveAnswer(
      week: CheckinWeek(weekStart: monday, coupleId: 'couple-1', isPaired: true),
      question: 1,
      body: 'Oi',
    );

    verify(
      () => dataSource.saveAnswer(
        id: null,
        coupleId: 'couple-1',
        weekStart: monday,
        question: 1,
        body: 'Oi',
      ),
    ).called(1);
    verify(
      () => dataSource.saveAnswer(
        id: 'a1',
        coupleId: 'couple-1',
        weekStart: monday,
        question: 1,
        body: 'Oi',
      ),
    ).called(1);
  });

  test('clearing an answer deletes its row', () async {
    when(() => dataSource.deleteAnswer('a1')).thenAnswer((_) async {});

    await repository.deleteAnswer('a1');

    verify(() => dataSource.deleteAnswer('a1')).called(1);
  });

  test('a solo week stops before any network save', () async {
    final week = CheckinWeek(weekStart: monday, coupleId: null, isPaired: false);

    await expectLater(
      repository.saveAnswer(week: week, question: 1, body: 'Oi'),
      throwsA(isA<LocalizedException>()),
    );
    verifyNever(
      () => dataSource.saveAnswer(
        id: any(named: 'id'),
        coupleId: any(named: 'coupleId'),
        weekStart: any(named: 'weekStart'),
        question: any(named: 'question'),
        body: any(named: 'body'),
      ),
    );
  });

  test('the current dismissal compares the server week with the stored week', () async {
    when(() => localDataSource.isDismissedFor(monday)).thenReturn(true);

    final dismissed = await repository.isCurrentWeekDismissed();

    expect(dismissed, isTrue);
    verify(() => localDataSource.isDismissedFor(monday)).called(1);
  });

  test('dismissing writes the server week start locally', () async {
    when(() => localDataSource.writeDismissedWeek(monday)).thenAnswer((_) async {});

    await repository.dismissWeek(monday);

    verify(() => localDataSource.writeDismissedWeek(monday)).called(1);
  });
}
