import 'package:flutter_bloc_starter/features/pairing/presentation/relationship/grief_support_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_helpers/pump_app.dart';

void main() {
  setUp(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  testWidgets('offers memories and support without medical claims', (tester) async {
    await tester.pumpApp(const GriefSupportPage());
    await tester.pump();

    expect(find.textContaining('Estamos com'), findsOneWidget);
    expect(find.text('Suas lembranças continuam aqui, no seu ritmo.'), findsOneWidget);
    expect(find.text('Voltar ao início'), findsOneWidget);
    expect(find.text('Ver apoio'), findsOneWidget);
    expect(find.textContaining('diagnóstico'), findsNothing);
    expect(find.textContaining('tratamento'), findsNothing);
  });
}
