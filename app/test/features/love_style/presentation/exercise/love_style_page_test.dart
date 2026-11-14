import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/love_style/data/repositories/love_style_repository.dart';
import 'package:flutter_bloc_starter/features/love_style/presentation/exercise/cubit/love_style_cubit.dart';
import 'package:flutter_bloc_starter/features/love_style/presentation/exercise/love_style_page.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/avatar_kind.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockLoveStyleRepository() extends Mock implements LoveStyleRepository;

class _MockPairingRepository() extends Mock implements PairingRepository;

void main() {
  late LoveStyleRepository repository;
  late PairingRepository pairingRepository;

  const description =
      'Você se sente querido(a) quando um abraço, uma mão dada ou um carinho dizem o que as palavras não dizem.';

  setUpAll(() {
    LocaleSettings.setLocaleSync(AppLocale.pt);
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
      (_) async => const Profile(id: 'p1', avatarKind: AvatarKind.initials, displayName: 'Marina'),
    );
  });

  Future<LoveStyleCubit> completedCubit() async {
    final cubit = LoveStyleCubit(repository: repository, pairingRepository: pairingRepository);
    await cubit.load();
    for (var question = 0; question < 6; question++) {
      cubit.select('touch');
      await cubit.next();
    }

    return cubit;
  }

  testWidgets('the result reads as a description without a numbered label list', (tester) async {
    final cubit = await completedCubit();
    addTearDown(cubit.close);
    expect(cubit.state.partnerName, 'Marina');

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const LoveStylePage()));
    await tester.pump();

    expect(find.text(description), findsOneWidget);
    expect(find.text('O QUE MAIS COMBINA COM VOCÊ'), findsOneWidget);
    expect(find.text('Na sua ordem'), findsNothing);
    expect(find.textContaining('1.'), findsNothing);
    expect(find.text('Salvar no Meu manual'), findsOneWidget);
    expect(find.text('Mostrar para Marina'), findsOneWidget);
  });

  testWidgets('saving to the manual sends no haptic or notification platform call', (tester) async {
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

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const LoveStylePage()));
    await tester.pump();
    await tester.tap(find.text('Salvar no Meu manual'));
    await tester.pump();
    await tester.pump();

    expect(find.text('Salvo no Meu manual.'), findsOneWidget);
    expect(find.text('Salvo no Meu manual'), findsOneWidget);
    expect(
      calls.where(
        (call) =>
            call.method == 'HapticFeedback.vibrate' ||
            call.method.toLowerCase().contains('notification'),
      ),
      isEmpty,
    );
  });

  testWidgets('sharing shows the revoke action and revoking hides it again', (tester) async {
    final cubit = await completedCubit();
    addTearDown(cubit.close);

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const LoveStylePage()));
    await tester.pump();
    await tester.tap(find.text('Mostrar para Marina'));
    await tester.pump();
    await tester.pump();

    expect(find.text('Aparece no widget dele(a) se ele(a) permitir recados.'), findsOneWidget);
    expect(find.text('Tirar do widget dele(a)'), findsOneWidget);
    expect(find.text('Mostrar para Marina'), findsNothing);

    await tester.tap(find.text('Tirar do widget dele(a)'));
    await tester.pump();
    await tester.pump();

    expect(find.text('Não aparece mais no widget dele(a).'), findsOneWidget);
    expect(find.text('Mostrar para Marina'), findsOneWidget);
  });

  testWidgets('a paired person with no display name can still share', (tester) async {
    when(() => pairingRepository.getPartner())
        .thenAnswer((_) async => const Profile(id: 'p1', avatarKind: AvatarKind.initials));
    final cubit = await completedCubit();
    addTearDown(cubit.close);

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const LoveStylePage()));
    await tester.pump();

    expect(find.text('Mostrar para seu par'), findsOneWidget);
    expect(
      find.text('Quando vocês estiverem conectados, você pode mostrar isso no widget do seu par.'),
      findsNothing,
    );
  });

  testWidgets('an unpaired person sees an honest note instead of the share action', (tester) async {
    when(() => pairingRepository.getPartner()).thenAnswer((_) async => null);
    final cubit = await completedCubit();
    addTearDown(cubit.close);

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const LoveStylePage()));
    await tester.pump();

    expect(
      find.text('Quando vocês estiverem conectados, você pode mostrar isso no widget do seu par.'),
      findsOneWidget,
    );
    expect(find.text('Mostrar para Marina'), findsNothing);
  });

  testWidgets('a pairing failure offers a retry instead of looking unpaired', (tester) async {
    when(() => pairingRepository.getPartner())
        .thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = await completedCubit();
    addTearDown(cubit.close);

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const LoveStylePage()));
    await tester.pump();

    expect(find.text('Não deu para verificar seu par agora.'), findsOneWidget);
    expect(find.text('Tentar de novo'), findsOneWidget);
    expect(
      find.text('Quando vocês estiverem conectados, você pode mostrar isso no widget do seu par.'),
      findsNothing,
    );
  });

  testWidgets('a failed read shows a retry instead of a new exercise', (tester) async {
    when(() => repository.getSavedRanked()).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = LoveStyleCubit(repository: repository, pairingRepository: pairingRepository);
    addTearDown(cubit.close);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const LoveStylePage()));
    await tester.pump();

    expect(find.text('Não deu para carregar'), findsOneWidget);
    expect(find.text('Tentar novamente'), findsOneWidget);
    expect(find.text('Próxima'), findsNothing);
  });
}
