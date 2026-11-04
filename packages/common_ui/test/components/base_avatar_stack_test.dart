import 'package:common_ui/src/components/base_avatar.dart';
import 'package:common_ui/src/components/base_avatar_stack.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('BaseAvatarStack', () {
    testWidgets('renders nothing when there are no photos', (tester) async {
      await tester.pumpApp(const BaseAvatarStack(photoUrls: []));
      await tester.pump();

      expect(find.byType(BaseAvatar), findsNothing);
    });

    testWidgets('renders the overflow badge past the max', (tester) async {
      await tester.pumpApp(const BaseAvatarStack(photoUrls: [null, null, null, null], max: 3));
      await tester.pump();

      expect(find.byType(BaseAvatar), findsNWidgets(3));
      expect(find.text('+1'), findsOneWidget);
    });

    testWidgets('exposes only the semantic label', (tester) async {
      final semantics = tester.ensureSemantics();

      await tester.pumpApp(
        const BaseAvatarStack(photoUrls: [null, null], semanticLabel: 'Two members'),
      );
      await tester.pump();

      expect(find.bySemanticsLabel('Two members'), findsOneWidget);

      semantics.dispose();
    });
  });
}
