import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode baseTagExample = WidgetbookUseCase(
  name: 'BaseTag',
  builder: (context) => BaseTag(
    context.knobs.string(label: 'Label', initialValue: 'Draft'),
    variant: context.knobs.object.dropdown(label: 'Variant', options: BaseTagVariant.values),
    emphasis: context.knobs.object.dropdown(label: 'Emphasis', options: BaseTagEmphasis.values),
  ),
);
