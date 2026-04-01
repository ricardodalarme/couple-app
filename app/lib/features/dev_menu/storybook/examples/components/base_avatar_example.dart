import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode baseAvatarExample = WidgetbookUseCase(
  name: 'BaseAvatar',
  builder: (context) => BaseAvatar(
    photoUrl: context.knobs.string(label: 'Photo url', initialValue: 'https://picsum.photos/200'),
    size: context.knobs.double.slider(label: 'Size', initialValue: 200, max: 500),
  ),
);
