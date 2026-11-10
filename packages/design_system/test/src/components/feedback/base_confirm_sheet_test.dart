import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/widget_host.dart';

Widget _localizationFreeHost(Widget child) {
  return AppThemed(
    variant: AppThemeVariant.rose,
    child: MediaQuery(
      data: const MediaQueryData(size: Size(390, 844)),
      child: Directionality(textDirection: TextDirection.ltr, child: child),
    ),
  );
}

void main() {
  for (final variant in AppThemeVariant.values) {
    testWidgets('keeps the destructive verb in the error ink for ${variant.name}', (tester) async {
      await tester.pumpWidget(
        scaffoldHost(
          BaseConfirmSheet(
            title: 'Unlink?',
            text: 'You can invite each other again later.',
            confirmText: 'Unlink',
            isDestructive: true,
            onConfirm: () {},
            onCancel: () {},
          ),
          variant: variant,
          textScale: 1,
        ),
      );

      final confirm = tester.widget<Text>(find.text('Unlink'));
      expect(confirm.style?.color, AppPalette.errorInk);
      expect(tester.takeException(), isNull);
    });

    testWidgets('BaseConfirmSheet.show resolves the choice for ${variant.name}', (tester) async {
      Future<bool>? pending;

      await tester.pumpWidget(
        scaffoldHost(
          Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                pending = BaseConfirmSheet.show(
                  context: context,
                  title: 'Delete this slip?',
                  text: 'It leaves this week.',
                  confirmText: 'Delete slip',
                  isDestructive: true,
                );
              },
              child: const Text('open'),
            ),
          ),
          variant: variant,
          textScale: 1,
        ),
      );

      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      expect(find.text('Delete this slip?'), findsOneWidget);

      await tester.tap(find.text('Delete slip'));
      await tester.pumpAndSettle();

      expect(await pending, isTrue);
      expect(find.text('Delete this slip?'), findsNothing);
    });

    testWidgets('BaseConfirmSheet.show resolves false on cancel for ${variant.name}', (
      tester,
    ) async {
      Future<bool>? pending;

      await tester.pumpWidget(
        scaffoldHost(
          Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                pending = BaseConfirmSheet.show(
                  context: context,
                  title: 'Unlink?',
                  text: 'You can reconnect later.',
                  confirmText: 'Unlink',
                );
              },
              child: const Text('open'),
            ),
          ),
          variant: variant,
          textScale: 1,
        ),
      );

      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(await pending, isFalse);
    });
  }

  testWidgets('the confirm sheet opens without ancestor localizations', (tester) async {
    bool? confirmed;

    await tester.pumpWidget(
      _localizationFreeHost(
        Navigator(
          onGenerateRoute: (_) => PageRouteBuilder<void>(
            pageBuilder: (context, animation, secondaryAnimation) => Builder(
              builder: (context) => BaseButton.primary(
                text: 'Delete',
                onPressed: () async {
                  confirmed = await BaseConfirmSheet.show(
                    context: context,
                    title: 'Delete this slip?',
                    text: 'It leaves this week.',
                    confirmText: 'Delete slip',
                    isDestructive: true,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();

    expect(find.text('Delete this slip?'), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.tap(find.text('Delete slip'));
    await tester.pumpAndSettle();

    expect(confirmed, isTrue);
  });
}
