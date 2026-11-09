import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notifications/data/models/app_notification.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/inbox/cubit/notifications_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:formatters/formatters.dart';
import 'package:ui/ui.dart';

class const NotificationTile({required final AppNotification notification, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.notifications;

    return Semantics(
      label: notification.isUnread ? l10n.semanticsUnread : null,
      child: BaseListTile(
        icon: _iconFor(notification.kind),
        title: notification.title,
        subtitle: notification.body,
        trailing: _NotificationMeta(notification: notification),
        isLoose: true,
        onTap: () => context.read<NotificationsCubit>().markRead(notification.id),
      ),
    );
  }

  IconData _iconFor(String kind) => switch (kind) {
    'post' => AppIcons.note,
    'system' => AppIcons.info,
    _ => AppIcons.bell,
  };
}

class const _NotificationMeta({required final AppNotification notification})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (notification.isUnread) ...[const _UnreadDot(), const SizedBox(height: AppSpace.s4)],
        Text(
          DateFormatters.shortDateTime(notification.createdAt.toLocal()),
          style: context.text.caption.copyWith(color: context.colors.textSecondary),
        ),
      ],
    );
  }
}

class const _UnreadDot() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('notification-unread-dot'),
      width: AppSpace.s8,
      height: AppSpace.s8,
      decoration: BoxDecoration(color: context.colors.accentLabel, shape: BoxShape.circle),
    );
  }
}
