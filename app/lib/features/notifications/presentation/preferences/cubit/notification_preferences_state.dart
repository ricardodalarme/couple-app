part of 'notification_preferences_cubit.dart';

final class const NotificationPreferencesState({
  final Resource<NotificationPreferences> preferences = const Loading(),
  final bool isSystemOff = false,
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  /// The loaded choices, or null while loading or failed.
  NotificationPreferences? get current => switch (preferences) {
    Success(:final value) => value,
    _ => null,
  };

  NotificationPreferencesState copyWith({
    Resource<NotificationPreferences>? preferences,
    bool? isSystemOff,
    Resource<void>? saveAction,
  }) {
    return NotificationPreferencesState(
      preferences: preferences ?? this.preferences,
      isSystemOff: isSystemOff ?? this.isSystemOff,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [preferences, isSystemOff, saveAction];
}
