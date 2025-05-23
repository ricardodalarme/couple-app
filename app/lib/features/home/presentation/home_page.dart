import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:flutter/widgets.dart';
import 'package:quickstart_flutter_bloc/features/home/presentation/widgets/navigation_bar.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/routes/app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [PostRoute(), SearchRoute(), ProfileRoute()],
      bottomNavigationBuilder: (_, tabsRouter) => NavBar(
        currentIndex: tabsRouter.activeIndex,
        onDestinationSelected: tabsRouter.setActiveIndex,
        items: [
          NavBarItem(icon: Icons.home_rounded, label: context.l10n.post.title),
          NavBarItem(icon: Icons.search_rounded, label: context.l10n.search.title),
          NavBarItem(icon: Icons.person, label: context.l10n.profile.title),
        ],
      ),
    );
  }
}
