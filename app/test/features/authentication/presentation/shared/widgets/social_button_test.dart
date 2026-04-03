import 'package:flutter_bloc_starter/features/authentication/presentation/shared/widgets/social_button.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../test_helpers/pump_app.dart';

void main() {
  group(SocialButton, () {
    testWidgets('renders widget with apple provider', (tester) async {
      await tester.pumpApp(
        SocialButton(
          ButtonProvider.apple,
          text: (provider) => 'Sign in with ${provider.name}',
          onPressed: () {},
        ),
      );
      await tester.pump();

      expect(find.byType(SocialButton), findsOneWidget);
    });

    testWidgets('renders widget with google provider', (tester) async {
      await tester.pumpApp(
        SocialButton(
          ButtonProvider.google,
          text: (provider) => 'Sign in with ${provider.name}',
          onPressed: () {},
        ),
      );
      await tester.pump();

      expect(find.byType(SocialButton), findsOneWidget);
    });
  });
}
