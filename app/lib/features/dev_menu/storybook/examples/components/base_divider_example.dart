import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode baseDividerExample = WidgetbookCategory(
  name: 'BaseDivider',
  children: [baseDividerDefaultExample, baseDividerWithTextExample],
);

final WidgetbookNode baseDividerDefaultExample = WidgetbookUseCase(
  name: 'BaseDivider',
  builder: (context) => Column(
    children: [
      Expanded(child: Container(color: Colors.green100)),
      BaseDivider(
        startMargin: context.knobs.double.input(label: 'Start Margin'),
        endMargin: context.knobs.double.input(label: 'End Margin'),
      ),
      Expanded(child: Container(color: Colors.green100)),
    ],
  ),
);

final WidgetbookNode baseDividerWithTextExample = WidgetbookUseCase(
  name: 'BaseDivider.text',
  builder: (context) => BaseDivider.text(
    text: context.knobs.string(label: 'Text', initialValue: 'Example'),
  ),
);
