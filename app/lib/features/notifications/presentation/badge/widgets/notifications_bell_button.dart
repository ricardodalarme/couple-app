import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/badge/cubit/notifications_badge_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

class const NotificationsBellButton({super.key}) extends StatelessWidget {
  static const double _dotSize = Spacings.small;

  @override
  Widget build(BuildContext context) {
    final hasUnread = context.select((NotificationsBadgeCubit cubit) => cubit.state.unread);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        BaseIconButton(
          icon: const Icon(Icons.notifications_outlined),
          tooltip: context.l10n.notifications.badgeTooltip,
          onPressed: () => _openInbox(context),
        ),
        if (hasUnread)
          Positioned(
            top: Spacings.small,
            right: Spacings.small,
            child: Container(
              key: const Key('notification-badge-dot'),
              width: _dotSize,
              height: _dotSize,
              decoration: BoxDecoration(
                color: context.palette.error,
                shape: BoxShape.circle,
                border: Border.all(color: context.palette.container),
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
