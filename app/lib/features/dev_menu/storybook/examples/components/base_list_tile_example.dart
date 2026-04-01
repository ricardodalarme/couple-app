import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode baseListTileExample = WidgetbookUseCase(
  name: 'BaseListTile',
  builder: (context) => BaseListTile(
    title: context.knobs.string(label: 'Title', initialValue: 'List Tile'),
    leading: const Icon(Icons.person),
    onTap: () => context.showSnackBar('Click success'),
  ),
);
