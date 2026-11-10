import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/dev_menu_page.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/off_banner/widgets/notifications_off_banner.dart';
import 'package:flutter_bloc_starter/infrastructure/config/env_variables.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const TodayPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.tabs;

    return BaseView(
      appBar: null,
      body: BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onLongPress: EnvVariables.debugSignIn
                  ? () => context.router.pushWidget(const DevMenuPage())
                  : null,
              child: Text(l10n.today, style: context.text.titleXl),
            ),
            const SizedBox(height: AppSpace.s16),
            const NotificationsOffBanner(),
            BaseEmptyState(title: l10n.soonTitle, text: l10n.soonText),
          ],
        ),
      ),
    );
  }
}
