import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/questions/data/data_sources/remote/questions_data_source.dart';
import 'package:flutter_bloc_starter/features/questions/data/models/question_thread.dart';
import 'package:flutter_bloc_starter/features/questions/data/repositories/questions_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class _MockQuestionsDataSource() extends Mock implements QuestionsDataSource;

void main() {
  late QuestionsDataSource dataSource;
  late QuestionsRepository repository;

  QuestionPromptRecord prompt({
    bool isPaired = true,
    String? partnerName = 'Marina',
    String? coupleId = 'couple-1',
    String selfId = 'me',
  }) => (
    slug: 'first-meeting',
    title: 'O que você se lembra da primeira vez?',
    body: 'Uma lembrança de vocês dois.',
    tags: ['memories'],
    isPaired: isPaired,
    partnerName: partnerName,
    coupleId: coupleId,
    selfId: selfId,
  );

  QuestionAnswerRecord row({
    String id = 'a1',
    String authorId = 'me',
    String? coupleId = 'couple-1',
  }) => (id: id, authorId: authorId, coupleId: coupleId, body: 'Foi na festa da Ana.');

  void stubAnswers({List<QuestionAnswerRecord> rows = const [], bool partnerAnswered = false}) {
    when(() => dataSource.getAnswers('first-meeting'))
        .thenAnswer((_) async => (rows: rows, partnerAnswered: partnerAnswered));
  }

  setUpAll(() {
    registerFallbackValue(QuestionThread.fake());
  });

  setUp(() {
    dataSource = _MockQuestionsDataSource();
    repository = QuestionsRepository(dataSource: dataSource);
    when(() => dataSource.getPrompt()).thenAnswer((_) async => prompt());
    stubAnswers();
    when(
      () => dataSource.insertAnswer(
        questionSlug: any(named: 'questionSlug'),
        body: any(named: 'body'),
        coupleId: any(named: 'coupleId'),
      ),
    ).thenAnswer(
      (_) async => (id: 'a2', authorId: 'me', coupleId: 'couple-1', body: 'Resposta nova'),
    );
    when(() => dataSource.deleteAnswer(any())).thenAnswer((_) async {});
  });

  test('the question keeps the couple context', () async {
    final prompt = await repository.getPrompt();

    expect(prompt.slug, 'first-meeting');
    expect(prompt.title, 'O que você se lembra da primeira vez?');
    expect(prompt.partnerName, 'Marina');
    expect(prompt.coupleId, 'couple-1');
    expect(prompt.selfId, 'me');
  });

  test('own and partner rows are kept apart', () async {
    stubAnswers(
      rows: [
        row(),
        row(id: 'p1', authorId: 'partner'),
      ],
      partnerAnswered: true,
    );

    final thread = await repository.getThread();

    expect(thread.ownAnswer?.body, 'Foi na festa da Ana.');
    expect(thread.partnerAnswer?.body, 'Foi na festa da Ana.');
    expect(thread.isRevealed, isTrue);
    verify(() => dataSource.getAnswers('first-meeting')).called(1);
  });

  test('a partner answer flag without a visible row never reveals', () async {
    stubAnswers(rows: [row()], partnerAnswered: true);

    final thread = await repository.getThread();

    expect(thread.partnerHasAnswered, isTrue);
    expect(thread.partnerAnswer, isNull);
    expect(thread.isRevealed, isFalse);
  });

  test('an answer from a previous couple never satisfies the current reveal', () async {
    stubAnswers(
      rows: [
        row(id: 'old', coupleId: 'old-couple'),
        row(id: 'p1', authorId: 'partner'),
      ],
      partnerAnswered: true,
    );

    final oldCouple = await repository.getThread();

    expect(oldCouple.ownAnswer, isNull);
    expect(oldCouple.partnerAnswer, isNotNull);
    expect(oldCouple.isRevealed, isFalse);

    stubAnswers(
      rows: [
        row(),
        row(id: 'p1', authorId: 'partner'),
      ],
      partnerAnswered: true,
    );

    final currentCouple = await repository.getThread();

    expect(currentCouple.ownAnswer?.id, 'a1');
    expect(currentCouple.isRevealed, isTrue);
  });

  test('a solo question has no couple and stays private', () async {
    when(() => dataSource.getPrompt())
        .thenAnswer((_) async => prompt(isPaired: false, partnerName: null, coupleId: null));

    final thread = await repository.getThread();

    expect(thread.isSolo, isTrue);
    expect(thread.prompt.coupleId, isNull);
  });

  test('the first answer inserts with the couple id', () async {
    final thread = await repository.getThread();

    await repository.saveAnswer(thread: thread, body: '  Minha lembrança.  ');

    verifyNever(() => dataSource.deleteAnswer(any()));
    verify(
      () => dataSource.insertAnswer(
        questionSlug: 'first-meeting',
        body: 'Minha lembrança.',
        coupleId: 'couple-1',
      ),
    ).called(1);
  });

  test('a solo first answer inserts without a couple id', () async {
    when(() => dataSource.getPrompt())
        .thenAnswer((_) async => prompt(isPaired: false, partnerName: null, coupleId: null));
    final thread = await repository.getThread();

    await repository.saveAnswer(thread: thread, body: 'Só minha.');

    verify(
      () =>
          dataSource.insertAnswer(questionSlug: 'first-meeting', body: 'Só minha.', coupleId: null),
    ).called(1);
  });

  test('editing removes the own row before inserting the new text', () async {
    stubAnswers(rows: [row()]);
    final thread = await repository.getThread();

    await repository.saveAnswer(thread: thread, body: 'Texto novo');

    verifyInOrder([
      () => dataSource.deleteAnswer('a1'),
      () => dataSource.insertAnswer(
        questionSlug: 'first-meeting',
        body: 'Texto novo',
        coupleId: 'couple-1',
      ),
    ]);
  });

  test('a failed replacement insert restores the previous answer', () async {
    var inserts = 0;
    when(
      () => dataSource.insertAnswer(
        questionSlug: any(named: 'questionSlug'),
        body: any(named: 'body'),
        coupleId: any(named: 'coupleId'),
      ),
    ).thenAnswer((_) async {
      inserts++;
      if (inserts == 1) throw const LocalizedException(l10nKey: networkErrorCode);

      return (id: 'restored', authorId: 'me', coupleId: 'couple-1', body: 'Foi na festa da Ana.');
    });
    stubAnswers(rows: [row()]);
    final thread = await repository.getThread();

    await expectLater(
      repository.saveAnswer(thread: thread, body: 'Texto novo'),
      throwsA(isA<LocalizedException>()),
    );

    verifyInOrder([
      () => dataSource.deleteAnswer('a1'),
      () => dataSource.insertAnswer(
        questionSlug: 'first-meeting',
        body: 'Texto novo',
        coupleId: 'couple-1',
      ),
      () => dataSource.insertAnswer(
        questionSlug: 'first-meeting',
        body: 'Foi na festa da Ana.',
        coupleId: 'couple-1',
      ),
    ]);
  });

  test('a duplicate insert replaces the row the server already has', () async {
    var inserts = 0;
    when(
      () => dataSource.insertAnswer(
        questionSlug: any(named: 'questionSlug'),
        body: any(named: 'body'),
        coupleId: any(named: 'coupleId'),
      ),
    ).thenAnswer((_) async {
      inserts++;
      if (inserts == 1) throw const LocalizedException(l10nKey: '23505');

      return (id: 'a2', authorId: 'me', coupleId: 'couple-1', body: 'Resposta nova');
    });
    when(() => dataSource.getPrompt()).thenAnswer((_) async => prompt());
    stubAnswers(rows: [row(id: 'old')]);
    final thread = await repository.getThread();

    await repository.saveAnswer(thread: thread, body: 'Resposta nova');

    verifyInOrder([
      () => dataSource.deleteAnswer('old'),
      () => dataSource.insertAnswer(
        questionSlug: 'first-meeting',
        body: 'Resposta nova',
        coupleId: 'couple-1',
      ),
      () => dataSource.deleteAnswer('old'),
      () => dataSource.insertAnswer(
        questionSlug: 'first-meeting',
        body: 'Resposta nova',
        coupleId: 'couple-1',
      ),
    ]);
  });
}
