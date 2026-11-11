import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

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

      testWidgets('notice stays quiet on the surface with a warning glyph', (tester) async {
        await tester.pumpWidget(
          materialAppFor(
            const BaseBanner(
              text: 'Reminders are off. Turn them on in settings.',
              variant: BaseBannerVariant.notice,
            ),
            variant: variant,
          ),
        );

        expect(_bannerSurface(tester), colors.bgSurface);
        final glyphIcon = tester.widget<AppIcon>(
          find.ancestor(of: find.byIcon(AppIcons.warning), matching: find.byType(AppIcon)),
        );
        expect(glyphIcon.color, AppPalette.warningInk);
        expect(tester.takeException(), isNull);
      });

      testWidgets('a long action stacks below the text on a narrow banner', (tester) async {
        const text = 'Reminders are off. Turn them on in settings.';
        const action = 'Open settings';

        await tester.pumpWidget(
          materialAppFor(
            BaseBanner(
              text: text,
              variant: BaseBannerVariant.notice,
              actionLabel: action,
              onAction: () {},
            ),
            variant: variant,
            size: const Size(260, 844),
          ),
        );

        expect(find.text(action), findsOneWidget);
        expect(
          tester.getTopLeft(find.text(action)).dy,
          greaterThanOrEqualTo(tester.getBottomLeft(find.text(text)).dy),
          reason: 'the action sits on its own row',
        );
        expect(
          tester.getSize(find.text(action)).height,
          lessThan(30),
          reason: 'the action stays on one line',
        );
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
