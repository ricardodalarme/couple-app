import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/guides/data/data_sources/local/guides_local_data_source.dart';
import 'package:flutter_bloc_starter/features/guides/data/data_sources/remote/guides_data_source.dart';
import 'package:flutter_bloc_starter/features/guides/data/models/guide.dart';
import 'package:flutter_bloc_starter/features/guides/data/models/guide_catalogue.dart';
import 'package:flutter_bloc_starter/features/guides/data/models/guide_progress.dart';
import 'package:logger/logger.dart';
import 'package:network/network.dart';
import 'package:uuid/uuid.dart';

/// The longest preparation note the server accepts.
const int conversationNotesMaxLength = 5000;

/// The longest draft the server accepts.
const int conversationDraftMaxLength = 2000;

/// The longest answer one guide step accepts.
const int guideAnswerMaxLength = 1200;

class GuidesRepository({
  required final GuidesDataSource _dataSource,
  required final GuidesLocalDataSource _localDataSource,
  required final AuthenticationRepository _authenticationRepository,
}) {
  final Logger _logger = Logger('GuidesRepository');
  final Uuid _uuid = const Uuid();

  /// The signed-in person's id, which scopes the locally saved progress.
  String? get currentUserId => _authenticationRepository.currentUserId;

  /// The catalogue in [languageCode], in display order.
  Future<List<Guide>> getGuides({required String languageCode}) async => [
    for (final definition in guideCatalogue) definition.localized(languageCode),
  ];

  /// One guide in [languageCode], or null when the slug is unknown.
  Future<Guide?> getGuide(String slug, {required String languageCode}) async {
    for (final definition in guideCatalogue) {
      if (definition.slug == slug) return definition.localized(languageCode);
    }

    return null;
  }

  /// The saved position and answers, unless they are older than seven days.
  Future<GuideProgress?> getProgress(String slug) async {
    try {
      return await _localDataSource.readProgress(slug, ownerId: currentUserId);
    } catch (e, stack) {
      _logger.error('Failed to read guide progress', error: e, stackTrace: stack);
      throw const LocalizedException(l10nKey: 'other');
    }
  }

  Future<void> saveProgress(String slug, GuideProgress progress) async {
    try {
      await _localDataSource.writeProgress(slug, progress, ownerId: currentUserId);
    } catch (e, stack) {
      _logger.error('Failed to save guide progress', error: e, stackTrace: stack);
      throw const LocalizedException(l10nKey: 'other');
    }
  }

  /// Inserts the first preparation and updates the same row after that.
  ///
  /// When the saved row is gone, a new one is inserted and its id returned.
  Future<String> savePrep({
    required String? prepId,
    required String guide,
    required String topic,
    required String notes,
    required String? draft,
  }) async {
    try {
      final trimmedNotes = notes.trim();
      final safeNotes = trimmedNotes.length > conversationNotesMaxLength
          ? trimmedNotes.substring(0, conversationNotesMaxLength)
          : trimmedNotes;
      final trimmedDraft = draft?.trim();
      final String? safeDraft;
      if (trimmedDraft == null || trimmedDraft.isEmpty) {
        safeDraft = null;
      } else if (trimmedDraft.length > conversationDraftMaxLength) {
        safeDraft = trimmedDraft.substring(0, conversationDraftMaxLength);
      } else {
        safeDraft = trimmedDraft;
      }

      if (prepId != null) {
        try {
          await _dataSource.updatePrep(
            id: prepId,
            guide: guide,
            topic: topic,
            notes: safeNotes.isEmpty ? null : safeNotes,
            draft: safeDraft,
          );

          return prepId;
        } on NoDataException {
          return await _dataSource.insertPrep(
            id: _uuid.v4(),
            guide: guide,
            topic: topic,
            notes: safeNotes.isEmpty ? null : safeNotes,
            draft: safeDraft,
          );
        }
      }

      return await _dataSource.insertPrep(
        id: _uuid.v4(),
        guide: guide,
        topic: topic,
        notes: safeNotes.isEmpty ? null : safeNotes,
        draft: safeDraft,
      );
    } catch (e, stack) {
      _logger.error('Failed to save a conversation preparation', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
