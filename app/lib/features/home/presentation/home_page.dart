import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class const HomePage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: null,
      hasSafeArea: false,
      body: AutoTabsRouter(
        duration: Duration.zero,
        routes: const [PostsListRoute(), SearchRoute(), ProfileRoute()],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);

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
                currentIndex: tabsRouter.activeIndex,
                onSelected: tabsRouter.setActiveIndex,
                items: [
                  BaseTabBarItem(icon: AppIcons.home, label: context.l10n.post.list.title),
                  BaseTabBarItem(icon: AppIcons.search, label: context.l10n.search.title),
                  BaseTabBarItem(icon: AppIcons.user, label: context.l10n.account.profile.title),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
