import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/profile/presentation/profile_page.dart';

import '../../../test_helpers/pump_app.dart';

void main() {
  group('ProfilePage', () {
    testWidgets('renders page', (tester) async {
      await tester.pumpApp(const ProfilePage());
      await tester.pump();

      expect(find.byType(ProfilePage), findsOneWidget);
    });
  });
}
