import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/not_found/presentation/not_found_page.dart';

import '../../../test_helpers/pump_app.dart';

void main() {
  group('NotFoundPage', () {
    testWidgets('renders page', (tester) async {
      await tester.pumpApp(const NotFoundPage());
      await tester.pump();

      expect(find.byType(NotFoundPage), findsOneWidget);
    });
  });
}
