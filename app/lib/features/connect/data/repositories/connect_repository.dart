import 'package:flutter_bloc_starter/features/connect/data/data_sources/remote/connect_data_source.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/together/data/models/date_idea.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:logger/logger.dart';

class ConnectRepository({
  required final ConnectDataSource _dataSource,
  required final TogetherRepository _togetherRepository,
  required final ProfileRepository _profileRepository,
}) {
  final Logger _logger = Logger('ConnectRepository');

  /// Sends the light "I miss us" signal to the partner.
  Future<void> sendMissUs() async {
    try {
      await _dataSource.sendMissUs();
    } catch (e, stack) {
      _logger.error('Failed to send miss us', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Whether touch topics are on for both; true when the person has no couple, since nothing is shared.
  Future<bool> getTouchTopicsEnabled() async {
    try {
      return await _dataSource.getTouchTopicsEnabled() ?? true;
    } catch (e, stack) {
      _logger.error('Failed to read touch topics', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> setTouchTopicsEnabled({required bool enabled}) async {
    try {
      await _dataSource.setTouchTopics(enabled: enabled);
    } catch (e, stack) {
      _logger.error('Failed to change touch topics', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// The neutral touch cards in the person's language, in editorial order.
  Future<List<HelpItem>> getTouchCards() async {
    final settings = await _profileRepository.getMySettings();

    return _togetherRepository.getHelpContent(kind: 'touch_card', locale: settings.locale);
  }
}
