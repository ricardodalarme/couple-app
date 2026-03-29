import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc_starter/features/account/presentation/change_password/change_password_page.dart';
import 'package:flutter_bloc_starter/features/account/presentation/edit_profile/edit_profile_page.dart';
import 'package:flutter_bloc_starter/features/account/presentation/profile/profile_page.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/forgot_password/forgot_password_page.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/login/login_page.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/signup/signup_page.dart';
import 'package:flutter_bloc_starter/features/home/presentation/home_page.dart';
import 'package:flutter_bloc_starter/features/not_found/presentation/not_found_page.dart';
import 'package:flutter_bloc_starter/features/onboarding/presentation/onboarding_page.dart';
import 'package:flutter_bloc_starter/features/post/presentation/list/posts_list_page.dart';
import 'package:flutter_bloc_starter/features/privacy_policy/presentation/privacy_policy_page.dart';
import 'package:flutter_bloc_starter/features/search/presentation/search_page.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/settings_page.dart';
import 'package:flutter_bloc_starter/features/term/presentation/list/terms_list_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: LoginRoute.page, initial: true),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: ForgotPasswordRoute.page),
    AutoRoute(
      page: HomeRoute.page,
      children: [
        AutoRoute(page: PostsListRoute.page, initial: true),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ],
    ),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: EditProfileRoute.page),
    AutoRoute(page: ChangePasswordRoute.page),
    AutoRoute(page: PrivacyPolicyRoute.page),
    AutoRoute(page: TermsListRoute.page),
    AutoRoute(path: '*', page: NotFoundRoute.page),
  ];
}
