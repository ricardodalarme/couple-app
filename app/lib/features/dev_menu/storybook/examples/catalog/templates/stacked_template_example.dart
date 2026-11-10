import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/foundations/foundation_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode stackedTemplateExample = WidgetbookComponent(
  name: 'Stacked template',
  useCases: [
    WidgetbookUseCase(
      name: 'Header, settings body and footer',
      builder: (context) => ScreenPreview(
        appBar: const BaseAppBar(title: 'Settings'),
        child: BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const BaseSectionHeader(title: 'Account', isLabel: true),
              BaseListGroup(
                children: [BaseListTile(title: 'Name', value: 'Marina', onTap: () {})],
              ),
              const SizedBox(height: AppSpace.s24),
              const BaseSectionHeader(title: 'Privacy', isLabel: true),
              BaseListGroup(
                children: [
                  BaseListTile(
                    title: 'Who sees your answers',
                    icon: AppIcons.lock,
                    value: 'Only you',
                    showsChevron: true,
                    onTap: () {},
                  ),
                  BaseListTile(
                    title: 'Download your data',
                    icon: AppIcons.note,
                    showsChevron: true,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
          footer: BaseButton.primary(text: 'Save changes', onPressed: () {}),
        ),
      ),
    ),
  ],
);
