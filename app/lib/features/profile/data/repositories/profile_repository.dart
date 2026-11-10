import 'dart:async';

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/_shared/data/data_sources/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/SaveIntroAnswers.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/SaveProfileSetup.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/UpdateDisplayName.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/UpdatePronouns.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/UpdateRelationshipPhase.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/UpdateTheme.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/UpdateTimeZone.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/UpdateTogetherSince.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/profile_data_source.dart';
import 'package:flutter_bloc_starter/features/profile/data/mappers/account_settings_mapper.dart';
import 'package:flutter_bloc_starter/features/profile/data/mappers/profile_mapper.dart';
import 'package:flutter_bloc_starter/features/profile/data/mappers/relationship_phase_mapper.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile_details.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_details.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';
import 'package:logger/logger.dart';

/// The goal slugs the server accepts in `profile_settings.goals`.
const Set<String> _knownGoals = {
  'reconnect',
  'fight_less',
  'keep_romance',
  'remember_dates',
  'organize_routine',
  'just_record',
};

class ProfileRepository({required final ProfileDataSource _profileDataSource}) {
  final Logger _logger = Logger('ProfileRepository');
  final StreamController<void> _changes = StreamController<void>.broadcast();

  /// Emits when a saved profile or relationship field changes.
  Stream<void> get onChanged => _changes.stream;

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

  /// Hides the text of the partner widgets while discreet mode is on.
  Future<void> setWidgetInDiscreet({required String profileId, required bool hide}) async {
    try {
      await _profileDataSource.setWidgetInDiscreet(profileId: profileId, hide: hide);
    } catch (e, stack) {
      _logger.error('Failed to save the discreet widget setting', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<ProfileDetails> getProfileDetails() async {
    try {
      final profile = await _profileDataSource.getMyProfile();
      final settings = await _profileDataSource.getMySettings();
      return ProfileDetails(
        profileId: profile.id,
        displayName: profile.displayName ?? '',
        pronouns: profile.pronouns,
        timeZone: settings.timeZone,
        theme: settings.theme.toVariant(),
      );
    } catch (e, stack) {
      _logger.error('Failed to load the profile details', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<RelationshipDetails> getRelationshipDetails() async {
    try {
      final settings = await _profileDataSource.getMySettings();
      return RelationshipDetails(
        profileId: settings.profileId,
        phase: RelationshipPhase.fromServer(settings.phase?.toJson()),
        togetherSince: settings.togetherSince,
      );
    } catch (e, stack) {
      _logger.error('Failed to load the relationship details', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> updateDisplayName({required String profileId, required String displayName}) async {
    try {
      final affected = await _profileDataSource.updateDisplayName(
        VariablesMutationUpdateDisplayName(profileId: profileId, displayName: displayName),
      );
      _ensureUpdated(affected);
      _notifyChanges();
    } catch (e, stack) {
      _logger.error('Failed to save the display name', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> updatePronouns({required String profileId, required String? pronouns}) async {
    try {
      final affected = await _profileDataSource.updatePronouns(
        VariablesMutationUpdatePronouns(profileId: profileId, pronouns: pronouns),
      );
      _ensureUpdated(affected);
      _notifyChanges();
    } catch (e, stack) {
      _logger.error('Failed to save the pronouns', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> updateTheme({required String profileId, required AppThemeVariant theme}) async {
    try {
      final affected = await _profileDataSource.updateTheme(
        VariablesMutationUpdateTheme(profileId: profileId, theme: theme.toServerTheme()),
      );
      _ensureUpdated(affected);
      _notifyChanges();
    } catch (e, stack) {
      _logger.error('Failed to save the theme', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> updateTimeZone({required String profileId, required String timeZone}) async {
    try {
      final affected = await _profileDataSource.updateTimeZone(
        VariablesMutationUpdateTimeZone(profileId: profileId, timeZone: timeZone),
      );
      _ensureUpdated(affected);
      _notifyChanges();
    } catch (e, stack) {
      _logger.error('Failed to save the time zone', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> updateRelationshipPhase({
    required String profileId,
    required RelationshipPhase? phase,
  }) async {
    try {
      final affected = await _profileDataSource.updateRelationshipPhase(
        VariablesMutationUpdateRelationshipPhase(profileId: profileId, phase: phase?.toSource()),
      );
      _ensureUpdated(affected);
      _notifyChanges();
    } catch (e, stack) {
      _logger.error('Failed to save the relationship phase', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> updateTogetherSince({
    required String profileId,
    required DateTime? togetherSince,
  }) async {
    try {
      final affected = await _profileDataSource.updateTogetherSince(
        VariablesMutationUpdateTogetherSince(profileId: profileId, togetherSince: togetherSince),
      );
      _ensureUpdated(affected);
      _notifyChanges();
    } catch (e, stack) {
      _logger.error('Failed to save the relationship date', error: e, stackTrace: stack);
      rethrow;
    }
  }

  void _ensureUpdated(int affected) {
    if (affected != 1) throw const LocalizedException(l10nKey: 'UPDATE_FAILED');
  }

  void _notifyChanges() {
    if (!_changes.isClosed) _changes.add(null);
  }

  Future<AccountSettings> getMySettings() async {
    try {
      return (await _profileDataSource.getMySettings()).toModel();
    } catch (e, stack) {
      _logger.error('Failed to load the settings', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Sends the answers given in the first-use introduction.
  ///
  /// The private goal [after a fight] stays in the person's own settings row.
  Future<void> saveIntroAnswers({
    required String profileId,
    String? phase,
    List<String> goals = const [],
  }) async {
    final known = goals.where(_knownGoals.contains).toList();
    try {
      await _profileDataSource.saveIntroAnswers(
        VariablesMutationSaveIntroAnswers(
          profileId: profileId,
          phase: phase == null ? null : EnumRelationshipPhase.fromJson(phase),
          goal: _primaryGoal(known),
          goals: known.isEmpty ? null : known,
        ),
      );
    } catch (e, stack) {
      _logger.error('Failed to save the introduction answers', error: e, stackTrace: stack);
      rethrow;
    }
  }

  EnumRelationshipGoal? _primaryGoal(List<String> goals) {
    for (final goal in goals) {
      switch (goal) {
        case 'reconnect':
          return EnumRelationshipGoal.reconnect;
        case 'fight_less':
          return EnumRelationshipGoal.after_fight;
        case 'keep_romance':
          return EnumRelationshipGoal.keep;
      }
    }
    return null;
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
      _notifyChanges();
    } catch (e, stack) {
      _logger.error('Failed to save the profile setup', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
