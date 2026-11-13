import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_item.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_play.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_session.dart';
import 'package:flutter_bloc_starter/features/games/data/repositories/games_repository.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/cubit/game_cubit.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_waiting_view.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../test_helpers/pump_app.dart';

class _MockGamesRepository() extends Mock implements GamesRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  setUpAll(() {
    registerFallbackValue(GameKind.meOrYou);
    registerFallbackValue(const GamePlay(kind: GameKind.meOrYou, selfId: 'me'));
  });

  testWidgets('checking the invitation says the partner has not joined yet', (tester) async {
    final repository = _MockGamesRepository();
    final profile = _MockProfileRepository();
    final waiting = GamePlay(
      kind: GameKind.meOrYou,
      selfId: 'me',
      partnerName: 'Bia',
      session: GameSession(
        id: 's1',
        game: GameKind.meOrYou,
        status: GameStatus.invited,
        invitedBy: 'me',
        itemSlugs: const ['a'],
        createdAt: DateTime.now(),
      ),
      items: const [GameItem(slug: 'a', title: 'A?')],
    );
    when(profile.getMySettings)
        .thenAnswer((_) async => const AccountSettings(theme: AppThemeVariant.rose));
    when(
      () => repository.getPlay(
        kind: any(named: 'kind'),
        locale: any(named: 'locale'),
        now: any(named: 'now'),
      ),
    ).thenAnswer((_) async => waiting);

    final cubit = GameCubit(repository: repository, profileRepository: profile);
    addTearDown(cubit.close);
    await cubit.load(GameKind.meOrYou);

    await tester.pumpApp(
      BlocProvider.value(
        value: cubit,
        child: GameWaitingView(play: waiting),
      ),
    );
    await tester.pump();

    await tester.tap(find.text('Ver se já entrou'));
    await tester.pump();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Ainda não entrou. O convite continua aqui.'), findsOneWidget);
  });
}
