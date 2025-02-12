import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode baseSnackBarExample = WidgetbookUseCase(
  name: 'BaseSnackBar',
  builder:
      (context) => BaseButton(
        text: 'Show SnackBar',
        onPressed:
            () => context.showSnackBar(
              message: context.knobs.string(label: 'Message', initialValue: 'Example'),
              type: context.knobs.list(label: 'Type', options: SnackBarType.values),
            ),
      ),
);
