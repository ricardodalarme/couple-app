import 'dart:math' as math;

import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/widget_host.dart';

void main() {
  testWidgets('show inserts a toast and removes it after four seconds', (tester) async {
    await tester.pumpWidget(
      materialAppFor(
        Builder(
          builder: (context) =>
              BaseButton.primary(text: 'Show', onPressed: () => BaseToast.show(context, 'Saved')),
        ),
        variant: AppThemeVariant.rose,
      ),
    );

    await tester.tap(find.text('Show'));
    await tester.pump();

    expect(find.text('Saved'), findsOneWidget);

    await tester.pump(const Duration(seconds: 4));
    await tester.pump();

    expect(find.text('Saved'), findsNothing);
  });

  for (final variant in AppThemeVariant.values) {
    testWidgets('toast dismisses after its window for ${variant.name}', (tester) async {
      var dismissed = 0;

      await tester.pumpWidget(
        scaffoldHost(
          BaseToast(
            message: 'Slip saved',
            actionLabel: 'Undo',
            onAction: () {},
            onDismissed: () => dismissed++,
          ),
          variant: variant,
          textScale: 1,
        ),
      );

      await tester.pump(const Duration(seconds: 4));
      expect(dismissed, 0, reason: 'a toast stays for thirty seconds');

      await tester.pump(const Duration(seconds: 26));
      expect(dismissed, 1);

      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('undo runs the action and dismisses for ${variant.name}', (tester) async {
      var undone = 0;
      var dismissed = 0;

      await tester.pumpWidget(
        scaffoldHost(
          BaseToast(
            message: 'Slip saved',
            actionLabel: 'Undo',
            onAction: () => undone++,
            onDismissed: () => dismissed++,
          ),
          variant: variant,
          textScale: 1,
        ),
      );

      await tester.tap(find.text('Undo'));
      await tester.pump();

      expect(undone, 1);
      expect(dismissed, 1);

      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('dismisses after four seconds without an action for ${variant.name}', (
      tester,
    ) async {
      var dismissed = 0;

      await tester.pumpWidget(
        scaffoldHost(
          BaseToast(message: 'Card sent', onDismissed: () => dismissed++),
          variant: variant,
          textScale: 1,
        ),
      );

      await tester.pump(const Duration(seconds: 4));
      expect(dismissed, 1);

      await tester.pumpWidget(const SizedBox());
    });
  }

  testWidgets('error without an action dismisses after six seconds', (tester) async {
    var dismissed = 0;

    await tester.pumpWidget(
      scaffoldHost(
        BaseToast(
          message: 'Could not send',
          variant: BaseToastVariant.error,
          onDismissed: () => dismissed++,
        ),
        variant: AppThemeVariant.rose,
        textScale: 1,
      ),
    );

    await tester.pump(const Duration(seconds: 4));
    expect(dismissed, 0);

    await tester.pump(const Duration(seconds: 2));
    expect(dismissed, 1);

    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('error shows the leading warning icon', (tester) async {
    await tester.pumpWidget(
      scaffoldHost(
        const BaseToast(message: 'Could not send', variant: BaseToastVariant.error),
        variant: AppThemeVariant.rose,
        textScale: 1,
      ),
    );

    expect(find.byIcon(AppIcons.warning), findsOneWidget);

    await tester.pumpWidget(const SizedBox());
  });

  for (final variant in AppThemeVariant.values) {
    testWidgets('the message is readable text on the toast surface for ${variant.name}', (
      tester,
    ) async {
      final colors = colorsOf(variant);
      const message = 'Não foi possível salvar as preferências agora.';

      await tester.pumpWidget(
        scaffoldHost(
          const BaseToast(message: message, variant: BaseToastVariant.error),
          variant: variant,
          textScale: 1,
        ),
      );

      final style = tester.widget<Text>(find.text(message)).style!;
      expect(style.color, colors.textOnAction);
      expect(style.color!.a, 1, reason: 'the message is not dimmed');
      expect(style.fontSize, greaterThanOrEqualTo(15));
      expect(_contrastRatio(style.color!, colors.actionPrimary), greaterThanOrEqualTo(4.5));

      final surface = tester.widget<ColoredBox>(
        find.descendant(of: find.byType(BaseToast), matching: find.byType(ColoredBox)).first,
      );
      expect(surface.color, colors.actionPrimary);
      expect(tester.getSize(find.text(message)).height, greaterThan(0));

      await tester.pumpWidget(const SizedBox());
    });
  }
}

/// WCAG 2.x contrast ratio between an opaque [foreground] and [background].
double _contrastRatio(Color foreground, Color background) {
  final foregroundLuminance = foreground.computeLuminance();
  final backgroundLuminance = background.computeLuminance();
  final lighter = math.max(foregroundLuminance, backgroundLuminance);
  final darker = math.min(foregroundLuminance, backgroundLuminance);

  return (lighter + .05) / (darker + .05);
}
