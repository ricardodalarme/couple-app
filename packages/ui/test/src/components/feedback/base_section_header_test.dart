import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../../../helpers/widget_host.dart';

void _noop() {}

void main() {
  for (final variant in AppThemeVariant.values) {
    final colors = colorsOf(variant);

    group('${variant.name} theme', () {
      testWidgets('section header keeps its link and wraps at 200%', (tester) async {
        await tester.pumpWidget(
          materialAppFor(
            const SizedBox(
              width: 320,
              child: BaseSectionHeader(
                title: 'Everything you kept from this week',
                actionLabel: 'See all',
                onAction: _noop,
              ),
            ),
            variant: variant,
            textScale: 2,
          ),
        );

        expect(find.text('Everything you kept from this week'), findsOneWidget);
        expect(find.text('See all'), findsOneWidget);
        expect(tester.takeException(), isNull);
      });

      testWidgets('label section header uppercases and shows the lock', (tester) async {
        await tester.pumpWidget(
          materialAppFor(
            const BaseSectionHeader(title: 'Only you see this', isLabel: true, showsLock: true),
            variant: variant,
          ),
        );

        expect(find.text('ONLY YOU SEE THIS'), findsOneWidget);
        expect(find.byIcon(AppIcons.lock), findsOneWidget);
        final label = tester.widget<Text>(find.text('ONLY YOU SEE THIS'));
        expect(label.style?.fontSize, 13);
        expect(label.style?.color, colors.textSecondary);
      });
    });
  }
}
