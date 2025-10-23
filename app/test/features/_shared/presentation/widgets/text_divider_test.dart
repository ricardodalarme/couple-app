import 'package:common_ui/common_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/login/widgets/text_divider.dart';

import '../../../../../../packages/common_ui/test/test_helpers/pump_app.dart';

void main() {
  group('TextDivider', () {
    testWidgets('renders widget', (tester) async {
      await tester.pumpApp(const TextDivider('Divider'));
      await tester.pump();

      expect(find.byType(TextDivider), findsOneWidget);
    });

    testWidgets('renders text', (tester) async {
      await tester.pumpApp(const TextDivider('Divider'));
      await tester.pump();

      expect(find.text('Divider'), findsOneWidget);
    });

    testWidgets('renders dividers', (tester) async {
      await tester.pumpApp(const TextDivider('Divider'));
      await tester.pump();

      expect(find.byType(BaseDivider), findsNWidgets(2));
    });
  });
}
