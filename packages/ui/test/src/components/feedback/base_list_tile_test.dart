import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../../../helpers/widget_host.dart';

Widget _host(Widget child, {double width = 350}) {
  return AppThemed(
    variant: AppThemeVariant.rose,
    child: Directionality(
      textDirection: TextDirection.ltr,
      child: MediaQuery(
        data: const MediaQueryData(size: Size(390, 844)),
        child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(width: width, child: child),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('the list tile keeps the value next to the chevron at the right', (tester) async {
    await tester.pumpWidget(
      _host(
        const BaseListTile(
          title: 'Notifications',
          icon: AppIcons.bell,
          value: 'On',
          showsChevron: true,
          showsDivider: false,
        ),
      ),
    );

    final row = tester.getRect(find.byType(BaseListTile));
    final value = tester.getRect(find.text('On'));
    final chevron = tester.getRect(find.byIcon(AppIcons.chevron_right));

    expect(chevron.right, closeTo(row.right - AppSpace.s16, .5));
    expect(chevron.left - value.right, closeTo(AppSpace.s8, .5));
    expect(value.center.dy, closeTo(chevron.center.dy, 1));
    expect(tester.takeException(), isNull);
  });

  for (final variant in AppThemeVariant.values) {
    testWidgets('every list tile renders at 200% text for ${variant.name}', (tester) async {
      await tester.pumpWidget(
        scaffoldHost(
          const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BaseListTile(
                title: 'Profile',
                subtitle: 'Marina',
                icon: AppIcons.user_filled,
                showsChevron: true,
                showsDivider: false,
              ),
              BaseListTile(
                title: 'Card day',
                icon: AppIcons.calendar,
                value: 'Sun',
                showsChevron: true,
              ),
              BaseListTile(
                title: 'Reminders',
                subtitle: 'Two a day at most',
                icon: AppIcons.bell,
                trailing: AppIcon(icon: AppIcons.settings),
              ),
              BaseListTile(title: 'Unlink', icon: AppIcons.trash, isDestructive: true),
              BaseListTile(title: 'Archived', isEnabled: false),
            ],
          ),
          variant: variant,
        ),
      );
      await tester.pump(const Duration(milliseconds: 200));

      expect(find.byType(BaseListTile), findsNWidgets(5));
      expect(find.text('Unlink'), findsOneWidget);
      expect(tester.takeException(), isNull);

      await tester.pumpWidget(const SizedBox());
    });
  }
}
