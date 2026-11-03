import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';

part 'notifications_badge_state.dart';

class NotificationsBadgeCubit({required final NotificationsRepository _notificationsRepository})
    extends Cubit<NotificationsBadgeState> {
  this : super(const NotificationsBadgeState());

  Future<void> getHasUnread() async {
    emit(state.copyWith(hasUnread: const Loading()));

    try {
      final hasUnread = await _notificationsRepository.hasUnreadNotifications();
      emit(state.copyWith(hasUnread: Success(hasUnread)));
    } catch (exception) {
      emit(state.copyWith(hasUnread: Failure.fromObject(exception)));
    }
  }
}
