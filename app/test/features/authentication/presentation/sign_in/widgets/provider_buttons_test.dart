import 'package:flutter_bloc_starter/features/authentication/presentation/sign_in/widgets/provider_buttons.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../test_helpers/pump_app.dart';

void main() {
  setUp(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  testWidgets('offers the email fallback instead of the disabled providers', (tester) async {
    await tester.pumpApp(const ProviderButtons(showProviders: false));
    await tester.pumpAndSettle();

    expect(
      find.text(
        'Apple e Google estão desativados neste build de teste. Entre com e-mail e senha.',
      ),
      findsOneWidget,
    );
    expect(find.text('Entrar com e-mail e senha'), findsOneWidget);
    expect(find.text('Continuar com a Apple'), findsNothing);
    expect(find.text('Continuar com o Google'), findsNothing);
  });
}
