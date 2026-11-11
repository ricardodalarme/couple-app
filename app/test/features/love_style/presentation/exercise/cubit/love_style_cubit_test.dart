import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/love_style/data/models/love_pattern.dart';
import 'package:flutter_bloc_starter/features/love_style/data/repositories/love_style_repository.dart';
import 'package:flutter_bloc_starter/features/love_style/presentation/exercise/cubit/love_style_cubit.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockLoveStyleRepository() extends Mock implements LoveStyleRepository;

class _MockPairingRepository() extends Mock implements PairingRepository;

void main() {
  late LoveStyleRepository repository;
  late PairingRepository pairingRepository;

  setUpAll(() {
    registerFallbackValue(<String>[]);
  });

  setUp(() {
    repository = _MockLoveStyleRepository();
    pairingRepository = _MockPairingRepository();
    when(() => repository.getSavedRanked()).thenAnswer((_) async => null);
    when(() => repository.getSharedMessageId()).thenAnswer((_) async => null);
    when(() => repository.getManualEntry()).thenAnswer((_) async => null);
    when(() => repository.saveRanked(any())).thenAnswer((_) async {});
    when(() => repository.saveManualEntry(any())).thenAnswer((_) async {});
    when(() => repository.share(any())).thenAnswer((_) async => 'msg-1');
    when(() => repository.revokeShare(any())).thenAnswer((_) async {});
    when(() => pairingRepository.getPartner()).thenAnswer(
      (_) async => const Profile(id: 'p1', avatarKind: 'initial', displayName: 'Marina'),
    );
  });

  LoveStyleCubit build() =>
      LoveStyleCubit(repository: repository, pairingRepository: pairingRepository);

  Future<void> answerAll(LoveStyleCubit cubit, String pattern) async {
    for (var question = 0; question < loveStyleQuestionCount; question++) {
      cubit.select(pattern);
      await cubit.next();
    }
  }

  test('a saved result opens straight on the result screen', () async {
    when(() => repository.getSavedRanked())
        .thenAnswer((_) async => const ['touch', 'time', 'words', 'acts', 'gifts']);

    final cubit = build();
    await cubit.load();

    expect(cubit.state.isAnswering, isFalse);
    expect(cubit.state.savedResult?.topPattern, 'touch');
    expect(cubit.state.hasPartner, isTrue);
    expect(cubit.state.partnerName, 'Marina');
  });

  test('a stored share is hydrated so the revoke action survives a reload', () async {
    when(() => repository.getSavedRanked())
        .thenAnswer((_) async => const ['touch', 'time', 'words', 'acts', 'gifts']);
    when(() => repository.getSharedMessageId()).thenAnswer((_) async => 'msg-1');

    final cubit = build();
    await cubit.load();

    expect(cubit.state.isShared, isTrue);
    expect(cubit.state.sharedMessageId, 'msg-1');
  });

  test('a share hydrated on load can be revoked', () async {
    when(() => repository.getSavedRanked())
        .thenAnswer((_) async => const ['touch', 'time', 'words', 'acts', 'gifts']);
    when(() => repository.getSharedMessageId()).thenAnswer((_) async => 'msg-1');
    final cubit = build();
    await cubit.load();

    await cubit.revokeShare();

    verify(() => repository.revokeShare('msg-1')).called(1);
    expect(cubit.state.isShared, isFalse);
  });

  test('an existing manual entry is hydrated on load', () async {
    when(() => repository.getSavedRanked())
        .thenAnswer((_) async => const ['touch', 'time', 'words', 'acts', 'gifts']);
    when(() => repository.getManualEntry()).thenAnswer((_) async => 'Descrição salva.');

    final cubit = build();
    await cubit.load();

    expect(cubit.state.isInManual, isTrue);
  });

  test('finishing all answers ranks them and saves once', () async {
    final cubit = build();
    await cubit.load();
    expect(cubit.state.isAnswering, isTrue);

    await answerAll(cubit, 'acts');

    expect(cubit.state.isAnswering, isFalse);
    expect(cubit.state.savedResult?.topPattern, 'acts');
    verify(() => repository.saveRanked(any())).called(1);
  });

  test('a tie picks the canonical top', () async {
    final cubit = build();
    await cubit.load();
    final answers = ['time', 'words', 'acts', 'gifts', 'touch', 'time'];
    for (final (index, pattern) in answers.indexed) {
      cubit.select(pattern);
      if (index < loveStyleQuestionCount - 1) await cubit.next();
    }
    await cubit.next();

    final result = cubit.state.savedResult;
    expect(result?.topPattern, 'time');
    expect(result?.ranked, ['time', 'words', 'acts', 'gifts', 'touch']);
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

      return const ['gifts', 'time', 'words', 'acts', 'touch'];
    });

    final cubit = build();
    await cubit.load();
    expect(cubit.state.result, isA<Failure>());

    await cubit.load();

    expect(cubit.state.isAnswering, isFalse);
    expect(cubit.state.savedResult?.topPattern, 'gifts');
  });

  test('retaking replaces the saved ranking with the latest one', () async {
    final cubit = build();
    await cubit.load();
    await answerAll(cubit, 'time');

    await cubit.retake();
    expect(cubit.state.answers, isEmpty);
    await answerAll(cubit, 'touch');

    expect(cubit.state.savedResult?.topPattern, 'touch');
    final saved = verify(() => repository.saveRanked(captureAny())).captured.cast<List<String>>();
    expect(saved, hasLength(2));
    expect(saved.last, ['touch', 'time', 'words', 'acts', 'gifts']);
  });

  test('retaking a shared result revokes the old share before starting', () async {
    when(() => repository.getSavedRanked())
        .thenAnswer((_) async => const ['touch', 'time', 'words', 'acts', 'gifts']);
    when(() => repository.getSharedMessageId()).thenAnswer((_) async => 'msg-1');
    final cubit = build();
    await cubit.load();
    expect(cubit.state.isShared, isTrue);

    await cubit.retake();

    verify(() => repository.revokeShare('msg-1')).called(1);
    expect(cubit.state.isShared, isFalse);
    expect(cubit.state.isAnswering, isTrue);
    expect(cubit.state.answers, isEmpty);
  });

  test('a failed revoke keeps the old share so retake does not start', () async {
    when(() => repository.getSavedRanked())
        .thenAnswer((_) async => const ['touch', 'time', 'words', 'acts', 'gifts']);
    when(() => repository.getSharedMessageId()).thenAnswer((_) async => 'msg-1');
    when(() => repository.revokeShare(any()))
        .thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    await cubit.load();

    await cubit.retake();

    expect(cubit.state.isShared, isTrue);
    expect(cubit.state.isAnswering, isFalse);
  });

  test('a failed save keeps every answer on the exercise', () async {
    when(() => repository.saveRanked(any()))
        .thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    await cubit.load();

    await answerAll(cubit, 'words');

    expect(cubit.state.isAnswering, isTrue);
    expect(cubit.state.answers, hasLength(loveStyleQuestionCount));
    expect(cubit.state.answers.every((answer) => answer == 'words'), isTrue);
    expect(cubit.state.savedResult, isNull);
    expect(cubit.state.saveAction, isA<Initial>());
  });

  test('saving to the manual writes the description once', () async {
    final cubit = build();
    await cubit.load();
    await answerAll(cubit, 'gifts');

    await cubit.saveToManual('Uma descrição.');
    await cubit.saveToManual('Uma descrição.');

    expect(cubit.state.isInManual, isTrue);
    expect(cubit.state.manualAction, isA<Success<void>>());
    verify(() => repository.saveManualEntry('Uma descrição.')).called(1);
  });

  test('a failed manual save keeps the result on screen', () async {
    when(() => repository.saveManualEntry(any()))
        .thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    await cubit.load();
    await answerAll(cubit, 'gifts');

    await cubit.saveToManual('Uma descrição.');

    expect(cubit.state.savedResult?.topPattern, 'gifts');
    expect(cubit.state.isInManual, isFalse);
    expect(cubit.state.manualAction, isA<Initial>());
  });

  test('sharing is only offered with a partner and stores the message id', () async {
    final cubit = build();
    await cubit.load();
    await answerAll(cubit, 'words');
    clearInteractions(pairingRepository);

    await cubit.share('Eu me sinto querido(a) com palavras.');
    await cubit.share('Eu me sinto querido(a) com palavras.');

    expect(cubit.state.isShared, isTrue);
    expect(cubit.state.sharedMessageId, 'msg-1');
    verify(() => repository.share('Eu me sinto querido(a) com palavras.')).called(1);
    verifyNever(() => pairingRepository.getPartner());
  });

  test('a paired person with no display name can still share', () async {
    when(() => pairingRepository.getPartner())
        .thenAnswer((_) async => const Profile(id: 'p1', avatarKind: 'initial'));
    final cubit = build();
    await cubit.load();
    await answerAll(cubit, 'touch');

    expect(cubit.state.hasPartner, isTrue);
    expect(cubit.state.partnerName, isNull);

    await cubit.share('Eu me sinto querido(a) com toque.');

    expect(cubit.state.isShared, isTrue);
    verify(() => repository.share(any())).called(1);
  });

  test('a pairing failure is shown instead of looking unpaired', () async {
    when(() => pairingRepository.getPartner())
        .thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    await cubit.load();

    expect(cubit.state.hasPartner, isFalse);
    expect(cubit.state.pairingFailed, isTrue);
  });

  test('an unpaired person gets a result without sharing', () async {
    when(() => pairingRepository.getPartner()).thenAnswer((_) async => null);
    final cubit = build();
    await cubit.load();
    await answerAll(cubit, 'touch');

    await cubit.share('Eu me sinto querido(a) com toque.');

    expect(cubit.state.hasPartner, isFalse);
    expect(cubit.state.isShared, isFalse);
    verifyNever(() => repository.share(any()));
  });

  test('a failed share keeps the result and can be tried again', () async {
    when(() => repository.share(any())).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    await cubit.load();
    await answerAll(cubit, 'acts');

    await cubit.share('Eu me sinto querido(a) com ajuda.');

    expect(cubit.state.savedResult?.topPattern, 'acts');
    expect(cubit.state.isShared, isFalse);
    expect(cubit.state.shareAction, isA<Initial>());
  });

  test('revoking deletes the shared note and clears it', () async {
    final cubit = build();
    await cubit.load();
    await answerAll(cubit, 'acts');
    await cubit.share('Eu me sinto querido(a) com ajuda.');

    await cubit.revokeShare();

    expect(cubit.state.isShared, isFalse);
    expect(cubit.state.revokeAction, isA<Success<void>>());
    verify(() => repository.revokeShare('msg-1')).called(1);
    verify(() => repository.share(any())).called(1);
  });

  test('a failed revoke keeps the shared state so it can be tried again', () async {
    when(() => repository.revokeShare(any()))
        .thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    await cubit.load();
    await answerAll(cubit, 'acts');
    await cubit.share('Eu me sinto querido(a) com ajuda.');

    await cubit.revokeShare();

    expect(cubit.state.isShared, isTrue);
    expect(cubit.state.sharedMessageId, 'msg-1');
    expect(cubit.state.revokeAction, isA<Initial>());
  });
}
