import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../helpers/widget_host.dart';

class const _SheetLauncher() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseButton.compact(
        text: 'Open sheet',
        onPressed: () {
          BaseSheet.show<void>(
            context: context,
            title: 'Send the card',
            subtitle: 'Ricardo gets it at 18:00.',
            primaryAction: BaseButton.primary(
              text: 'Send',
              onPressed: () => Navigator.of(context).maybePop(),
            ),
            child: Text('Sheet body', style: context.text.body),
          );
        },
      ),
    );
  }
}

Widget _materialApp(Widget child) {
  return MaterialApp(
    theme: AppTheme.light(AppThemeVariant.rose),
    home: Scaffold(body: child),
  );
}

void main() {
  for (final variant in AppThemeVariant.values) {
    final colors = colorsOf(variant);

    testWidgets('sheet is one Material surface with a grabber and a close for ${variant.name}', (
      tester,
    ) async {
      setSurface(tester);
      await tester.pumpWidget(appFor(variant: variant, home: const _SheetLauncher()));

      await tester.tap(find.text('Open sheet'));
      await tester.pumpAndSettle();

      expect(find.byType(BaseSheet), findsOneWidget);
      expect(find.byKey(const ValueKey('baseSheetGrabber')), findsOneWidget);

      final materialFinder = find.descendant(
        of: find.byType(BaseSheet),
        matching: find.byType(Material),
      );
      expect(materialFinder, findsOneWidget);
      final material = tester.widget<Material>(materialFinder);
      expect(material.color, colors.bgSurface);
      expect(
        material.borderRadius,
        const BorderRadius.vertical(top: Radius.circular(AppRadius.sheet)),
      );

      final bodyStyle = DefaultTextStyle.of(tester.element(find.text('Sheet body'))).style;
      expect(bodyStyle.fontSize, isNotNull);

      await tester.tap(find.byType(BaseRoundButton));
      await tester.pumpAndSettle();
      expect(find.byType(BaseSheet), findsNothing);
      expect(tester.takeException(), isNull);
    });

    testWidgets('sheet dismisses on scrim and drag for ${variant.name}', (tester) async {
      setSurface(tester);
      await tester.pumpWidget(appFor(variant: variant, home: const _SheetLauncher()));

      await tester.tap(find.text('Open sheet'));
      await tester.pumpAndSettle();
      await tester.tapAt(const Offset(195, 40));
      await tester.pumpAndSettle();
      expect(find.byType(BaseSheet), findsNothing);

      await tester.tap(find.text('Open sheet'));
      await tester.pumpAndSettle();
      final sheetTop = tester.getTopLeft(find.byType(BaseSheet));
      await tester.dragFrom(sheetTop + const Offset(120, 8), const Offset(0, 320));
      await tester.pumpAndSettle();
      expect(find.byType(BaseSheet), findsNothing);
      expect(tester.takeException(), isNull);
    });

    testWidgets('sheet fades in under reduced motion for ${variant.name}', (tester) async {
      setSurface(tester);
      await tester.pumpWidget(
        appFor(variant: variant, home: const _SheetLauncher(), disableAnimations: true),
      );

      await tester.tap(find.text('Open sheet'));
      await tester.pump();
      await tester.pump(AppMotion.reduced);

      expect(find.byType(BaseSheet), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('sheet rises above the keyboard and keeps its action reachable', (tester) async {
    setSurface(tester);
    addTearDown(tester.view.resetViewInsets);

    var hasSaved = false;

    await tester.pumpWidget(
      _materialApp(
        Builder(
          builder: (context) => BaseButton.primary(
            text: 'Add memory',
            onPressed: () => BaseSheet.show<void>(
              context: context,
              title: 'New memory',
              primaryAction: BaseButton.primary(
                text: 'Save memory',
                onPressed: () => hasSaved = true,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  BaseTextField(label: 'Title'),
                  SizedBox(height: AppSpace.s12),
                  BaseTextField(label: 'Place'),
                  SizedBox(height: AppSpace.s12),
                  BaseTextField(label: 'Story'),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Add memory'));
    await tester.pumpAndSettle();

    expect(tester.getBottomLeft(find.byType(BaseSheet)).dy, closeTo(844, 1));

    tester.view.viewInsets = const FakeViewPadding(bottom: 300);
    await tester.pumpAndSettle();

    const keyboardTop = 844 - 300;
    expect(tester.getBottomLeft(find.byType(BaseSheet)).dy, closeTo(keyboardTop, .01));
    expect(find.text('Save memory'), findsOneWidget);
    expect(tester.getBottomLeft(find.text('Save memory')).dy, lessThanOrEqualTo(keyboardTop));
    expect(tester.takeException(), isNull);

    await tester.tap(find.text('Save memory'));
    await tester.pumpAndSettle();
    expect(hasSaved, isTrue);
  });

  testWidgets('sheet scrolls body content above the keyboard', (tester) async {
    setSurface(tester);
    addTearDown(tester.view.resetViewInsets);

    var hasSaved = false;

    await tester.pumpWidget(
      _materialApp(
        Builder(
          builder: (context) => BaseButton.primary(
            text: 'Open',
            onPressed: () => BaseSheet.show<void>(
              context: context,
              title: 'New memory',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  for (final label in <String>['Title', 'Place', 'Story', 'Mood', 'Date', 'People'])
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppSpace.s12),
                      child: BaseTextField(label: label),
                    ),
                  BaseButton.primary(text: 'Save memory', onPressed: () => hasSaved = true),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    tester.view.viewInsets = const FakeViewPadding(bottom: 300);
    await tester.pumpAndSettle();

    expect(tester.getBottomLeft(find.byType(BaseSheet)).dy, closeTo(844 - 300, .01));
    expect(find.text('New memory'), findsOneWidget);
    expect(tester.getBottomLeft(find.text('Save memory')).dy, greaterThan(844 - 300));
    expect(tester.takeException(), isNull);

    await tester.ensureVisible(find.text('Save memory'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save memory'));
    await tester.pumpAndSettle();
    expect(hasSaved, isTrue);
  });

  testWidgets('opens one sheet surface with a readable default text style', (tester) async {
    await tester.pumpWidget(
      _materialApp(
        Builder(
          builder: (context) => BaseButton.primary(
            text: 'Open',
            onPressed: () => BaseSheet.show<void>(
              context: context,
              title: 'Send your slip',
              subtitle: 'It joins the card this Sunday.',
              child: const Text('Sheet body'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(find.byType(BaseSheet), findsOneWidget);
    expect(find.byKey(const ValueKey('baseSheetGrabber')), findsOneWidget);
    expect(find.text('Send your slip'), findsOneWidget);
    expect(find.byType(BaseRoundButton), findsOneWidget);

    final defaultStyle = DefaultTextStyle.of(tester.element(find.text('Sheet body')));
    expect(defaultStyle.style.decoration, isNot(TextDecoration.underline));
    expect(tester.takeException(), isNull);
  });
}
