import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/foundations/foundation_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode flowTemplateExample = WidgetbookComponent(
  name: 'Flow template',
  useCases: [
    WidgetbookUseCase(
      name: 'One task with two actions',
      builder: (context) => ScreenPreview(
        appBar: BaseAppBar(title: 'New date', onClose: () {}),
        child: BaseFlowContent(
          heading: 'Pick your first date',
          highlightedWord: 'first',
          subtitle: 'You can change it together at any time.',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BaseOptionTile(
                title: 'A quiet evening',
                support: 'Dinner at home, no plans after.',
                leading: const BaseIconTile(icon: AppIcons.moon),
                isSelected: true,
                onTap: () {},
              ),
              const SizedBox(height: AppSpace.s10),
              BaseOptionTile(
                title: 'A long walk',
                support: 'Somewhere with trees and no hurry.',
                leading: const BaseIconTile(icon: AppIcons.map_pin),
                onTap: () {},
              ),
              const SizedBox(height: AppSpace.s24),
              const BaseNote(text: 'Only the two of you can see the plan.'),
            ],
          ),
          primaryAction: BaseButton.primary(text: 'Continue', onPressed: () {}),
          secondaryAction: BaseButton.secondary(text: 'Skip for now', onPressed: () {}),
        ),
      ),
    ),
  ],
);
