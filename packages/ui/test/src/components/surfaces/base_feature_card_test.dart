import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

Widget _host(AppThemeVariant variant, Widget child, {double textScale = 1}) {
  return AppThemeHost(
    initialVariant: variant,
    child: MediaQuery(
      data: MediaQueryData(textScaler: TextScaler.linear(textScale)),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: SizedBox(
            width: 390,
            child: SingleChildScrollView(padding: const EdgeInsets.all(AppSpace.s20), child: child),
          ),
        ),
      ),
    ),
  );
}

Widget _showcase() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      BaseFeatureCard(
        tag: 'Manias',
        question: 'Which little habit of Ricardo do you love the most?',
        highlightedWord: 'habit',
        actionText: 'Answer',
        face: FaceKind.thinking,
        supportText: 'One line is enough.',
        privacyNote: 'Only you see this until you invite someone.',
        onAction: () {},
      ),
      const SizedBox(height: AppSpace.cardGap),
      BaseFeatureCard(
        tag: 'Smiles',
        question: 'What did Marina do this week that made you smile?',
        highlightedWord: 'week',
        actionText: 'See answers',
        isAnswered: true,
        onAction: () {},
      ),
      const SizedBox(height: AppSpace.cardGap),
      BaseFeatureCard(
        tag: 'Only yours',
        question: 'How was your day, really?',
        highlightedWord: 'day',
        actionText: 'Write a slip',
        isLoading: true,
        onAction: () {},
      ),
    ],
  );
}

void main() {
  for (final variant in AppThemeVariant.values) {
    testWidgets('renders every feature card in ${variant.name}', (tester) async {
      await tester.pumpWidget(_host(variant, _showcase()));

      expect(find.byType(BaseFeatureCard), findsNWidgets(3));
      expect(find.text('MANIAS'), findsOneWidget);
      expect(find.text('Answer'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('feature cards grow at 200% text scale in ${variant.name}', (tester) async {
      await tester.pumpWidget(_host(variant, _showcase(), textScale: 2));

      expect(find.byType(BaseFeatureCard), findsNWidgets(3));
      expect(tester.takeException(), isNull);
    });
  }
}
