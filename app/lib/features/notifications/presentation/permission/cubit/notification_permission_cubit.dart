import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';

part 'notification_permission_state.dart';

/// Asks for notification access after the explainer; refusing leaves the app fully usable.
class NotificationPermissionCubit({required final NotificationsRepository _repository})
    extends Cubit<NotificationPermissionState> {
  this : super(const NotificationPermissionState());

  Future<void> allow() async {
    if (state.requestAction.isLoading) return;

    emit(const NotificationPermissionState(requestAction: Loading()));
    try {
      final access = await _repository.requestAccess();
      emit(NotificationPermissionState(requestAction: Success(access)));
    } catch (exception) {
      emit(NotificationPermissionState(requestAction: Failure.fromObject(exception)));
    }
  }
}
