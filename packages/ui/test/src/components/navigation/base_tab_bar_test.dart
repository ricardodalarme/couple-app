import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../../../helpers/widget_host.dart';

void _ignore(int index) {}

class const _TabGallery({final ValueChanged<int>? onSelected}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SizedBox.shrink(),
      bottomNavigationBar: BaseTabBar(
        items: const [
          BaseTabBarItem(
            label: 'Today',
            icon: AppIcons.home,
            selectedIcon: AppIcons.home,
            semanticLabel: 'Today tab',
          ),
          BaseTabBarItem(label: 'Slips', icon: AppIcons.note),
          BaseTabBarItem(label: 'Write', icon: AppIcons.plus, isPrimaryAction: true),
          BaseTabBarItem(label: 'Together', icon: AppIcons.rings),
          BaseTabBarItem(label: 'Memories', icon: AppIcons.bookmark),
        ],
        currentIndex: 0,
        onSelected: onSelected ?? _ignore,
      ),
    );
  }
}

void main() {
  for (final variant in AppThemeVariant.values) {
    final colors = colorsOf(variant);

    testWidgets('tab bar carries the plus and the active item for ${variant.name}', (tester) async {
      setSurface(tester);
      var selected = 0;

      await tester.pumpWidget(
        appFor(
          variant: variant,
          home: _TabGallery(onSelected: (index) => selected = index),
        ),
      );

      expect(tester.getSize(find.byType(BaseTabBar)).height, AppSpace.tabBarHeight);
      expect(find.byType(AppPressable), findsNWidgets(5));
      expect(find.byIcon(AppIcons.plus), findsOneWidget);
      expect(find.byIcon(AppIcons.home), findsOneWidget);
      expect(tester.widget<Text>(find.text('Today')).style?.color, colors.accentLabel);
      expect(tester.widget<Text>(find.text('Slips')).style?.color, colors.textSecondary);

      await tester.tap(find.text('Slips'));
      expect(selected, 1);
      expect(tester.takeException(), isNull);
    });

    testWidgets('tab bar drops labels at 200% text for ${variant.name}', (tester) async {
      setSurface(tester);
      await tester.pumpWidget(appFor(variant: variant, home: atTextScale(2, const _TabGallery())));

      expect(find.text('Today'), findsNothing);
      expect(find.byIcon(AppIcons.home), findsOneWidget);
      expect(find.byIcon(AppIcons.plus), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
