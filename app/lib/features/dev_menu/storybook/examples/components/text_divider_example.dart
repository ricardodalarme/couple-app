import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode textDividerExample = WidgetbookUseCase(
  name: 'TextDivider',
  builder: (context) => TextDivider(context.knobs.string(label: 'Text', initialValue: 'Example')),
);
