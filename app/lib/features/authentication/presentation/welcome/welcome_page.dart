import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/dev_menu_page.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/infrastructure/config/env_variables.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The first introduction screen not completed yet, or sign-in once all are done.
PageRouteInfo<void> _nextIntroRoute() {
  final step = AppInjector.instance.get<SettingsRepository>().get().introStep;

  return switch (step) {
    0 => const IntroPhaseRoute(),
    1 => const IntroGoalsRoute(),
    2 => const IntroThemeRoute(),
    3 => const FirstSlipRoute(),
    _ => const SignInRoute(),
  };
}

@RoutePage()
class const WelcomePage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.welcome;

    return BaseView(
      appBar: null,
      body: BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpace.s44),
            const BaseFace(kind: FaceKind.smile, size: FaceSize.showcase),
            const SizedBox(height: AppSpace.s34),
            Semantics(
              header: true,
              child: AppHighlightedText(
                text: l10n.headline,
                highlight: l10n.headlineHighlight,
                style: context.text.display,
              ),
            ),
            const SizedBox(height: AppSpace.s12),
            Text(
              l10n.subtitle,
              style: context.text.bodyLg.copyWith(color: context.colors.textSecondary),
            ),
          ],
        ),
        footer: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BaseButton(text: l10n.start, onPressed: () => context.pushRoute(_nextIntroRoute())),
            const SizedBox(height: AppSpace.s10),
            BaseButton(
              text: l10n.haveAccount,
              variant: .secondary,
              onPressed: () => context.pushRoute(const SignInRoute()),
            ),
            if (EnvVariables.debugSignIn) ...[
              BaseTextLink(
                text: l10n.debugSignIn,
                onPressed: () => context.pushRoute(const DebugSignInRoute()),
              ),
              BaseTextLink(
                text: 'Dev menu',
                onPressed: () => context.router.pushWidget(const DevMenuPage()),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
