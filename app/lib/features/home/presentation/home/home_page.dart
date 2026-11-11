import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

const int _captureIndex = 2;

/// Tab icons in display order, with the capture action in the middle.
const List<IconData> homeTabIcons = [
  AppIcons.home,
  AppIcons.note,
  AppIcons.plus,
  AppIcons.rings,
  AppIcons.bookmark,
];

@RoutePage()
class const HomePage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.tabs;

    return BaseView(
      appBar: null,
      hasSafeArea: false,
      body: AutoTabsRouter(
        duration: AppMotion.base,
        curve: AppMotion.baseCurve,
        routes: const [TodayRoute(), SlipsRoute(), TogetherRoute(), MemoriesRoute()],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          final activeIndex = tabsRouter.activeIndex;

          return Column(
            children: [
              Expanded(
                // The outer BaseView owns keyboard insets and the tab bar owns
                // the bottom safe area; tab pages must not add either twice.
                child: MediaQuery.removePadding(
                  context: context,
                  removeBottom: true,
                  child: MediaQuery.removeViewInsets(
                    context: context,
                    removeBottom: true,
                    child: child,
                  ),
                ),
              ),
              BaseTabBar(
                currentIndex: activeIndex < _captureIndex ? activeIndex : activeIndex + 1,
                onSelected: (index) {
                  if (index == _captureIndex) {
                    context.router.root.push(const QuickSlipRoute());
                    return;
                  }
                  tabsRouter.setActiveIndex(index < _captureIndex ? index : index - 1);
                },
                items: [
                  BaseTabBarItem(icon: homeTabIcons[0], label: l10n.today),
                  BaseTabBarItem(icon: homeTabIcons[1], label: l10n.slips),
                  BaseTabBarItem(icon: homeTabIcons[2], label: l10n.capture, isPrimaryAction: true),
                  BaseTabBarItem(icon: homeTabIcons[3], label: l10n.together),
                  BaseTabBarItem(icon: homeTabIcons[4], label: l10n.memories),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
