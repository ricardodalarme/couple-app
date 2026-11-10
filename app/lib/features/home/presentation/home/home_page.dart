import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

const int _captureIndex = 2;

@RoutePage()
class const HomePage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.tabs;

    return BaseView(
      appBar: null,
      hasSafeArea: false,
      body: AutoTabsRouter(
        duration: Duration.zero,
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
                  BaseTabBarItem(icon: AppIcons.home, label: l10n.today),
                  BaseTabBarItem(icon: AppIcons.heart, label: l10n.slips),
                  BaseTabBarItem(icon: AppIcons.plus, label: l10n.capture, isPrimaryAction: true),
                  BaseTabBarItem(icon: AppIcons.users, label: l10n.together),
                  BaseTabBarItem(icon: AppIcons.book, label: l10n.memories),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
