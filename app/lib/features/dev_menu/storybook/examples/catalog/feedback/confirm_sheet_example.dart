import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/foundations/foundation_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode confirmSheetExample = WidgetbookComponent(
  name: 'Confirm sheet',
  useCases: [
    WidgetbookUseCase(
      name: 'Destructive',
      builder: (context) => SheetLauncher(
        title: 'Confirm sheet · destructive',
        buttonText: 'Delete a slip',
        onPressed: () => BaseConfirmSheet.show(
          context: context,
          title: 'Delete this slip?',
          text: 'It disappears for both of you.',
          confirmText: 'Delete slip',
          isDestructive: true,
          onConfirm: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Neutral',
      builder: (context) => SheetLauncher(
        title: 'Confirm sheet · neutral',
        buttonText: 'Unlink a device',
        onPressed: () => BaseConfirmSheet.show(
          context: context,
          title: 'Unlink this device?',
          text: 'You will need to sign in again on it.',
          confirmText: 'Unlink device',
          onConfirm: () {},
        ),
      ),
    ),
  ],
);
