import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/guides/data/data_sources/local/guide_session.dart';
import 'package:flutter_bloc_starter/features/guides/data/models/guide.dart';
import 'package:flutter_bloc_starter/features/guides/data/models/guide_catalogue.dart';
import 'package:flutter_bloc_starter/features/guides/data/models/guide_progress.dart';
import 'package:flutter_bloc_starter/features/guides/data/repositories/guides_repository.dart';
import 'package:flutter_bloc_starter/features/guides/presentation/viewer/cubit/guide_cubit.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockGuidesRepository() extends Mock implements GuidesRepository;

class _MockPlusRepository() extends Mock implements PlusRepository;

void main() {
  late GuidesRepository repository;
  late PlusRepository plusRepository;

  final moneyDefinition = guideCatalogue.firstWhere((guide) => guide.slug == 'money');
  final money = moneyDefinition.localized('pt');
  final intimacy = guideCatalogue.firstWhere((guide) => guide.slug == 'intimacy').localized('pt');
  final plusGuide = guideCatalogue.firstWhere((guide) => guide.isPlusOnly).localized('pt');

  setUpAll(() {
    LocaleSettings.setLocaleSync(AppLocale.pt);
    registerFallbackValue('');
    registerFallbackValue(
      GuideProgress(
        stepIndex: 0,
        answers: const [],
        savedAt: DateTime(2026, 11, 11),
        contentVersion: 'abc12345',
      ),
    );
  });

  setUp(() {
    repository = _MockGuidesRepository();
    plusRepository = _MockPlusRepository();
    when(() => plusRepository.getPlus()).thenAnswer((_) async => const PlusState(hasPlus: true));
    when(() => repository.currentUserId).thenReturn('user-a');
    when(() => repository.getGuide(any(), languageCode: any(named: 'languageCode')))
        .thenAnswer((_) async => money);
    when(() => repository.getProgress(any())).thenAnswer((_) async => null);
    when(() => repository.saveProgress(any(), any())).thenAnswer((_) async {});
    when(
      () => repository.savePrep(
        prepId: any(named: 'prepId'),
        guide: any(named: 'guide'),
        topic: any(named: 'topic'),
        notes: any(named: 'notes'),
        draft: any(named: 'draft'),
      ),
    ).thenAnswer((_) async => 'prep-1');
  });

  GuideCubit build({GuideSession? session}) => GuideCubit(
    repository: repository,
    plusRepository: plusRepository,
    session: session ?? GuideSession(),
  );

  Future<GuideCubit> started({GuideSession? session}) async {
    final cubit = build(session: session);
    await cubit.start('money');

    return cubit;
  }

  test('a guide opens on the first step with one blank answer per prompt', () async {
    final cubit = await started();
    addTearDown(cubit.close);

    expect(cubit.state.currentGuide, money);
    expect(cubit.state.stepIndex, 0);
    expect(cubit.state.answers, ['', '', '', '']);
    expect(cubit.state.stepIndex, 0);
    expect(cubit.state.showSensitiveGate, isFalse);
  });

  test('the position and answers are saved as the person moves', () async {
    final cubit = await started();
    addTearDown(cubit.close);

    await cubit.onAnswerChanged('Uma resposta');
    await cubit.next();

    final progress =
        verify(() => repository.saveProgress('money', captureAny())).captured.last as GuideProgress;
    expect(cubit.state.stepIndex, 1);
    expect(progress.stepIndex, 1);
    expect(progress.answers.first, 'Uma resposta');

    await cubit.back();

    expect(cubit.state.stepIndex, 0);
    expect(cubit.state.currentAnswer, 'Uma resposta');
  });

  test('finishing saves the joined answers with no prep id the first time', () async {
    final cubit = await started();
    addTearDown(cubit.close);
    for (var step = 0; step < money.stepCount; step++) {
      await cubit.onAnswerChanged('Resposta $step');
      await cubit.next();
    }

    expect(cubit.state.isFinished, isTrue);
    expect(cubit.state.prepId, 'prep-1');
    verify(
      () => repository.savePrep(
        prepId: null,
        guide: 'money',
        topic: 'Dinheiro',
        notes: 'Resposta 0\n\nResposta 1\n\nResposta 2\n\nResposta 3',
        draft: 'Resposta 3',
      ),
    ).called(1);
  });

  test('finishing again updates the saved preparation with its prep id', () async {
    when(() => repository.getProgress('money')).thenAnswer(
      (_) async => GuideProgress(
        stepIndex: 3,
        answers: const ['um', 'dois', 'três', 'quatro'],
        savedAt: DateTime(2026, 3, 10, 12),
        contentVersion: money.contentVersion,
        prepId: 'prep-1',
      ),
    );
    final cubit = await started();
    addTearDown(cubit.close);

    await cubit.next();

    expect(cubit.state.isFinished, isTrue);
    verify(
      () => repository.savePrep(
        prepId: 'prep-1',
        guide: 'money',
        topic: 'Dinheiro',
        notes: 'um\n\ndois\n\ntrês\n\nquatro',
        draft: 'quatro',
      ),
    ).called(1);
  });

  test('a failed save keeps every answer on the step', () async {
    when(
      () => repository.savePrep(
        prepId: any(named: 'prepId'),
        guide: any(named: 'guide'),
        topic: any(named: 'topic'),
        notes: any(named: 'notes'),
        draft: any(named: 'draft'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = await started();
    addTearDown(cubit.close);
    for (var step = 0; step < money.stepCount; step++) {
      await cubit.onAnswerChanged('Resposta $step');
      await cubit.next();
    }

    expect(cubit.state.isFinished, isFalse);
    expect(cubit.state.answers, ['Resposta 0', 'Resposta 1', 'Resposta 2', 'Resposta 3']);
    expect(cubit.state.saveAction, isA<Initial>());
  });

  test('a sensitive guide asks for the gate once per app session', () async {
    when(() => repository.getGuide(any(), languageCode: any(named: 'languageCode')))
        .thenAnswer((_) async => intimacy);
    final session = GuideSession();

    final first = await started(session: session);
    addTearDown(first.close);
    expect(first.state.showSensitiveGate, isTrue);

    first.hideSensitiveGate();
    final second = await started(session: session);
    addTearDown(second.close);

    expect(second.state.showSensitiveGate, isFalse);
  });

  test('changed guide content discards the saved position and answers', () async {
    final reordered = GuideDefinition(
      slug: moneyDefinition.slug,
      guideType: moneyDefinition.guideType,
      title: moneyDefinition.title,
      description: moneyDefinition.description,
      prompts: moneyDefinition.prompts.reversed.toList(),
    ).localized('pt');
    when(() => repository.getGuide(any(), languageCode: any(named: 'languageCode')))
        .thenAnswer((_) async => reordered);
    when(() => repository.getProgress('money')).thenAnswer(
      (_) async => GuideProgress(
        stepIndex: 3,
        answers: const ['um', 'dois', 'três', 'quatro'],
        savedAt: DateTime(2026, 3, 10, 12),
        contentVersion: money.contentVersion,
        prepId: 'prep-1',
      ),
    );

    final cubit = await started();
    addTearDown(cubit.close);

    expect(cubit.state.stepIndex, 0);
    expect(cubit.state.answers, ['', '', '', '']);
    expect(cubit.state.prepId, isNull);
  });

  test('a local save failure after the server save still finishes', () async {
    when(() => repository.saveProgress(any(), any()))
        .thenThrow(const LocalizedException(l10nKey: 'other'));
    final cubit = await started();
    addTearDown(cubit.close);
    for (var step = 0; step < money.stepCount; step++) {
      await cubit.onAnswerChanged('Resposta $step');
      await cubit.next();
    }

    expect(cubit.state.isFinished, isTrue);
    expect(cubit.state.saveAction, isA<Success<void>>());
  });

  test('a local save failure does not escape while moving through steps', () async {
    when(() => repository.saveProgress(any(), any()))
        .thenThrow(const LocalizedException(l10nKey: 'other'));
    final cubit = await started();
    addTearDown(cubit.close);

    await cubit.onAnswerChanged('Uma resposta');
    await cubit.next();
    await cubit.back();

    expect(cubit.state.stepIndex, 0);
    expect(cubit.state.currentAnswer, 'Uma resposta');
  });

  test('a sensitive guide asks for the gate again for another user', () async {
    when(() => repository.getGuide(any(), languageCode: any(named: 'languageCode')))
        .thenAnswer((_) async => intimacy);
    final session = GuideSession();

    final first = await started(session: session);
    addTearDown(first.close);
    expect(first.state.showSensitiveGate, isTrue);
    first.hideSensitiveGate();

    final sameUser = await started(session: session);
    addTearDown(sameUser.close);
    expect(sameUser.state.showSensitiveGate, isFalse);

    when(() => repository.currentUserId).thenReturn('user-b');
    final otherUser = await started(session: session);
    addTearDown(otherUser.close);

    expect(otherUser.state.showSensitiveGate, isTrue);
  });

  test('a Plus guide stays locked for a person without Plus', () async {
    when(() => plusRepository.getPlus()).thenAnswer((_) async => const PlusState(hasPlus: false));
    when(() => repository.getGuide(any(), languageCode: any(named: 'languageCode')))
        .thenAnswer((_) async => plusGuide);

    final cubit = await started();
    addTearDown(cubit.close);

    expect(cubit.state.isLocked, isTrue);
    expect(cubit.state.currentGuide, plusGuide);
    expect(cubit.state.answers, isEmpty);
    verifyNever(() => repository.getProgress(any()));
  });

  test('a Plus guide opens for a person with Plus', () async {
    when(() => repository.getGuide(any(), languageCode: any(named: 'languageCode')))
        .thenAnswer((_) async => plusGuide);

    final cubit = await started();
    addTearDown(cubit.close);

    expect(cubit.state.isLocked, isFalse);
    expect(cubit.state.currentGuide, plusGuide);
    expect(cubit.state.answers, hasLength(plusGuide.stepCount));
  });

  test('an unreadable plan keeps a Plus guide locked', () async {
    when(() => plusRepository.getPlus()).thenThrow(Exception('offline'));
    when(() => repository.getGuide(any(), languageCode: any(named: 'languageCode')))
        .thenAnswer((_) async => plusGuide);

    final cubit = await started();
    addTearDown(cubit.close);

    expect(cubit.state.isLocked, isTrue);
  });
}
