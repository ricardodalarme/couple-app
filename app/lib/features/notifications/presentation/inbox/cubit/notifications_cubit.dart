import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notifications/data/models/notification_inbox.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';

part 'notifications_state.dart';

class NotificationsCubit({required final NotificationsRepository _notificationsRepository})
    extends Cubit<NotificationsState> {
  this : super(const NotificationsState());

  Future<void> getNotifications() async {
    if (state.notifications is! Success) {
      emit(state.copyWith(notifications: const Loading()));
    }

    try {
      final inbox = await _notificationsRepository.getNotifications();
      emit(state.copyWith(notifications: Success(inbox)));
    } catch (exception) {
      emit(state.copyWith(notifications: Failure.fromObject(exception)));
    }
  }

  Future<void> markRead(String id) async {
    emit(state.copyWith(markReadAction: const Loading()));

    try {
      await _notificationsRepository.markRead([id]);

      final readAt = DateTime.now().toUtc();
      final inbox = state.notifications;

      emit(
        state.copyWith(
          notifications: inbox is Success<NotificationInbox>
              ? Success(inbox.value.replacedRead({id}, readAt))
              : inbox,
          markReadAction: const Success(null),
        ),
      );
    } catch (exception) {
      emit(state.copyWith(markReadAction: Failure.fromObject(exception)));
    }
  }

  Future<void> markAllRead() async {
    emit(state.copyWith(markAllReadAction: const Loading()));

    try {
      await _notificationsRepository.markAllRead();

      final readAt = DateTime.now().toUtc();
      final inbox = state.notifications;

      emit(
        state.copyWith(
          notifications: inbox is Success<NotificationInbox>
              ? Success(
                  inbox.value.replacedRead(
                    inbox.value.items.map((item) => item.id).toSet(),
                    readAt,
                  ),
                )
              : inbox,
          markAllReadAction: const Success(null),
        ),
      );
    } catch (exception) {
      emit(state.copyWith(markAllReadAction: Failure.fromObject(exception)));
    }
  }
}
