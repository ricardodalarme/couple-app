import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode dividerExample = WidgetbookUseCase(
  name: 'Divider',
  builder:
      (context) => Column(
        children: [
          Expanded(child: Container(color: Colors.green100)),
          Divider(
            startMargin: context.knobs.double.input(label: 'Start Margin'),
            endMargin: context.knobs.double.input(label: 'End Margin'),
          ),
          Expanded(child: Container(color: Colors.green100)),
        ],
      ),
);
