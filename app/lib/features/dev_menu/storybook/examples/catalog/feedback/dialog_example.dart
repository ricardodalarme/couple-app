import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/foundations/foundation_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode dialogExample = WidgetbookComponent(
  name: 'Dialog',
  useCases: [
    WidgetbookUseCase(
      name: 'Normal',
      builder: (context) => SheetLauncher(
        title: 'Dialog · normal',
        buttonText: 'Leave without saving',
        onPressed: () => BaseDialog.show<void>(
          context: context,
          title: 'Leave without saving?',
          text: 'Your changes will not be kept.',
          primaryText: 'Leave',
          secondaryText: 'Stay',
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Destructive',
      builder: (context) => SheetLauncher(
        title: 'Dialog · destructive',
        buttonText: 'Delete account',
        onPressed: () => BaseDialog.show<void>(
          context: context,
          title: 'Delete your account?',
          text: 'This removes your slips, answers and dates for both of you.',
          primaryText: 'Delete account',
          secondaryText: 'Keep account',
          isDestructive: true,
        ),
      ),
    ),
  ],
);
