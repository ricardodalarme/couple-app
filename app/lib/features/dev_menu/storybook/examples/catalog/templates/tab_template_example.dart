import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/foundations/foundation_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode tabTemplateExample = WidgetbookComponent(
  name: 'Tab template',
  useCases: [
    WidgetbookUseCase(
      name: 'Header, body and tab bar',
      builder: (context) => ScreenPreview(
        appBar: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Today', style: context.text.titleLg),
            const SizedBox(height: AppSpace.s4),
            Text(
              'Sunday, 9 November',
              style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
            ),
          ],
        ),
        child: BaseTabContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BaseSectionHeader(title: 'Your week', actionLabel: 'See all', onAction: () {}),
              BaseListGroup(
                children: [
                  BaseListTile(
                    title: 'Sunday letter',
                    subtitle: 'A note from Marina',
                    icon: AppIcons.mail,
                    showsChevron: true,
                    showsDivider: false,
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: AppSpace.s16),
              const BaseBanner(
                title: 'A date is coming up',
                text: 'Your first date is in three days.',
              ),
            ],
          ),
          tabBar: const BaseTabBar(
            items: [
              BaseTabBarItem(label: 'Today', icon: AppIcons.home, selectedIcon: AppIcons.home),
              BaseTabBarItem(
                label: 'Memories',
                icon: AppIcons.bookmark,
                selectedIcon: AppIcons.bookmark,
              ),
              BaseTabBarItem(
                label: 'New',
                icon: AppIcons.plus,
                isPrimaryAction: true,
                semanticLabel: 'Start a new slip',
              ),
              BaseTabBarItem(
                label: 'Us',
                icon: AppIcons.heart_filled,
                selectedIcon: AppIcons.heart_filled,
              ),
              BaseTabBarItem(
                label: 'Profile',
                icon: AppIcons.user,
                selectedIcon: AppIcons.user_filled,
              ),
            ],
            currentIndex: 0,
            onSelected: noopIndex,
          ),
        ),
      ),
    ),
  ],
);
