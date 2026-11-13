import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/widget_host.dart';

void main() {
  for (final variant in AppThemeVariant.values) {
    for (final style in BaseSurfaceCardStyle.values) {
      for (final scale in const [1.0, 2.0]) {
        testWidgets('surface card renders ${style.name} in ${variant.name} at ${scale}x text', (
          tester,
        ) async {
          await tester.pumpWidget(
            galleryHost(
              BaseSurfaceCard(
                style: style,
                title: 'Weekend plan',
                supportText: 'Three ideas you saved. None of them is required.',
                privacyNote: 'Only you see this',
                child: const Text('Saturday morning, no phones.'),
              ),
              variant: variant,
              textScale: scale,
            ),
          );
          await tester.pump();

          expect(find.byType(BaseSurfaceCard), findsOneWidget);
          expect(find.text('Weekend plan'), findsOneWidget);
          expect(tester.takeException(), isNull);

          await tester.pumpWidget(const SizedBox.shrink());
          await tester.pump();
        });
      }
    }
  }

  testWidgets('bordered style draws a hairline border and no shadow', (tester) async {
    await tester.pumpWidget(
      galleryHost(const BaseSurfaceCard(title: 'Weekend plan'), variant: AppThemeVariant.rose),
    );
    await tester.pump();

    final decoration = _surfaceOf(tester).decoration! as BoxDecoration;

    expect(decoration.border, isNotNull);
    expect(decoration.boxShadow, isNull);
  });

  testWidgets('ring style draws the ring shadow, no border and keeps the padding', (tester) async {
    await tester.pumpWidget(
      galleryHost(
        const BaseSurfaceCard(
          style: .ring,
          padding: EdgeInsets.all(AppSpace.s16),
          child: Text('Saturday morning, no phones.'),
        ),
        variant: AppThemeVariant.rose,
      ),
    );
    await tester.pump();

    final surface = _surfaceOf(tester);
    final decoration = surface.decoration! as BoxDecoration;

    expect(decoration.border, isNull);
    expect(decoration.boxShadow, AppShadows.ring);
    expect(surface.padding, const EdgeInsets.all(AppSpace.s16));
  });
}

Container _surfaceOf(WidgetTester tester) => tester.widget<Container>(
  find.descendant(of: find.byType(BaseSurfaceCard), matching: find.byType(Container)),
);
