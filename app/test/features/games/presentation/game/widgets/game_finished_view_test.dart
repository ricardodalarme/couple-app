import 'package:flutter_bloc_starter/features/games/data/models/game_item.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_play.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_finished_view.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../test_helpers/pump_app.dart';

void main() {
  setUp(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  testWidgets('a pick result reads as a sentence instead of repeating the label', (tester) async {
    const play = GamePlay(
      kind: GameKind.meOrYou,
      selfId: 'me',
      partnerName: 'Bia',
      items: [GameItem(slug: 'a', title: 'Quem é mais organizado?')],
      own: {0: pickSelf},
      partner: {0: pickSelf},
    );

    await tester.pumpApp(const GameFinishedView(play: play));
    await tester.pumpAndSettle();

    expect(find.text('Você escolheu: Você'), findsOneWidget);
    expect(find.text('Bia escolheu: Bia'), findsOneWidget);
    expect(find.text('Você'), findsNothing);
  });
}
