import 'package:common_ui/src/components/base_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('BaseSnackBar', () {
    testWidgets('show success SnackBar', (WidgetTester tester) async {
      await tester.pumpApp(
        Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                context.showSnackBar(message: 'Success Message', type: SnackBarType.success);
              },
              child: const Text('Show SnackBar'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show SnackBar'));
      await tester.pumpAndSettle();

      expect(find.text('Success Message'), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('show error SnackBar', (WidgetTester tester) async {
      await tester.pumpApp(
        Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                context.showSnackBar(message: 'Error Message', type: SnackBarType.error);
              },
              child: const Text('Show SnackBar'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show SnackBar'));
      await tester.pumpAndSettle();

      expect(find.text('Error Message'), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
