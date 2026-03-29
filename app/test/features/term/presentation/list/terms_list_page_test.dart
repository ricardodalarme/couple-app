import 'package:flutter_bloc_starter/features/term/presentation/list/terms_list_page.dart';
import 'package:flutter_test/flutter_test.dart';

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
