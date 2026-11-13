import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/lists/presentation/lists/widgets/create_list_sheet.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../test_helpers/pump_app.dart';

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  testWidgets('creating without a name shows the error and keeps the sheet open', (tester) async {
    var created = 0;
    await tester.pumpApp(CreateListSheet(hasPartner: false, onCreate: (_, _, _) => created++));

    await tester.tap(find.widgetWithText(BaseButton, 'Criar lista'));
    await tester.pump();

    expect(find.text('Dê um nome para a lista.'), findsOneWidget);
    expect(created, 0);
    expect(find.byType(CreateListSheet), findsOneWidget);
  });
}
