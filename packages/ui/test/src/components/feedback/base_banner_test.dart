import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../../../helpers/widget_host.dart';

Color _bannerSurface(WidgetTester tester) {
  final box = tester.widget<DecoratedBox>(
    find.descendant(of: find.byType(BaseBanner), matching: find.byType(DecoratedBox)).first,
  );

  return (box.decoration as BoxDecoration).color!;
}

void main() {
  for (final variant in AppThemeVariant.values) {
    final colors = colorsOf(variant);

    group('${variant.name} theme', () {
      testWidgets('banner tones use their status ink and surface', (tester) async {
        for (final (bannerVariant, status) in [
          (BaseBannerVariant.info, AppStatus.info),
          (BaseBannerVariant.warning, AppStatus.warning),
          (BaseBannerVariant.error, AppStatus.error),
          (BaseBannerVariant.safety, AppStatus.safety),
        ]) {
          await tester.pumpWidget(
            materialAppFor(
              BaseBanner(title: 'Notice', text: 'Something to know.', variant: bannerVariant),
              variant: variant,
            ),
          );

          expect(
            _bannerSurface(tester),
            status.surfaceColor(colors),
            reason: '${bannerVariant.name} surface',
          );

          final title = tester.widget<Text>(find.text('Notice'));
          expect(title.style?.color, status.inkColor(colors));
          expect(tester.takeException(), isNull);
        }

        await tester.pumpWidget(const SizedBox());
      });

      testWidgets('plain banner sits on the surface with a hair border', (tester) async {
        await tester.pumpWidget(
          materialAppFor(
            const BaseBanner(
              text: 'Neutral variant, for inside cards.',
              variant: BaseBannerVariant.plain,
            ),
            variant: variant,
          ),
        );

        expect(_bannerSurface(tester), colors.bgSurface);
        final box = tester.widget<DecoratedBox>(
          find.descendant(of: find.byType(BaseBanner), matching: find.byType(DecoratedBox)).first,
        );
        expect((box.decoration as BoxDecoration).border, isNotNull);
        expect(tester.takeException(), isNull);
      });

      testWidgets('banner action and dismiss stay tappable', (tester) async {
        var actions = 0;
        var dismissals = 0;

        await tester.pumpWidget(
          materialAppFor(
            BaseBanner(
              title: 'Offline',
              text: 'Slips are saved and go up later.',
              variant: BaseBannerVariant.warning,
              actionLabel: 'Retry',
              onAction: () => actions++,
              onDismiss: () => dismissals++,
              dismissLabel: 'Dismiss notice',
            ),
            variant: variant,
          ),
        );

        await tester.tap(find.text('Retry'));
        await tester.tap(find.byIcon(AppIcons.close));

        expect(actions, 1);
        expect(dismissals, 1);
        expect(tester.takeException(), isNull);
      });
    });
  }
}
