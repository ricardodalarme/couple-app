import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/term/presentation/list/terms_list_page.dart';

import '../../../../test_helpers/pump_app.dart';

void main() {
  group('TermsListPage', () {
    testWidgets('renders page', (tester) async {
      await tester.pumpApp(const TermsListPage());
      await tester.pump();

      expect(find.byType(TermsListPage), findsOneWidget);
    });
  });
}
