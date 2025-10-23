import 'package:common_ui/src/components/base_text_field.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('BaseTextField', () {
    testWidgets('renders widget', (tester) async {
      await tester.pumpApp(const BaseTextField(text: 'Text'));
      await tester.pump();

      expect(find.byType(BaseTextField), findsOneWidget);
    });
  });
}
