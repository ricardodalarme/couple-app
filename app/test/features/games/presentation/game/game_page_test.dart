import 'package:flutter_bloc_starter/features/games/presentation/game/game_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_helpers/pump_app.dart';

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  testWidgets('/games/anything shows an honest not-found state', (tester) async {
    await tester.pumpApp(const GamePage(game: 'anything'));
    await tester.pump();

    expect(find.text('Este jogo não existe'), findsOneWidget);
    expect(find.text('Voltar'), findsOneWidget);
  });
}
