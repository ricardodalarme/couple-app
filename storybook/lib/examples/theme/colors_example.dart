import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode colorsExample = WidgetbookUseCase(
  name: 'Colors',
  builder:
      (context) => GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        children: [
          _ColorBox('primary', context.colors.primary),
          _ColorBox('onPrimary', context.colors.onPrimary),
          _ColorBox('primaryContainer', context.colors.primaryContainer),
          _ColorBox('onPrimaryContainer', context.colors.onPrimaryContainer),
          _ColorBox('secondary', context.colors.secondary),
          _ColorBox('onSecondary', context.colors.onSecondary),
          _ColorBox('secondaryContainer', context.colors.secondaryContainer),
          _ColorBox('onSecondaryContainer', context.colors.onSecondaryContainer),
          _ColorBox('tertiary', context.colors.tertiary),
          _ColorBox('onTertiary', context.colors.onTertiary),
          _ColorBox('tertiaryContainer', context.colors.tertiaryContainer),
          _ColorBox('onTertiaryContainer', context.colors.onTertiaryContainer),
          _ColorBox('error', context.colors.error),
          _ColorBox('onError', context.colors.onError),
          _ColorBox('errorContainer', context.colors.errorContainer),
          _ColorBox('onErrorContainer', context.colors.onErrorContainer),
          _ColorBox('outline', context.colors.outline),
          _ColorBox('outlineVariant', context.colors.outlineVariant),
          _ColorBox('surface', context.colors.surface),
          _ColorBox('onSurface', context.colors.onSurface),
          _ColorBox('surfaceContainerHighest', context.colors.surfaceContainerHighest),
          _ColorBox('onSurfaceVariant', context.colors.onSurfaceVariant),
          _ColorBox('inverseSurface', context.colors.inverseSurface),
          _ColorBox('onInverseSurface', context.colors.onInverseSurface),
          _ColorBox('inversePrimary', context.colors.inversePrimary),
          _ColorBox('shadow', context.colors.shadow),
          _ColorBox('scrim', context.colors.scrim),
          _ColorBox('surfaceTint', context.colors.surfaceTint),
        ],
      ),
);

class _ColorBox extends StatelessWidget {
  const _ColorBox(this.name, this.color);

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(2),
      child: Center(
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
