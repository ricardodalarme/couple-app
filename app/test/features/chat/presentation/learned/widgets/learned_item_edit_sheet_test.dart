import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/learned_item_edit/learned_item_edit_sheet.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../test_helpers/pump_app.dart';

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  final item = LearnedItem(
    id: 'l1',
    target: LearnedTarget.partnerFact,
    text: 'Gosta de café',
    status: LearnedStatus.pending,
    createdAt: DateTime(2026, 11, 11),
  );

  testWidgets('saving empty text shows the error and keeps the sheet open', (tester) async {
    var saved = 0;
    await tester.pumpApp(LearnedItemEditSheet(item: item, onSave: (_) => saved++));

    await tester.enterText(find.byType(BaseTextArea), '');
    await tester.pump();
    await tester.tap(find.widgetWithText(BaseButton, 'Guardar'));
    await tester.pump();

    expect(find.text('Escreva o que quer guardar'), findsOneWidget);
    expect(saved, 0);
    expect(find.byType(LearnedItemEditSheet), findsOneWidget);
  });
}
