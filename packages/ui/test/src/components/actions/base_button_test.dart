import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:ui/ui.dart';

import '../../../helpers/widget_host.dart';

void _noop() {}

class const _ButtonGallery() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(AppSpace.s20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseButton.primary(text: 'Responder', onPressed: _noop),
          SizedBox(height: AppSpace.s12),
          BaseButton.primary(
            text: 'Salvar',
            onPressed: _noop,
            icon: AppIcons.check,
            isFullWidth: false,
          ),
          SizedBox(height: AppSpace.s12),
          BaseButton.primary(text: 'Saving', onPressed: _noop, isLoading: true),
          SizedBox(height: AppSpace.s12),
          BaseButton.primary(text: 'Off', onPressed: null, isEnabled: false),
          SizedBox(height: AppSpace.s20),
          BaseButton.secondary(text: 'Editar', onPressed: _noop),
          SizedBox(height: AppSpace.s12),
          BaseButton.text(text: 'Agora não', onPressed: _noop),
          SizedBox(height: AppSpace.s12),
          BaseButton.destructive(text: 'Apagar', onPressed: _noop),
          SizedBox(height: AppSpace.s20),
          BaseButton.compact(text: 'Abrir', onPressed: _noop),
          SizedBox(height: AppSpace.s20),
          BaseButton.secondary(text: 'Guardar', onPressed: _noop, isFullWidth: true),
        ],
      ),
    );
  }
}

