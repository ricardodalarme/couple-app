import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/settings/data/data_sources/local/discreet_local_data_source.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/discreet_mode_values.dart';
import 'package:logger/logger.dart';

/// Reads and saves the three parts of discreet mode.
///
/// Notifications and widget text live on the server so pushes and widgets honour
/// them; the neutral icon is only a device preference. Every value is mirrored
/// locally so the shield works before the first request returns.
class DiscreetRepository({
  required final NotificationsRepository _notificationsRepository,
  required final ProfileRepository _profileRepository,
  required final DiscreetLocalDataSource _localDataSource,
}) {
  final Logger _logger = Logger('DiscreetRepository');

  DiscreetModeValues get local => DiscreetModeValues(
    neutralNotifications: _localDataSource.neutralNotifications,
    hideWidgetText: _localDataSource.hideWidgetText,
    neutralIcon: _localDataSource.neutralIcon,
  );

  /// Reads the server values, keeping the device-only icon and falling back to the mirror.
  Future<DiscreetModeValues> load() async {
    final mirror = local;
    try {
      final notifications = await _notificationsRepository.getPreferences();
      final settings = await _profileRepository.getMySettings();

      return DiscreetModeValues(
        neutralNotifications: notifications.discreet,
        hideWidgetText: !settings.widgetInDiscreet,
        neutralIcon: mirror.neutralIcon,
      );
    } catch (e, stack) {
      _logger.warning('Could not read discreet mode', error: e, stackTrace: stack);
      return mirror;
    }
  }

  Future<void> setNeutralNotifications({required bool value}) async {
    try {
      final preferences = await _notificationsRepository.getPreferences();
      await _notificationsRepository.savePreferences(preferences.copyWith(discreet: value));
      await _localDataSource.setNeutralNotifications(value: value);
    } catch (e, stack) {
      _logger.error('Could not save neutral notifications', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> setHideWidgetText({required bool value}) async {
    try {
      final profile = await _profileRepository.getMyProfile();
      await _profileRepository.setWidgetInDiscreet(profileId: profile.id, hide: !value);
      await _localDataSource.setHideWidgetText(value: value);
    } catch (e, stack) {
      _logger.error('Could not save the widget text setting', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> setNeutralIcon({required bool value}) =>
      _localDataSource.setNeutralIcon(value: value);
}
