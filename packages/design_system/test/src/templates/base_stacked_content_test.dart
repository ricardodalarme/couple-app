import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/widget_host.dart';

void main() {
  testWidgets('stacked template renders in every theme at 100% and 200%', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    for (final variant in AppThemeVariant.values) {
      for (final scale in [1.0, 2.0]) {
        await tester.pumpTemplate(
          const BaseStackedContent(
            body: Text('Body'),
            footer: SizedBox(height: 50, child: Text('Footer')),
          ),
          appBar: const BaseAppBar(title: 'Header'),
          variant: variant,
          textScale: scale,
        );
        await tester.pump();

        expect(
          tester.takeException(),
          isNull,
          reason: 'BaseStackedContent in ${variant.name} at ${scale}x',
        );
      }
    }
  });

  testWidgets('the bleed band spans the page while header and body stay in the column', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpTemplate(
      const BaseStackedContent(
        header: SizedBox(key: ValueKey('header'), width: double.infinity, height: 20),
        bleed: SizedBox(key: ValueKey('bleed'), width: double.infinity, height: 20),
        body: SizedBox(key: ValueKey('body'), width: double.infinity, height: 20),
      ),
      appBar: const BaseAppBar(title: 'Title'),
      variant: AppThemeVariant.rose,
    );

    final bleedRect = tester.getRect(find.byKey(const ValueKey('bleed')));
    expect(bleedRect.left, moreOrLessEquals(0, epsilon: .001));
    expect(bleedRect.right, moreOrLessEquals(390, epsilon: .001));

    for (final key in ['header', 'body']) {
      final rect = tester.getRect(find.byKey(ValueKey(key)));
      expect(rect.left, moreOrLessEquals(AppSpace.screenMargin, epsilon: .001), reason: key);
      expect(rect.right, moreOrLessEquals(390 - AppSpace.screenMargin, epsilon: .001), reason: key);
    }
  });

  testWidgets('the column stays capped on a wide page while the band reaches both edges', (
    tester,
  ) async {
    const width = 900.0;
    await tester.binding.setSurfaceSize(const Size(width, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpTemplate(
      const BaseStackedContent(
        header: SizedBox(key: ValueKey('header'), width: double.infinity, height: 20),
        bleed: SizedBox(key: ValueKey('bleed'), width: double.infinity, height: 20),
        body: SizedBox(key: ValueKey('body'), width: double.infinity, height: 20),
      ),
      appBar: const BaseAppBar(title: 'Title'),
      variant: AppThemeVariant.rose,
      size: const Size(width, 844),
    );

    final bleedRect = tester.getRect(find.byKey(const ValueKey('bleed')));
    expect(bleedRect.left, moreOrLessEquals(0, epsilon: .001));
    expect(bleedRect.right, moreOrLessEquals(width, epsilon: .001));

    const columnLeft = (width - AppSpace.maxContentWidth) / 2;
    for (final key in ['header', 'body']) {
      final rect = tester.getRect(find.byKey(ValueKey(key)));
      expect(rect.left, moreOrLessEquals(columnLeft, epsilon: .001), reason: key);
      expect(rect.right, moreOrLessEquals(width - columnLeft, epsilon: .001), reason: key);
    }
  });
}
