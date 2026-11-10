import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/widget_host.dart';

Color _bannerSurface(WidgetTester tester) {
  final box = tester.widget<DecoratedBox>(
    find.descendant(of: find.byType(BaseTopNotice), matching: find.byType(DecoratedBox)).first,
  );

  return (box.decoration as BoxDecoration).color!;
}

void main() {
  for (final variant in AppThemeVariant.values) {
    final colors = colorsOf(variant);

    testWidgets('maps each banner tone to its status pair for ${variant.name}', (tester) async {
      for (final (tone, status) in [
        (BaseBannerTone.warning, AppStatus.warning),
        (BaseBannerTone.error, AppStatus.error),
        (BaseBannerTone.info, AppStatus.info),
      ]) {
        await tester.pumpWidget(
          scaffoldHost(
            BaseTopNotice(text: 'Technical notice', tone: tone, onDismiss: () {}),
            variant: variant,
            textScale: 1,
          ),
        );

        expect(_bannerSurface(tester), status.surfaceColor(colors));
      }

      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('the banner close is a real callback for ${variant.name}', (tester) async {
      var dismissed = 0;

      await tester.pumpWidget(
        scaffoldHost(
          BaseTopNotice(text: 'Offline', onDismiss: () => dismissed++),
          variant: variant,
          textScale: 1,
        ),
      );

      await tester.tap(find.byType(AppIcon).last);
      await tester.pump();

      expect(dismissed, 1);
    });

    testWidgets('top notices render at 200% text for ${variant.name}', (tester) async {
      await tester.pumpWidget(
        scaffoldHost(
          const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BaseTopNotice(text: 'Could not save.', tone: BaseBannerTone.error),
              BaseTopNotice(
                text: 'New here? Start with one thing.',
                tone: BaseBannerTone.info,
                icon: AppIcons.lightbulb_filled,
              ),
            ],
          ),
          variant: variant,
        ),
      );
      await tester.pump(const Duration(milliseconds: 200));

      expect(find.text('Could not save.'), findsOneWidget);
      expect(find.text('New here? Start with one thing.'), findsOneWidget);
      expect(tester.takeException(), isNull);

      await tester.pumpWidget(const SizedBox());
    });
  }
}
