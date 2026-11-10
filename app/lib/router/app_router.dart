import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/welcome/welcome_page.dart';
import 'package:flutter_bloc_starter/features/dev_menu/debug_sign_in/debug_sign_in_page.dart';
import 'package:flutter_bloc_starter/features/home/presentation/home_page.dart';
import 'package:flutter_bloc_starter/features/memories/presentation/memories_page.dart';
import 'package:flutter_bloc_starter/features/not_found/presentation/not_found_page.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slips_page.dart';
import 'package:flutter_bloc_starter/features/today/presentation/today_page.dart';
import 'package:flutter_bloc_starter/features/together/presentation/together_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter() extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: WelcomeRoute.page, initial: true),
    AutoRoute(page: DebugSignInRoute.page),
    AutoRoute(
      page: HomeRoute.page,
      children: [
        AutoRoute(page: TodayRoute.page, initial: true),
        AutoRoute(page: SlipsRoute.page),
        AutoRoute(page: TogetherRoute.page),
        AutoRoute(page: MemoriesRoute.page),
      ],
    ),
    AutoRoute(path: '*', page: NotFoundRoute.page),
  ];
}
