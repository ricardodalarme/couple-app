import 'package:common_ui/src/widgets/sign_in_button.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('BaseTextField', () {
    testWidgets('renders widget with facebook provider', (tester) async {
      await tester.pumpApp(
        SignInButton(
          ButtonProvider.facebook,
          text: (provider) => 'Sign in with ${provider.name}',
          onPressed: () {},
        ),
      );
      await tester.pump();

      expect(find.byType(SignInButton), findsOneWidget);
    });

    testWidgets('renders widget with google provider', (tester) async {
      await tester.pumpApp(
        SignInButton(
          ButtonProvider.google,
          text: (provider) => 'Sign in with ${provider.name}',
          onPressed: () {},
        ),
      );
      await tester.pump();

      expect(find.byType(SignInButton), findsOneWidget);
    });
  });
}
