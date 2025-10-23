import 'package:common_ui/src/components/base_password_text_field.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('BasePasswordTextField', () {
    testWidgets('renders widget', (tester) async {
      await tester.pumpApp(const BasePasswordTextField(text: 'Password'));
      await tester.pump();

      expect(find.byType(BasePasswordTextField), findsOneWidget);
    });

    testWidgets('change obscureText state on suffixIcon press', (tester) async {
      await tester.pumpApp(const BasePasswordTextField(text: 'Password'));
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
