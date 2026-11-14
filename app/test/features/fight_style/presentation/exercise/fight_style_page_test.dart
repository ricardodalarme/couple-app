import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/fight_style/data/repositories/fight_style_repository.dart';
import 'package:flutter_bloc_starter/features/fight_style/presentation/exercise/cubit/fight_style_cubit.dart';
import 'package:flutter_bloc_starter/features/fight_style/presentation/exercise/fight_style_page.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/avatar_kind.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockFightStyleRepository() extends Mock implements FightStyleRepository;

class _MockPairingRepository() extends Mock implements PairingRepository;

void main() {
  late FightStyleRepository repository;
  late PairingRepository pairingRepository;

  const description = 'Você tende a se afastar primeiro e voltar depois.';

  setUpAll(() {
    LocaleSettings.setLocaleSync(AppLocale.pt);
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

  Future<FightStyleCubit> completedCubit() async {
    final cubit = FightStyleCubit(repository: repository, pairingRepository: pairingRepository);
    await cubit.load();
    for (var question = 0; question < 6; question++) {
      cubit.select('withdraw');
      await cubit.next();
    }

    return cubit;
  }

  testWidgets('the result reads as a description with the partner name when paired', (
    tester,
  ) async {
    final cubit = await completedCubit();
    addTearDown(cubit.close);
    expect(cubit.state.savedResult?.partnerName, 'Marina');

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const FightStylePage()));
    await tester.pump();

    expect(find.text(description), findsOneWidget);
    expect(find.text('SEU PADRÃO'), findsOneWidget);
    expect(find.textContaining('Marina'), findsOneWidget);
    expect(find.text('Adicionar às minhas ferramentas de reparo'), findsOneWidget);
    expect(find.text('Guardar só para mim'), findsOneWidget);
  });

  testWidgets('adding to repair tools sends no haptic or notification platform call', (
    tester,
  ) async {
    final cubit = await completedCubit();
    addTearDown(cubit.close);
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

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const FightStylePage()));
    await tester.pump();
    await tester.tap(find.text('Adicionar às minhas ferramentas de reparo'));
    await tester.pump();
    await tester.pump();

    expect(find.text('Adicionado às suas ferramentas de reparo.'), findsOneWidget);
    expect(
      calls.where(
        (call) =>
            call.method == 'HapticFeedback.vibrate' ||
            call.method.toLowerCase().contains('notification'),
      ),
      isEmpty,
    );
  });

  testWidgets('a failed read shows a retry instead of a new exercise', (tester) async {
    when(() => repository.getSavedRanked()).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = FightStyleCubit(repository: repository, pairingRepository: pairingRepository);
    addTearDown(cubit.close);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const FightStylePage()));
    await tester.pump();

    expect(find.text('Não deu para carregar'), findsOneWidget);
    expect(find.text('Tentar novamente'), findsOneWidget);
    expect(find.text('Continuar'), findsNothing);
  });

  testWidgets('retrying after a failed read opens the saved result', (tester) async {
    var reads = 0;
    when(() => repository.getSavedRanked()).thenAnswer((_) async {
      reads++;
      if (reads == 1) throw const LocalizedException(l10nKey: 'NETWORK');

      return const ['withdraw', 'repair', 'pursue', 'avoid'];
    });
    final cubit = FightStyleCubit(repository: repository, pairingRepository: pairingRepository);
    addTearDown(cubit.close);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const FightStylePage()));
    await tester.pump();
    await tester.tap(find.text('Tentar novamente'));
    await tester.pump();
    await tester.pump();

    expect(find.text(description), findsOneWidget);
    expect(find.text('Não deu para carregar'), findsNothing);
  });

  testWidgets('a failed answer save keeps the questions on screen', (tester) async {
    when(() => repository.saveRanked(any()))
        .thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = FightStyleCubit(repository: repository, pairingRepository: pairingRepository);
    addTearDown(cubit.close);
    await cubit.load();
    for (var question = 0; question < 5; question++) {
      cubit.select('withdraw');
      await cubit.next();
    }
    await tester.pumpApp(BlocProvider.value(value: cubit, child: const FightStylePage()));
    await tester.pump();

    cubit.select('withdraw');
    await tester.pump();
    await tester.tap(find.text('Ver resultado'));
    await tester.pump();
    await tester.pump();

    expect(cubit.state.isAnswering, isTrue);
    expect(cubit.state.answers, hasLength(6));
    expect(find.text('Ver resultado'), findsOneWidget);
  });
}