void main() {
  for (final variant in AppThemeVariant.values) {
    final colors = colorsOf(variant);

    testWidgets('renders every button weight for ${variant.name}', (tester) async {
      setSurface(tester);
      await tester.pumpWidget(appFor(variant: variant, home: const _ButtonGallery()));
      await tester.pump();

      expect(tester.takeException(), isNull);
      expect(find.byType(BaseButton), findsNWidgets(9));
    });

    testWidgets('paints the primary weight and its pressed state for ${variant.name}', (
      tester,
    ) async {
      setSurface(tester);
      await tester.pumpWidget(
        appFor(
          variant: variant,
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(AppSpace.s20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseButton.primary(text: 'Responder', onPressed: _noop),
                  SizedBox(height: AppSpace.s12),
                  BaseButton.primary(text: 'Salvar', onPressed: _noop, icon: AppIcons.check),
                ],
              ),
            ),
          ),
        ),
      );

      final primary = decorationOf(tester, containerOf(buttonWithText('Responder')));
      expect(primary.color, colors.actionPrimary);
      expect(primary.border, isNull);
      expect(tester.getSize(buttonWithText('Responder')).width, 350);
      expect(tester.getSize(buttonWithText('Responder')).height, 50);
      expect(
        tester.widget<AnimatedContainer>(containerOf(buttonWithText('Responder')).first).padding,
        const EdgeInsets.symmetric(horizontal: AppSpace.s24),
      );

      final icon = tester.widget<AppIcon>(
        find.descendant(of: buttonWithText('Salvar'), matching: find.byType(AppIcon)),
      );
      expect(icon.size, AppIconSize.sm);

      final gesture = await tester.startGesture(tester.getCenter(find.text('Responder')));
      await tester.pump(AppMotion.fast);
      expect(
        decorationOf(tester, containerOf(buttonWithText('Responder'))).color,
        colors.actionPrimaryPressed,
      );
      await gesture.up();
      await tester.pump(AppMotion.fast);
      expect(
        decorationOf(tester, containerOf(buttonWithText('Responder'))).color,
        colors.actionPrimary,
      );
    });

    testWidgets('secondary, text and destructive weights for ${variant.name}', (tester) async {
      setSurface(tester);
      await tester.pumpWidget(
        appFor(
          variant: variant,
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(AppSpace.s20),
              child: Wrap(
                spacing: AppSpace.s10,
                runSpacing: AppSpace.s10,
                children: [
                  BaseButton.secondary(text: 'Editar', onPressed: _noop),
                  BaseButton.text(text: 'Agora não', onPressed: _noop),
                  BaseButton.destructive(text: 'Apagar', onPressed: _noop),
                  BaseButton.secondary(text: 'Guardar', onPressed: _noop, isFullWidth: true),
                ],
              ),
            ),
          ),
        ),
      );

      final secondary = decorationOf(tester, containerOf(buttonWithText('Editar')));
      expect(secondary.color, colors.bgSurface);
      expect(secondary.border, AppBorders.hair(colors.borderDefault));
      expect(
        tester.widget<AnimatedContainer>(containerOf(buttonWithText('Editar')).first).padding,
        const EdgeInsets.symmetric(horizontal: AppSpace.s20),
      );
      expect(
        tester.getSize(buttonWithText('Editar')).width,
        lessThan(tester.getSize(buttonWithText('Guardar')).width),
      );

      final text = decorationOf(tester, containerOf(buttonWithText('Agora não')));
      expect(text.color, Colors.transparent);
      expect(text.border, isNull);
      expect(
        tester.widget<AnimatedContainer>(containerOf(buttonWithText('Agora não')).first).padding,
        const EdgeInsets.symmetric(horizontal: AppSpace.s12),
      );
      expect(tester.widget<Text>(find.text('Agora não')).style?.color, colors.textPrimary);

      final destructive = decorationOf(tester, containerOf(buttonWithText('Apagar')));
      expect(destructive.color, Colors.transparent);
      expect(destructive.border, isNull);
      expect(tester.widget<Text>(find.text('Apagar')).style?.color, AppPalette.errorInk);

      final gesture = await tester.startGesture(tester.getCenter(find.text('Agora não')));
      await tester.pump(AppMotion.fast);
      expect(
        decorationOf(tester, containerOf(buttonWithText('Agora não'))).color,
        AppPalette.safetySurface,
      );
      await gesture.up();
      await tester.pump(AppMotion.fast);
    });

    testWidgets('compact weight matches the 40pt measure for ${variant.name}', (tester) async {
      setSurface(tester);
      await tester.pumpWidget(
        appFor(
          variant: variant,
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(AppSpace.s20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: BaseButton.compact(text: 'Abrir', onPressed: _noop),
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<AnimatedContainer>(
        containerOf(find.byType(BaseButton)).first,
      );
      expect(container.constraints?.minHeight, 40);
      expect(container.padding, const EdgeInsets.symmetric(horizontal: AppSpace.s18));
      expect(
        decorationOf(tester, containerOf(find.byType(BaseButton))).color,
        colors.actionPrimary,
      );
      expect(tester.widget<Text>(find.text('Abrir')).style?.fontSize, 15);

      final pressable = tester.widget<AppPressable>(find.byType(AppPressable));
      expect(pressable.enforceMinTapTarget, isTrue);
    });

    testWidgets('disabled and loading states for ${variant.name}', (tester) async {
      setSurface(tester);
      await tester.pumpWidget(
        appFor(
          variant: variant,
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(AppSpace.s20),
              child: Column(
                children: [
                  BaseButton.primary(text: 'Off', onPressed: null, isEnabled: false),
                  SizedBox(height: AppSpace.s12),
                  BaseButton.primary(text: 'Saving', onPressed: _noop, isLoading: true),
                  SizedBox(height: AppSpace.s12),
                  BaseButton.secondary(text: 'Saving too', onPressed: _noop, isLoading: true),
                ],
              ),
            ),
          ),
        ),
      );

      final off = find.ancestor(of: find.text('Off'), matching: find.byType(BaseButton));
      final dimmed = tester.widget<AnimatedOpacity>(
        find.descendant(of: off, matching: find.byType(AnimatedOpacity)),
      );
      expect(dimmed.opacity, .4);
      expect(tester.widget<AppPressable>(find.byType(AppPressable).at(0)).onTap, isNull);

      final loading = find.byType(BaseButton).at(1);
      expect(find.descendant(of: loading, matching: find.text('Saving')), findsNothing);
      final dots = find.descendant(
        of: loading,
        matching: find.byWidgetPredicate(
          (widget) =>
              widget is DecoratedBox &&
              widget.decoration is BoxDecoration &&
              (widget.decoration as BoxDecoration).shape == BoxShape.circle,
        ),
      );
      expect(dots, findsNWidgets(3));

      final secondaryLoading = find.byType(BaseButton).at(2);
      expect(
        find.descendant(of: secondaryLoading, matching: find.text('Saving too')),
        findsNothing,
      );
    });

    testWidgets('buttons survive 200% text for ${variant.name}', (tester) async {
      setSurface(tester);
      await tester.pumpWidget(
        appFor(
          variant: variant,
          home: atTextScale(2, const Scaffold(body: _ButtonGallery())),
        ),
      );
      await tester.pump();

      expect(tester.takeException(), isNull);
    });
  }
}
