import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [PostsListRoute(), SearchRoute(), ProfileRoute()],
      bottomNavigationBuilder: (_, tabsRouter) => BaseNavigationBar(
        selectedIndex: tabsRouter.activeIndex,
        onDestinationSelected: tabsRouter.setActiveIndex,
        items: [
          BaseNavigationBarItem(icon: Icons.home_rounded, label: context.l10n.post.list.title),
          BaseNavigationBarItem(icon: Icons.search_rounded, label: context.l10n.search.title),
          BaseNavigationBarItem(icon: Icons.person, label: context.l10n.account.profile.title),
        ],
      ),
    );
  }
}
