import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode basePageIndicatorExample = WidgetbookUseCase(
  name: 'BasePageIndicator',
  builder: (context) => _IndicatorDemo(
    count: context.knobs.int.slider(label: 'Count', max: 8, initialValue: 4),
    interactive: context.knobs.boolean(label: 'Selectable', initialValue: true),
  ),
);

class const _IndicatorDemo({required final int count, required final bool interactive})
    extends StatefulWidget {
  @override
  State<_IndicatorDemo> createState() => _IndicatorDemoState();
}

class _IndicatorDemoState() extends State<_IndicatorDemo> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return BasePageIndicator(
      count: widget.count,
      current: _current.clamp(0, widget.count - 1),
      dotLabelBuilder: (index) => 'Page ${index + 1}',
      onSelected: widget.interactive ? (index) => setState(() => _current = index) : null,
    );
  }
}
