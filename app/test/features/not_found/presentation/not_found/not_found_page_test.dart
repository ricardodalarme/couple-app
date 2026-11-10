import 'package:flutter_bloc_starter/features/not_found/presentation/not_found/not_found_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_helpers/pump_app.dart';

void main() {
  group('NotFoundPage', () {
    testWidgets('renders page', (tester) async {
      await tester.pumpApp(const NotFoundPage());
      await tester.pump();

      expect(find.byType(NotFoundPage), findsOneWidget);
    });
  });
}
