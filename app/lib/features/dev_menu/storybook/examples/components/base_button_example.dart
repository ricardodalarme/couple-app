import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode baseButtonExample = WidgetbookUseCase(
  name: 'BaseButton',
  builder: (context) => BaseButton(
    text: context.knobs.string(label: 'Text', initialValue: 'Example'),
    isEnabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
    isLoading: context.knobs.boolean(label: 'Loading'),
    onPressed: () => context.showSnackBar('Click success'),
  ),
);
