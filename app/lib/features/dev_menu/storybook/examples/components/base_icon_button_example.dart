import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode baseIconButtonExample = WidgetbookUseCase(
  name: 'BaseIconButton',
  builder: (context) => BaseIconButton(
    icon: const Icon(Icons.favorite),
    tooltip: context.knobs.stringOrNull(label: 'Tooltip', initialValue: 'Favorite'),
    onPressed: () => context.showSnackBar('Icon button pressed'),
  ),
);
