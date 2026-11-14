import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/fight_style/data/models/reaction_pattern.dart';
import 'package:flutter_bloc_starter/features/fight_style/data/repositories/fight_style_repository.dart';
import 'package:flutter_bloc_starter/features/fight_style/presentation/exercise/cubit/fight_style_cubit.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/avatar_kind.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockFightStyleRepository() extends Mock implements FightStyleRepository;

class _MockPairingRepository() extends Mock implements PairingRepository;

void main() {
  late FightStyleRepository repository;
  late PairingRepository pairingRepository;

  setUpAll(() {
    registerFallbackValue(<String>[]);
  });

  setUp(() {
    repository = _MockFightStyleRepository();
    pairingRepository = _MockPairingRepository();
    when(() => repository.getSavedRanked()).thenAnswer((_) async => null);
    when(() => repository.saveRanked(any())).thenAnswer((_) async {});
    when(() => repository.addRepairTool(any())).thenAnswer((_) async {});
    when(() => pairingRepository.getPartner()).thenAnswer(
      (_) async => const Profile(id: 'p1', avatarKind: AvatarKind.initials, displayName: 'Marina'),
    );
  });

  FightStyleCubit build() =>
      FightStyleCubit(repository: repository, pairingRepository: pairingRepository);

  Future<void> answerAll(FightStyleCubit cubit, String pattern) async {
    for (var question = 0; question < fightStyleQuestionCount; question++) {
      cubit.select(pattern);
      await cubit.next();
    }
  }

  test('a saved result opens straight on the result screen', () async {
    when(() => repository.getSavedRanked()).thenAnswer((_) async => const ['repair', 'pursue']);

    final cubit = build();
    await cubit.load();

    expect(cubit.state.isAnswering, isFalse);
    expect(cubit.state.savedResult?.topPattern, 'repair');
    expect(cubit.state.savedResult?.partnerName, 'Marina');
  });

  test('finishing all answers ranks them and saves once', () async {
    final cubit = build();
    await cubit.load();
    expect(cubit.state.isAnswering, isTrue);

    await answerAll(cubit, 'pursue');

    expect(cubit.state.isAnswering, isFalse);
    expect(cubit.state.savedResult?.topPattern, 'pursue');
    verify(() => repository.saveRanked(any())).called(1);
  });

  test('a tie picks the canonical top', () async {
    final cubit = build();
    await cubit.load();
    final answers = ['pursue', 'withdraw', 'pursue', 'withdraw', 'repair', 'avoid'];
    for (final (index, pattern) in answers.indexed) {
      cubit.select(pattern);
      if (index < fightStyleQuestionCount - 1) await cubit.next();
    }
    await cubit.next();

    final result = cubit.state.savedResult;
    expect(result?.topPattern, 'pursue');
    expect(result?.ranked, ['pursue', 'withdraw', 'repair', 'avoid']);
  });

  test('a failed saved read shows a failure, not a fresh exercise', () async {
    when(() => repository.getSavedRanked()).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));

    final cubit = build();
    await cubit.load();

    expect(cubit.state.result, isA<Failure>());
    expect(cubit.state.isAnswering, isFalse);
    expect(cubit.state.savedResult, isNull);
  });

  test('retrying after a failed read opens the saved result', () async {
    var reads = 0;
    when(() => repository.getSavedRanked()).thenAnswer((_) async {
      reads++;
      if (reads == 1) throw const LocalizedException(l10nKey: 'NETWORK');

      return const ['repair', 'pursue', 'withdraw', 'avoid'];
    });

    final cubit = build();
    await cubit.load();
    expect(cubit.state.result, isA<Failure>());

    await cubit.load();

    expect(cubit.state.isAnswering, isFalse);
    expect(cubit.state.savedResult?.topPattern, 'repair');
  });

  test('an empty stored ranking starts the exercise fresh', () async {
    when(() => repository.getSavedRanked()).thenAnswer((_) async => const []);

    final cubit = build();
    await cubit.load();

    expect(cubit.state.isAnswering, isTrue);
    expect(cubit.state.savedResult, isNull);
  });

  test('retaking replaces the saved ranking with the latest one', () async {
    final cubit = build();
    await cubit.load();
    await answerAll(cubit, 'pursue');

    cubit.retake();
    expect(cubit.state.answers, isEmpty);
    await answerAll(cubit, 'withdraw');

    expect(cubit.state.savedResult?.topPattern, 'withdraw');
    final saved = verify(() => repository.saveRanked(captureAny())).captured.cast<List<String>>();
    expect(saved, hasLength(2));
    expect(saved.last, ['withdraw', 'pursue', 'repair', 'avoid']);
  });

  test('a failed save keeps every answer on the exercise', () async {
    when(() => repository.saveRanked(any()))
        .thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    await cubit.load();

    await answerAll(cubit, 'avoid');

    expect(cubit.state.isAnswering, isTrue);
    expect(cubit.state.answers, hasLength(fightStyleQuestionCount));
    expect(cubit.state.answers.every((answer) => answer == 'avoid'), isTrue);
    expect(cubit.state.savedResult, isNull);
  });

  test('adding a repair tool is private and never reads the partner again', () async {
    final cubit = build();
    await cubit.load();
    await answerAll(cubit, 'repair');
    clearInteractions(pairingRepository);

    await cubit.addRepairTool('Você tende a procurar um jeito de consertar.');

    expect(cubit.state.isInTools, isTrue);
    verify(() => repository.addRepairTool('Você tende a procurar um jeito de consertar.'))
        .called(1);
    verifyNever(() => pairingRepository.getPartner());
  });

  test('adding twice does not write a second tool', () async {
    final cubit = build();
    await cubit.load();
    await answerAll(cubit, 'repair');

    await cubit.addRepairTool('Uma descrição.');
    await cubit.addRepairTool('Uma descrição.');

    verify(() => repository.addRepairTool(any())).called(1);
  });

  test('an unpaired person gets a result without a partner line', () async {
    when(() => pairingRepository.getPartner()).thenAnswer((_) async => null);
    final cubit = build();
    await cubit.load();
    await answerAll(cubit, 'avoid');

    expect(cubit.state.savedResult?.partnerName, isNull);
    expect(cubit.state.savedResult?.topPattern, 'avoid');
  });
}
