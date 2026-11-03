import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/_shared/presentation/widgets/empty_indicator.dart';
import 'package:flutter_bloc_starter/features/_shared/presentation/widgets/error_indicator.dart';
import 'package:flutter_bloc_starter/features/_shared/presentation/widgets/skeletonizer_resource_widget.dart';
import 'package:flutter_bloc_starter/features/notifications/data/models/notification_inbox.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/inbox/cubit/notifications_cubit.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/inbox/widgets/notification_tile.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const NotificationsPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<NotificationsCubit>()..getNotifications(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.notifications;
    final notifications = context.select((NotificationsCubit cubit) => cubit.state.notifications);

    return BaseView(
      title: l10n.title,
      actions: [
        BaseIconButton(
          icon: const Icon(Icons.done_all),
          tooltip: l10n.markAllRead,
          onPressed: context.read<NotificationsCubit>().markAllRead,
        ),
      ],
      body: BlocListener<NotificationsCubit, NotificationsState>(
        listenWhen: (previous, current) => previous.markReadAction != current.markReadAction,
        listener: (context, state) => _showActionFailure(context, state.markReadAction),
        child: BlocListener<NotificationsCubit, NotificationsState>(
          listenWhen: (previous, current) =>
              previous.markAllReadAction != current.markAllReadAction,
          listener: (context, state) => _showActionFailure(context, state.markAllReadAction),
          child: SkeletonizerResourceWidget<NotificationInbox>(
            notifications,
            fakeValue: NotificationInbox.fake,
            successBuilder: (inbox) => inbox.isEmpty
                ? EmptyIndicator(title: l10n.emptyTitle, description: l10n.emptyDescription)
                : _NotificationsListWidget(inbox: inbox),
            failureBuilder: (exception) => ErrorIndicator(
              title: context.l10n.common.genericError,
              message: l10n.textFailure,
              buttonText: context.l10n.common.retry,
              onButtonPressed: context.read<NotificationsCubit>().getNotifications,
            ),
          ),
        ),
      ),
    );
  }

  void _showActionFailure(BuildContext context, Resource<void> action) {
    if (action case Failure(:final LocalizedException exception)) {
      context.showSnackBar(
        context.l10n.notifications.errors.selectOrFallback(exception.l10nKey),
        type: SnackBarType.error,
      );
    }
  }
}

class const _NotificationsListWidget({required final NotificationInbox inbox})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseListView(
      onRefresh: context.read<NotificationsCubit>().getNotifications,
      padding: const EdgeInsets.symmetric(vertical: Spacings.small),
      itemCount: inbox.items.length,
      itemBuilder: (_, index) =>
          NotificationTile(key: ValueKey(inbox.items[index].id), notification: inbox.items[index]),
      separator: const Gap(Spacings.xsmall),
    );
  }
}
