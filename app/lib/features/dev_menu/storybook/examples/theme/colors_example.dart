import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode colorsExample = WidgetbookUseCase(
  name: 'Colors',
  builder: (context) => GridView(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    children: [
      _ColorBox('primary', context.palette.primary),
      _ColorBox('onPrimary', context.palette.onPrimary),
      _ColorBox('secondary', context.palette.secondary),
      _ColorBox('onSecondary', context.palette.onSecondary),
      _ColorBox('background', context.palette.background),
      _ColorBox('onBackground', context.palette.onBackground),
      _ColorBox('container', context.palette.container),
      _ColorBox('onContainer', context.palette.onContainer),
      _ColorBox('error', context.palette.error),
      _ColorBox('onError', context.palette.onError),
      _ColorBox('success', context.palette.success),
      _ColorBox('onSuccess', context.palette.onSuccess),
    ],
  ),
);

class const _ColorBox(final String name, final Color color) extends StatelessWidget {
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
