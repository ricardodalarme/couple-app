import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/existing_account/existing_account_page.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/sign_in/sign_in_page.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/welcome/welcome_page.dart';
import 'package:flutter_bloc_starter/features/dev_menu/debug_sign_in/debug_sign_in_page.dart';
import 'package:flutter_bloc_starter/features/home/presentation/home/home_page.dart';
import 'package:flutter_bloc_starter/features/memories/presentation/memories/memories_page.dart';
import 'package:flutter_bloc_starter/features/profile/presentation/setup/profile_setup_page.dart';
import 'package:flutter_bloc_starter/features/onboarding/presentation/goals/intro_goals_page.dart';
import 'package:flutter_bloc_starter/features/onboarding/presentation/phase/intro_phase_page.dart';
import 'package:flutter_bloc_starter/features/onboarding/presentation/theme/intro_theme_page.dart';
import 'package:flutter_bloc_starter/features/not_found/presentation/not_found/not_found_page.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slips/slips_page.dart';
import 'package:flutter_bloc_starter/features/today/presentation/today/today_page.dart';
import 'package:flutter_bloc_starter/features/together/presentation/together/together_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter() extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: WelcomeRoute.page, initial: true),
    AutoRoute(page: IntroPhaseRoute.page),
    AutoRoute(page: IntroGoalsRoute.page),
    AutoRoute(page: IntroThemeRoute.page),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: ExistingAccountRoute.page),
    AutoRoute(page: DebugSignInRoute.page),
    AutoRoute(page: ProfileSetupRoute.page),
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
