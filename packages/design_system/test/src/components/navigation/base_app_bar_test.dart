import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../helpers/widget_host.dart';

void _noop() {}

class const _AppBarGallery({required final bool hasScrolled}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BaseAppBar(
            title: 'Our story',
            subtitle: 'Monday, 9 Nov',
            onBack: _noop,
            hasScrolled: hasScrolled,
          ),
          const BaseAppBar(
            title: 'Write a slip',
            onClose: _noop,
            stepIndicator: BaseStepper(count: 5, currentIndex: 2),
          ),
          const BaseStepper(count: 3, currentIndex: 0),
        ],
      ),
    );
  }
}

void main() {
  for (final variant in AppThemeVariant.values) {
    final colors = colorsOf(variant);

    testWidgets('app bar gains the scrolled surface for ${variant.name}', (tester) async {
      setSurface(tester);
      await tester.pumpWidget(
        appFor(variant: variant, home: const _AppBarGallery(hasScrolled: true)),
      );

      final bar = tester.widget<AnimatedContainer>(find.byType(AnimatedContainer).first);
      final decoration = bar.decoration! as BoxDecoration;
      expect(decoration.color, colors.bgScreen.withValues(alpha: .94));
      expect((decoration.border! as Border).bottom.color, colors.borderDefault);
      // 44pt round button plus the 1pt scrolled bottom border.
      expect(tester.getSize(find.byType(AnimatedContainer).first).height, 45);

      await tester.pumpWidget(
        appFor(variant: variant, home: const _AppBarGallery(hasScrolled: false)),
      );
      final plain = tester.widget<AnimatedContainer>(find.byType(AnimatedContainer).first);
      expect((plain.decoration! as BoxDecoration).color, isNull);
      expect((plain.decoration! as BoxDecoration).border, isNull);
    });
  }

  testWidgets('renders a title widget in the centre slot', (tester) async {
    setSurface(tester);
    await tester.pumpWidget(
      appFor(
        variant: AppThemeVariant.rose,
        home: const Scaffold(
          body: BaseAppBar(
            titleWidget: Row(mainAxisSize: MainAxisSize.min, children: [Text('Mascote')]),
            onBack: _noop,
          ),
        ),
      ),
    );

    expect(find.text('Mascote'), findsOneWidget);
  });
}
