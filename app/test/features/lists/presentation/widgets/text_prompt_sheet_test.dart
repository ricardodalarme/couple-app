import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/lists/presentation/text_prompt/text_prompt_sheet.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_helpers/pump_app.dart';

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  testWidgets('confirming empty text shows the error and keeps the sheet open', (tester) async {
    var confirmed = 0;
    await tester.pumpApp(
      TextPromptSheet(
        label: 'Nome',
        confirmText: 'Guardar',
        maxLength: 40,
        errors: const {'empty': 'Escreva um nome.'},
        onConfirm: (_) => confirmed++,
      ),
    );

    await tester.tap(find.widgetWithText(BaseButton, 'Guardar'));
    await tester.pump();

    expect(find.text('Escreva um nome.'), findsOneWidget);
    expect(confirmed, 0);
    expect(find.byType(TextPromptSheet), findsOneWidget);
  });
}
