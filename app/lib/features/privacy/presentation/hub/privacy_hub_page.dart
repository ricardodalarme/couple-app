import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The privacy and security hub: what is shared, what is hidden and the consents.
@RoutePage()
class const PrivacyHubPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.privacy;

    return BaseView(
      appBar: BaseAppBar(title: l10n.title),
      body: BaseStackedContent(
        body: BaseListGroup(
          children: [
            BaseListTile(
              title: l10n.discreetMode,
              icon: AppIcons.eye_off,
              showsChevron: true,
              onTap: () => context.pushRoute(const DiscreetModeRoute()),
            ),
            BaseListTile(
              title: l10n.partnerTitle,
              icon: AppIcons.users,
              showsChevron: true,
              onTap: () => context.pushRoute(const PartnerViewRoute()),
            ),
            BaseListTile(
              title: l10n.ourTitle,
              icon: AppIcons.shield,
              showsChevron: true,
              onTap: () => context.pushRoute(const OurViewRoute()),
            ),
            BaseListTile(
              title: l10n.consents,
              icon: AppIcons.check,
              showsChevron: true,
              onTap: () => context.pushRoute(const ConsentsRoute()),
            ),
            BaseListTile(
              title: l10n.heavyDayNotice,
              icon: AppIcons.bell,
              showsChevron: true,
              onTap: () => context.pushRoute(const HeavyDayRoute()),
            ),
          ],
        ),
      ),
    );
  }
}
