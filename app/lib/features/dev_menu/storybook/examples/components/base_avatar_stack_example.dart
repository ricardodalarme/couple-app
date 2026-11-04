import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode baseAvatarStackExample = WidgetbookUseCase(
  name: 'BaseAvatarStack',
  builder: (context) => BaseAvatarStack(
    photoUrls: List.generate(
      context.knobs.int.slider(label: 'Photos', max: 10, initialValue: 7),
      (index) => 'https://picsum.photos/seed/$index/100',
    ),
    max: context.knobs.int.slider(label: 'Max', max: 10, initialValue: 5),
    size: context.knobs.double.slider(label: 'Size', initialValue: 36, max: 80),
    semanticLabel: context.knobs.stringOrNull(label: 'Semantic label'),
  ),
);
