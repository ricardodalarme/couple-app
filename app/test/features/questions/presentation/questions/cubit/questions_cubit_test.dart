import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/questions/data/models/question_thread.dart';
import 'package:flutter_bloc_starter/features/questions/data/repositories/questions_repository.dart';
import 'package:flutter_bloc_starter/features/questions/presentation/questions/cubit/questions_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class _MockQuestionsRepository() extends Mock implements QuestionsRepository;

void main() {
  late QuestionsRepository repository;

  QuestionPrompt prompt({bool isPaired = true}) => QuestionPrompt(
    slug: 'first-meeting',
    title: 'O que você se lembra?',
    isPaired: isPaired,
    selfId: 'me',
    partnerName: 'Marina',
    coupleId: 'couple-1',
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

  const own = QuestionAnswer(id: 'own', body: 'Minha resposta.');

  setUpAll(() => registerFallbackValue(thread()));

  setUp(() {
    repository = _MockQuestionsRepository();
    when(() => repository.getThread()).thenAnswer((_) async => thread());
    when(
      () => repository.saveAnswer(
        thread: any(named: 'thread'),
        body: any(named: 'body'),
      ),
    ).thenAnswer((_) async => const QuestionAnswer(id: 'new', body: 'Minha resposta.'));
  });

  QuestionsCubit build() => QuestionsCubit(repository: repository);

  test('an unanswered question opens the answer form', () async {
    final cubit = build();

    await cubit.load();

    expect(cubit.state.thread, isA<Success<QuestionThread>>());
    expect(cubit.state.view, QuestionsView.answer);
    expect(cubit.state.showsAnswerForm, isTrue);
  });

  test('an own answer without a partner answer waits privately', () async {
    when(() => repository.getThread())
        .thenAnswer((_) async => thread(own: own, partnerAnswered: true));
    final cubit = build();

    await cubit.load();

    expect(cubit.state.view, QuestionsView.waiting);
    expect(cubit.state.current?.canEdit, isTrue);
    expect(cubit.state.current?.isRevealed, isFalse);
  });

  test('both answers reveal together', () async {
    when(() => repository.getThread()).thenAnswer(
      (_) async => thread(
        own: own,
        partner: const QuestionAnswer(id: 'partner', body: 'A resposta dela.'),
      ),
    );
    final cubit = build();

    await cubit.load();

    expect(cubit.state.view, QuestionsView.revealed);
    expect(cubit.state.current?.partnerAnswer?.body, 'A resposta dela.');
  });

  test('saving keeps the answer and shows the quiet waiting state', () async {
    final cubit = build();
    await cubit.load();
    cubit.onDraftChanged('Minha resposta.');
    when(() => repository.getThread()).thenAnswer((_) async => thread(own: own));

    await cubit.save();

    expect(cubit.state.view, QuestionsView.waiting);
    expect(cubit.state.current?.ownAnswer?.body, 'Minha resposta.');
    expect(cubit.state.draft.value, isEmpty);
    expect(cubit.state.saveAction, isA<Success<void>>());
  });

  test('a save re-reads the thread so a partner answer that arrived reveals', () async {
    final cubit = build();
    await cubit.load();
    cubit.onDraftChanged('Minha resposta.');
    when(() => repository.getThread()).thenAnswer(
      (_) async => thread(
        own: own,
        partner: const QuestionAnswer(id: 'partner', body: 'A resposta dela.'),
      ),
    );

    await cubit.save();

    expect(cubit.state.view, QuestionsView.revealed);
    expect(cubit.state.draft.value, isEmpty);
    expect(cubit.state.isEditing, isFalse);
  });

  test('a save failure keeps the typed text and the form', () async {
    when(
      () => repository.saveAnswer(
        thread: any(named: 'thread'),
        body: any(named: 'body'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: networkErrorCode));
    final cubit = build();
    await cubit.load();
    cubit.onDraftChanged('Não quero perder isto');

    await cubit.save();

    expect(cubit.state.showsAnswerForm, isTrue);
    expect(cubit.state.draft.value, 'Não quero perder isto');
    expect(cubit.state.saveAction, isA<Initial>());
  });

  test('editing pre-fills the saved text and cancel restores the waiting state', () async {
    when(() => repository.getThread()).thenAnswer((_) async => thread(own: own));
    final cubit = build();
    await cubit.load();

    cubit.startEditing();

    expect(cubit.state.isEditing, isTrue);
    expect(cubit.state.showsAnswerForm, isTrue);
    expect(cubit.state.draft.value, 'Minha resposta.');

    cubit.cancelEditing();

    expect(cubit.state.isEditing, isFalse);
    expect(cubit.state.view, QuestionsView.waiting);
  });

  test('editing a revealed thread is not allowed', () async {
    when(() => repository.getThread()).thenAnswer(
      (_) async => thread(
        own: own,
        partner: const QuestionAnswer(id: 'partner', body: 'A resposta dela.'),
      ),
    );
    final cubit = build();
    await cubit.load();

    cubit.startEditing();

    expect(cubit.state.isEditing, isFalse);
    expect(cubit.state.showsAnswerForm, isFalse);
  });

  test('a blank answer is reported as a field error', () async {
    final cubit = build();
    await cubit.load();
    cubit.onDraftChanged('   ');

    await cubit.save();

    expect(cubit.state.draft.error, NonEmptyValidationError.empty);
    verifyNever(
      () => repository.saveAnswer(
        thread: any(named: 'thread'),
        body: any(named: 'body'),
      ),
    );
  });

  test('a solo question still opens the answer form', () async {
    when(() => repository.getThread()).thenAnswer((_) async => thread(isPaired: false));
    final cubit = build();

    await cubit.load();

    expect(cubit.state.current?.isSolo, isTrue);
    expect(cubit.state.showsAnswerForm, isTrue);
  });
}
