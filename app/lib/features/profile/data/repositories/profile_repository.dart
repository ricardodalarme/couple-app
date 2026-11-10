import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/SaveProfileSetup.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/profile_data_source.dart';
import 'package:flutter_bloc_starter/features/profile/data/mappers/account_settings_mapper.dart';
import 'package:flutter_bloc_starter/features/profile/data/mappers/profile_mapper.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:logger/logger.dart';

class ProfileRepository({required final ProfileDataSource _profileDataSource}) {
  final Logger _logger = Logger('ProfileRepository');

  Future<Profile> getMyProfile() async {
    try {
      return (await _profileDataSource.getMyProfile()).toModel();
    } catch (e, stack) {
      _logger.error('Failed to load the profile', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Creates the profile row for a newly signed-in user, or returns the existing one.
  Future<Profile> ensureProfile() async {
    try {
      return (await _profileDataSource.ensureProfile()).toModel();
    } catch (e, stack) {
      _logger.error('Failed to ensure the profile', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<AccountSettings> getMySettings() async {
    try {
      return (await _profileDataSource.getMySettings()).toModel();
    } catch (e, stack) {
      _logger.error('Failed to load the settings', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Saves the name, theme, optional partner name and relationship date, and marks the
  /// person as onboarded.
  Future<void> saveProfileSetup({
    required String profileId,
    required String displayName,
    required AppThemeVariant theme,
    String? partnerName,
    DateTime? togetherSince,
  }) async {
    try {
      await _profileDataSource.saveProfileSetup(
        VariablesMutationSaveProfileSetup(
          profileId: profileId,
          displayName: displayName,
          theme: theme.toServerTheme(),
          partnerName: partnerName,
          togetherSince: togetherSince,
          onboardedAt: DateTime.now().toUtc(),
        ),
      );
    } catch (e, stack) {
      _logger.error('Failed to save the profile setup', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
