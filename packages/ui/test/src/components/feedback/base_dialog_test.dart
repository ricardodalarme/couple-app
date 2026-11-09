import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../../../helpers/widget_host.dart';

Future<void> _openDialog(
  WidgetTester tester, {
  required AppThemeVariant variant,
  required void Function(Future<String?> result) onFuture,
  bool isDestructive = false,
}) async {
  await tester.pumpWidget(
    materialAppFor(
      Builder(
        builder: (context) => BaseButton.primary(
          text: 'Open',
          onPressed: () => onFuture(
            BaseDialog.show<String>(
              context: context,
              title: 'Leave without saving?',
              text: 'What you wrote will be discarded.',
              primaryText: 'Keep writing',
              primaryResult: 'keep',
              secondaryText: 'Discard',
              secondaryResult: 'discard',
              isDestructive: isDestructive,
            ),
          ),
        ),
      ),
      variant: variant,
    ),
  );

  await tester.tap(find.text('Open'));
  await tester.pumpAndSettle();
}

void main() {
  for (final variant in AppThemeVariant.values) {
    group('${variant.name} theme', () {
      testWidgets('dialog opens, confirms and cancels', (tester) async {
        late Future<String?> result;
        await _openDialog(tester, variant: variant, onFuture: (future) => result = future);

        expect(find.byType(BaseDialog), findsOneWidget);
        expect(find.text('Leave without saving?'), findsOneWidget);

        await tester.tap(find.text('Keep writing'));
        await tester.pumpAndSettle();

        expect(await result, 'keep');
        expect(find.byType(BaseDialog), findsNothing);
        expect(tester.takeException(), isNull);

        late Future<String?> cancelled;
        await _openDialog(tester, variant: variant, onFuture: (future) => cancelled = future);

        await tester.tap(find.text('Discard'));
        await tester.pumpAndSettle();

        expect(await cancelled, 'discard');
        expect(tester.takeException(), isNull);
      });

      testWidgets('dialog ignores an outside tap', (tester) async {
        late Future<String?> result;
        await _openDialog(tester, variant: variant, onFuture: (future) => result = future);

        await tester.tapAt(const Offset(4, 4));
        await tester.pumpAndSettle();

        expect(find.byType(BaseDialog), findsOneWidget);

        await tester.tap(find.text('Discard'));
        await tester.pumpAndSettle();
        await result;
      });

      testWidgets('destructive dialog fills the primary with status error', (tester) async {
        late Future<String?> result;
        await _openDialog(
          tester,
          variant: variant,
          isDestructive: true,
          onFuture: (future) => result = future,
        );

        final boxes = tester.widgetList<DecoratedBox>(
          find.descendant(of: find.byType(BaseDialog), matching: find.byType(DecoratedBox)),
        );
        final hasErrorFill = boxes.any((box) {
          final decoration = box.decoration;
          return decoration is BoxDecoration && decoration.color == AppPalette.errorInk;
        });

        expect(hasErrorFill, isTrue);
        expect(find.text('Keep writing'), findsOneWidget);

        await tester.tap(find.text('Discard'));
        await tester.pumpAndSettle();
        await result;
      });
    });
  }

  testWidgets('dialog works with reduced motion', (tester) async {
    late Future<String?> result;
    await tester.pumpWidget(
      materialAppFor(
        Builder(
          builder: (context) => BaseButton.primary(
            text: 'Open',
            onPressed: () => result = BaseDialog.show<String>(
              context: context,
              title: 'Allow reminders?',
              primaryText: 'Allow',
              primaryResult: 'allow',
              secondaryText: 'Not now',
            ),
          ),
        ),
        variant: AppThemeVariant.rose,
        reduceMotion: true,
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(find.byType(BaseDialog), findsOneWidget);
    await tester.tap(find.text('Not now'));
    await tester.pumpAndSettle();

    expect(await result, isNull);
    expect(tester.takeException(), isNull);
  });
}
