import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/checkin/data/repositories/checkin_repository.dart';
import 'package:flutter_bloc_starter/features/guides/data/data_sources/local/guides_local_data_source.dart';
import 'package:flutter_bloc_starter/features/guides/data/data_sources/remote/guides_data_source.dart';
import 'package:flutter_bloc_starter/features/guides/data/repositories/guides_repository.dart';
import 'package:flutter_bloc_starter/features/guides/presentation/hub/cubit/guides_cubit.dart';
import 'package:flutter_bloc_starter/features/guides/presentation/hub/guides_page.dart';
import 'package:flutter_bloc_starter/features/lists/data/repositories/lists_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/questions/data/models/question_thread.dart';
import 'package:flutter_bloc_starter/features/questions/data/repositories/questions_repository.dart';
import 'package:flutter_bloc_starter/features/together/presentation/together/cubit/together_cubit.dart';
import 'package:flutter_bloc_starter/features/together/presentation/together/together_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockGuidesDataSource() extends Mock implements GuidesDataSource;

class _MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

class _MockGuidesLocalDataSource() extends Mock implements GuidesLocalDataSource;

class _MockPlusRepository() extends Mock implements PlusRepository;

class _MockPairingRepository() extends Mock implements PairingRepository;

class _MockCheckinRepository() extends Mock implements CheckinRepository;

class _MockListsRepository() extends Mock implements ListsRepository;

class _MockQuestionsRepository() extends Mock implements QuestionsRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

void main() {
  late GuidesCubit guidesCubit;

  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  setUp(() async {
    final plusRepository = _MockPlusRepository();
    when(plusRepository.getPlus).thenAnswer((_) async => const PlusState(hasPlus: false));
    guidesCubit = GuidesCubit(
      repository: GuidesRepository(
        dataSource: _MockGuidesDataSource(),
        localDataSource: _MockGuidesLocalDataSource(),
        authenticationRepository: _MockAuthenticationRepository(),
      ),
      plusRepository: plusRepository,
    );
    await guidesCubit.load();
  });

  tearDown(() => guidesCubit.close());

  testWidgets(
    'the hub lists the free guides and locks the Plus ones with their step count and no score',
    (tester) async {
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

      await tester.pumpApp(BlocProvider.value(value: guidesCubit, child: const GuidesPage()));
      await tester.pump();

      for (final title in ['Transição', 'Dinheiro', 'Família', 'Tarefas', 'Planos', 'Intimidade']) {
        expect(find.text(title), findsOneWidget);
      }
      expect(find.text('4 PASSOS'), findsNWidgets(10));
      expect(find.text('Sonhos a dois'), findsOneWidget);
      expect(find.text('O que importa para nós'), findsOneWidget);
      expect(find.textContaining('pontuação'), findsNothing);
      expect(
        calls.where(
          (call) =>
              call.method == 'HapticFeedback.vibrate' ||
              call.method.toLowerCase().contains('notification'),
        ),
        isEmpty,
      );
    },
  );

  testWidgets('a solo person sees the conversation entry on the together hub', (tester) async {
    final pairingRepository = _MockPairingRepository();
    final checkinRepository = _MockCheckinRepository();
    final listsRepository = _MockListsRepository();
    final questionsRepository = _MockQuestionsRepository();
    final profileRepository = _MockProfileRepository();
    when(() => profileRepository.onChanged).thenAnswer((_) => const Stream<void>.empty());
    when(profileRepository.getMySettings).thenThrow(Exception('none'));
    when(pairingRepository.getPartner).thenAnswer((_) async => null);
    when(checkinRepository.isCurrentWeekDismissed).thenAnswer((_) async => false);
    when(listsRepository.getLists).thenAnswer((_) async => []);
    when(questionsRepository.getPrompt).thenAnswer(
      (_) async => const QuestionPrompt(
        slug: 'small-dream',
        title: 'Pergunta do dia',
        isPaired: false,
        selfId: 'me',
      ),
    );
    final cubit = TogetherCubit(
      pairingRepository: pairingRepository,
      checkinRepository: checkinRepository,
      listsRepository: listsRepository,
      questionsRepository: questionsRepository,
      profileRepository: profileRepository,
    );
    addTearDown(cubit.close);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const TogetherPage()));
    await tester.pump();

    expect(find.text('Conversas difíceis'), findsOneWidget);
    expect(find.text('CONVERSAS'), findsNothing);
  });
}
