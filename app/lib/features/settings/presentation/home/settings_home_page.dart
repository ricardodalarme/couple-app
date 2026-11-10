import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/account/presentation/sign_out/sign_out_dialog.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/home/cubit/settings_home_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The settings root: sections with one line of status each; Safety is always first-level.
@RoutePage()
class const SettingsHomePage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<SettingsHomeCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.settingsHome;
    final state = context.select((SettingsHomeCubit cubit) => cubit.state);

    final relationship = switch (state.hasPartner) {
      null => null,
      true => state.partnerName ?? l10n.connected,
      false => l10n.invitePartner,
    };
    final notifications = switch (state.notificationsOn) {
      null => null,
      true => l10n.on,
      false => l10n.off,
    };
    final plan = switch (state.hasPlus) {
      null => null,
      true => l10n.planPlus,
      false => l10n.planFree,
    };

    return BaseView(
      appBar: BaseAppBar(title: l10n.title),
      body: BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (state.deletionPending) ...[
              BaseBanner(
                text: l10n.pendingBannerSimple,
                actionLabel: l10n.pendingAction,
                variant: BaseBannerVariant.warning,
                icon: AppIcons.warning,
                onAction: () => context.pushRoute(const DeleteAccountRoute()),
              ),
              const SizedBox(height: AppSpace.s16),
            ],
            BaseListGroup(
              children: [
                BaseListTile(
                  title: l10n.relationship,
                  subtitle: relationship,
                  icon: AppIcons.heart,
                  showsChevron: true,
                  onTap: () => context.pushRoute(
                    state.hasPartner == false ? const InviteRoute() : const RelationshipRoute(),
                  ),
                ),
                BaseListTile(
                  title: l10n.plan,
                  subtitle: plan,
                  icon: AppIcons.star,
                  showsChevron: true,
                  onTap: () => context.pushRoute(const PlansRoute()),
                ),
                BaseListTile(
                  title: l10n.notifications,
                  subtitle: notifications,
                  icon: AppIcons.bell,
                  showsChevron: true,
                  onTap: () => context.pushRoute(const NotificationPreferencesRoute()),
                ),
                BaseListTile(
                  title: l10n.discreet,
                  subtitle: state.discreetOn ? l10n.discreetOn : l10n.discreetOff,
                  icon: AppIcons.eye_off,
                  showsChevron: true,
                  onTap: () => context.pushRoute(const DiscreetModeRoute()),
                ),
                BaseListTile(
                  title: l10n.privacy,
                  subtitle: l10n.privacyStatus,
                  icon: AppIcons.lock,
                  showsChevron: true,
                  onTap: () => context.pushRoute(const PrivacyHubRoute()),
                ),
                BaseListTile(
                  title: l10n.safety,
                  subtitle: l10n.safetyStatus,
                  icon: AppIcons.shield,
                  showsChevron: true,
                  onTap: () => context.pushRoute(const SafeModeRoute()),
                ),
              ],
            ),
            const SizedBox(height: AppSpace.s20),
            BaseListGroup(
              children: [
                BaseListTile(
                  title: l10n.signOut,
                  icon: AppIcons.logout,
                  onTap: () => showSignOutDialog(context),
                ),
                BaseListTile(
                  title: l10n.deleteAccount,
                  icon: AppIcons.trash,
                  isDestructive: true,
                  onTap: () => context.pushRoute(const DeleteAccountRoute()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
