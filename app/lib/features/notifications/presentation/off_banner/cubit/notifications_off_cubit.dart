import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';

part 'notifications_off_state.dart';

/// Tracks whether reminders are off so Hoje can say so quietly.
///
/// Access is read again every time the app returns to the foreground, so turning it
/// on in system settings clears the notice.
class NotificationsOffCubit({required final NotificationsRepository _repository})
    extends Cubit<NotificationsOffState>
    with WidgetsBindingObserver {
  this : super(const NotificationsOffState());

  void start() {
    WidgetsBinding.instance.addObserver(this);
    refresh();
  }

  Future<void> refresh() async {
    final NotificationAccess access;
    try {
      access = await _repository.currentAccess();
      if (access == NotificationAccess.granted) {
        await _repository.setOffBannerDismissed(value: false);
      }
    } on Object {
      return;
    }
    if (isClosed) return;
    final isOff = access == NotificationAccess.denied;
    emit(
      NotificationsOffState(isOff: isOff, isDismissed: isOff && _repository.isOffBannerDismissed),
    );
  }

  Future<void> dismiss() async {
    await _repository.setOffBannerDismissed(value: true);
    if (isClosed) return;
    emit(NotificationsOffState(isOff: state.isOff, isDismissed: true));
  }

  Future<void> openSettings() => _repository.openSettings();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) refresh();
  }

  @override
  Future<void> close() {
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }
}
