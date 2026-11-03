import 'package:common_ui/common_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notifications/data/models/app_notification.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/inbox/cubit/notifications_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:formatters/formatters.dart';

class const NotificationTile({required final AppNotification notification, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.notifications;

    return Semantics(
      label: notification.isUnread ? l10n.semanticsUnread : null,
      child: BaseListTile(
        leading: _NotificationIcon(kind: notification.kind),
        title: notification.title,
        subtitle: notification.body,
        trailing: _NotificationMeta(notification: notification),
        onTap: () => context.read<NotificationsCubit>().markRead(notification.id),
      ),
    );
  }
}

class const _NotificationIcon({required final String kind}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final icon = switch (kind) {
      'post' => Icons.article_outlined,
      'system' => Icons.info_outline,
      _ => Icons.notifications_none,
    };

    return DecoratedBox(
      decoration: BoxDecoration(color: context.palette.container, shape: BoxShape.circle),
      child: Padding(padding: const EdgeInsets.all(Spacings.small), child: Icon(icon)),
    );
  }
}

class const _NotificationMeta({required final AppNotification notification})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (notification.isUnread) ...[const _UnreadDot(), const Gap(Spacings.xsmall)],
        Text(
          DateFormatters.shortDateTime(notification.createdAt.toLocal()),
          style: context.typography.bodySmall,
        ),
      ],
    );
  }
}

class const _UnreadDot() extends StatelessWidget {
  static const double _size = Spacings.small;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('notification-unread-dot'),
      width: _size,
      height: _size,
      decoration: BoxDecoration(color: context.palette.error, shape: BoxShape.circle),
    );
  }
}
