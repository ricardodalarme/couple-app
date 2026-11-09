import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/foundations/foundation_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode sheetTemplateExample = WidgetbookComponent(
  name: 'Sheet template',
  useCases: [
    WidgetbookUseCase(
      name: 'Choices and primary action',
      builder: (context) => ScreenPreview(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: BaseSheetTemplate(
            title: 'Choose a date type',
            subtitle: 'You can change this later.',
            onClose: () {},
            primaryAction: BaseButton.primary(text: 'Continue', onPressed: () {}),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BaseOptionTile(
                  title: 'Just a day',
                  support: 'A date without a time.',
                  leading: const BaseIconTile(icon: AppIcons.calendar),
                  isSelected: true,
                  onTap: () {},
                ),
                const SizedBox(height: AppSpace.s10),
                BaseOptionTile(
                  title: 'A day and a time',
                  support: 'For dinners, calls and plans.',
                  leading: const BaseIconTile(icon: AppIcons.clock),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ],
);
