import 'dart:ui' show CheckedState, Tristate;

import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

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

Finder _divider() => find.byWidgetPredicate(
  (widget) => widget is Positioned && widget.top == 0 && widget.left == AppSpace.s16,
);

/// Matches a single semantics node that announces [text] more than once.
Finder _repeats(String text) =>
    find.bySemanticsLabel(RegExp('${RegExp.escape(text)}.*${RegExp.escape(text)}', dotAll: true));

void main() {
  testWidgets('draws no divider by default', (tester) async {
    await tester.pumpWidget(_host(const BaseListTile(title: 'Profile')));

    expect(_divider(), findsNothing);
  });

  testWidgets('draws a divider when asked', (tester) async {
    await tester.pumpWidget(_host(const BaseListTile(title: 'Profile', showsDivider: true)));

    expect(_divider(), findsOneWidget);
  });

  testWidgets('a long title ellipsizes when titleMaxLines is set', (tester) async {
    const title = 'A very long gift name that would not fit on a single line of the tile';

    await tester.pumpWidget(_host(const BaseListTile(title: title, titleMaxLines: 1)));

    final text = tester.widget<Text>(find.text(title));
    expect(text.maxLines, 1);
    expect(text.overflow, TextOverflow.ellipsis);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the list tile keeps the value next to the chevron at the right', (tester) async {
    await tester.pumpWidget(
      _host(
        const BaseListTile(
          title: 'Notifications',
          icon: AppIcons.bell,
          value: 'On',
          showsChevron: true,
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

  testWidgets('a row reads its label once and keeps its control separate', (tester) async {
    final handle = tester.ensureSemantics();
    const title = 'Pôr do sol na praia 🌅';

    await tester.pumpWidget(
      _host(
        BaseListTile(
          title: title,
          subtitle: 'Feito',
          leading: BaseCheckbox(value: true, semanticLabel: title, onChanged: (_) {}),
          showsChevron: true,
          onTap: () {},
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.bySemanticsLabel('$title, Feito'), findsOneWidget);
    expect(_repeats(title), findsNothing);

    final row = tester.getSemantics(find.bySemanticsLabel('$title, Feito'));
    expect(row.flagsCollection.isButton, isTrue);

    final checkbox = tester.getSemantics(find.byType(BaseCheckbox));
    expect(checkbox.flagsCollection.isChecked, CheckedState.isTrue);
    expect(checkbox.label, title);

    handle.dispose();
  });

  testWidgets('a switch row exposes the row text and the switch as separate nodes', (tester) async {
    final handle = tester.ensureSemantics();

    await tester.pumpWidget(
      _host(
        BaseListTile(
          title: 'Jar',
          subtitle: 'Keep it for later',
          control: BaseSwitch(value: true, semanticLabel: 'Jar', onChanged: (_) {}),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.bySemanticsLabel('Jar, Keep it for later'), findsOneWidget);
    expect(_repeats('Jar'), findsNothing);

    final toggle = tester.getSemantics(find.byType(BaseSwitch));
    expect(toggle.flagsCollection.isToggled, Tristate.isTrue);

    handle.dispose();
  });

  testWidgets('an inert row still exposes its label and value once', (tester) async {
    final handle = tester.ensureSemantics();

    await tester.pumpWidget(
      _host(const BaseListTile(title: 'Archived', value: 'Off', showsChevron: true)),
    );
    await tester.pumpAndSettle();

    expect(find.bySemanticsLabel('Archived, Off'), findsOneWidget);
    expect(_repeats('Archived'), findsNothing);

    handle.dispose();
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
