import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/chat/widgets/save_learning_sheet.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../test_helpers/pump_app.dart';

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  testWidgets('the reply is prefilled and cut to the learning limit', (tester) async {
    await tester.pumpApp(
      SaveLearningSheet(initialText: 'a' * (learnedItemMaxLength + 20), onSave: (_, _) {}),
    );

    final field = tester.widget<BaseTextArea>(find.byType(BaseTextArea));
    expect(field.text, 'a' * learnedItemMaxLength);
  });

  testWidgets('saving needs a target and returns the picked one', (tester) async {
    LearnedTarget? savedTarget;
    String? savedText;
    await tester.pumpApp(
      SaveLearningSheet(
        initialText: 'Um passo pequeno.',
        onSave: (target, text) {
          savedTarget = target;
          savedText = text;
        },
      ),
    );

    final save = tester.widget<BaseButton>(find.widgetWithText(BaseButton, 'Guardar'));
    expect(save.onPressed, isNotNull);

    await tester.tap(find.widgetWithText(BaseButton, 'Guardar'));
    await tester.pumpAndSettle();
    expect(savedTarget, isNull);

    await tester.tap(find.text('Um date'));
    await tester.pump();

    await tester.tap(find.widgetWithText(BaseButton, 'Guardar'));
    await tester.pumpAndSettle();

    expect(savedTarget, LearnedTarget.date);
    expect(savedText, 'Um passo pequeno.');
  });
}
