import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode baseChipExample = WidgetbookUseCase(
  name: 'BaseChip',
  builder: (context) => BaseChip(
    label: context.knobs.string(label: 'Label', initialValue: 'Nearby'),
    selected: context.knobs.boolean(label: 'Selected'),
    icon: context.knobs.boolean(label: 'Show icon') ? const Icon(Icons.place) : null,
    onTap: () => context.showSnackBar('Chip tapped'),
  ),
);
