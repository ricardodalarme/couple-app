import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/badge/cubit/notifications_badge_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

class const NotificationsBellButton({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hasUnread = context.select((NotificationsBadgeCubit cubit) => cubit.state.unread);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        BaseRoundButton(
          icon: AppIcons.bell,
          semanticLabel: context.l10n.notifications.badgeTooltip,
          onPressed: () => _openInbox(context),
        ),
        if (hasUnread)
          Positioned(
            top: AppSpace.s8,
            right: AppSpace.s8,
            child: Container(
              key: const Key('notification-badge-dot'),
              width: AppSpace.s8,
              height: AppSpace.s8,
              decoration: BoxDecoration(
                color: context.colors.accentLabel,
                shape: BoxShape.circle,
                border: AppBorders.hair(context.colors.bgSurface),
              ),
            ),
          ),
      ],
    );
  }

  Future<void> _openInbox(BuildContext context) async {
    await context.pushRoute(const NotificationsRoute());

    if (!context.mounted) return;

    await context.read<NotificationsBadgeCubit>().getHasUnread();
  }
}
