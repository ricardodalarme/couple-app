import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/dev_menu_page.dart';
import 'package:flutter_bloc_starter/infrastructure/config/env_variables.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class const WelcomePage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.welcome;

    return BaseView(
      appBar: null,
      body: BaseMomentContent(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(context.l10n.common.appName, style: context.text.titleXl),
            const SizedBox(height: AppSpace.s8),
            Text(
              l10n.tagline,
              textAlign: TextAlign.center,
              style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
            ),
          ],
        ),
        footer: EnvVariables.debugSignIn
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BaseButton(
                    text: l10n.debugSignIn,
                    onPressed: () => context.pushRoute(const DebugSignInRoute()),
                  ),
                  BaseTextLink(
                    text: 'Dev menu',
                    onPressed: () => context.router.pushWidget(const DevMenuPage()),
                  ),
                ],
              )
            : null,
      ),
    );
  }
}
