import 'package:common_ui/src/components/base_text_field.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart' show Icons;

import '../test_helpers/pump_app.dart';

void main() {
  group('BaseTextField', () {
    testWidgets('renders widget', (tester) async {
      await tester.pumpApp(const BaseTextField(text: 'Text'));
      await tester.pump();

      expect(find.byType(BaseTextField), findsOneWidget);
    });

    testWidgets('change obscureText state on suffixIcon press', (tester) async {
      await tester.pumpApp(const BaseTextField(type: BaseTextFieldType.password, text: 'Password'));
      await tester.pump();

      expect(find.byIcon(Icons.visibility), findsOneWidget);
      expect(find.byIcon(Icons.visibility_off), findsNothing);

      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      expect(find.byIcon(Icons.visibility), findsNothing);
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    });
  });
}
