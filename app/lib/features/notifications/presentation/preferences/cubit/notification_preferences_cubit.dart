import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notifications/data/models/notification_preferences.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/models/reminder_preferences.dart';
import 'package:flutter_bloc_starter/features/reminders/data/repositories/reminders_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/services/reminder_sync_service.dart';

part 'notification_preferences_state.dart';

class NotificationPreferencesCubit({
  required final NotificationsRepository _notificationsRepository,
  required final RemindersRepository _remindersRepository,
  required final ReminderSyncService _syncService,
}) extends Cubit<NotificationPreferencesState> {
  this : super(const NotificationPreferencesState());

  Future<void> load() async {
    emit(state.copyWith(preferences: const Loading()));
    await refreshAccess();
    try {
      emit(state.copyWith(preferences: Success(await _notificationsRepository.getPreferences())));
    } catch (exception) {
      emit(state.copyWith(preferences: Failure.fromObject(exception)));
    }
  }

  /// Reads the system permission again, for when the person returns from system settings.
  Future<void> refreshAccess() async {
    final access = await _notificationsRepository.currentAccess();
    emit(state.copyWith(isSystemOff: access == NotificationAccess.denied));
  }

  Future<void> openSystemSettings() => _notificationsRepository.openSettings();

  Future<void> setEnabled({required bool value}) =>
      _change((current) => current.copyWith(isEnabled: value));

  Future<void> setTypeEnabled(String type, {required bool value}) => _change((current) {
    final muted = {...current.mutedTypes};
    if (value) {
      muted.remove(type);
    } else {
      muted.add(type);
    }

    return current.copyWith(mutedTypes: muted);
  });

  Future<void> setCardDay(int day) => _change((current) => current.copyWith(cardDay: day));

  Future<void> setCardHour(int hour) => _change((current) => current.copyWith(cardHour: hour));

  Future<void> _change(NotificationPreferences Function(NotificationPreferences) update) async {
    final current = state.current;
    if (current == null || state.saveAction.isLoading) return;

    final next = update(current);
    if (next == current) return;

    emit(state.copyWith(preferences: Success(next), saveAction: const Loading()));
    try {
      await _notificationsRepository.savePreferences(next);
      await _mirrorOnDevice(next);
      emit(state.copyWith(saveAction: const Success(null)));
    } catch (exception) {
      emit(
        state.copyWith(preferences: Success(current), saveAction: Failure.fromObject(exception)),
      );
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  Future<void> _mirrorOnDevice(NotificationPreferences preferences) async {
    final local = _remindersRepository.getPreferences();
    await _remindersRepository.savePreferences(
      local.copyWith(
        isPaused: !preferences.isEnabled,
        enabled: {
          if (preferences.allows('daily_idea')) ReminderKind.dailyIdea,
          if (preferences.allows('date_coming')) ReminderKind.dates,
          if (preferences.allows('card_ready')) ReminderKind.weeklyCard,
        },
      ),
    );
    await _syncService.sync();
  }
}
