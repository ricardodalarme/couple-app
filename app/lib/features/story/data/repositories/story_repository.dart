import 'dart:typed_data';

import 'package:flutter_bloc_starter/features/history/data/repositories/history_repository.dart';
import 'package:flutter_bloc_starter/features/story/data/models/story_card.dart';
import 'package:logger/logger.dart';
import 'package:share_service/share_service.dart';

class StoryRepository({
  required final HistoryRepository _historyRepository,
  required final ShareService _shareService,
}) {
  final Logger _logger = Logger('StoryRepository');

  /// The numbers for the image, or null when there is no together-since date to count from.
  ///
  /// Also returns the names so the person can choose to show them; they are never added by default.
  Future<({StoryCard? card, String names})> getStory() async {
    try {
      final overview = await _historyRepository.getOverview();
      final names = [
        overview.selfName,
        ?overview.partnerName,
      ].where((n) => n.isNotEmpty).join(' & ');
      if (overview.togetherSince == null) return (card: null, names: names);

      final numbers = overview.numbers;

      return (
        card: StoryCard(
          daysTogether: numbers.daysTogether,
          years: numbers.years,
          months: numbers.months,
        ),
        names: names,
      );
    } catch (e, stack) {
      _logger.error('Failed to read the story numbers', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Opens the share sheet with the rendered [png]; the temporary file is removed afterwards.
  Future<void> share(Uint8List png) async {
    try {
      final file = await _shareService.writeTemporaryFile(fileName: 'story.png', bytes: png);
      try {
        await _shareService.shareFile(file: file, mimeType: 'image/png');
      } finally {
        await _shareService.deleteTemporaryFile(file);
      }
    } catch (e, stack) {
      _logger.error('Failed to share the story image', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
