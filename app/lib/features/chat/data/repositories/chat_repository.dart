import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/chat_data_source.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/chat_models.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

/// The longest slip body, so a long reply is cut instead of refused.
const int _slipMaxLength = 280;

class ChatRepository({
  required final ChatDataSource _dataSource,
  required final ProfileRepository _profileRepository,
  required final AuthenticationRepository _authenticationRepository,
  required final SlipRepository _slipRepository,
}) {
  final Logger _logger = Logger('ChatRepository');
  final Uuid _uuid = const Uuid();

  /// How many messages are left today and whether the person turned the chat on.
  Future<ChatStatus> getStatus() async {
    try {
      final settings = await _profileRepository.getMySettings();

      return await _dataSource.getStatus(settings.profileId);
    } catch (e, stack) {
      _logger.error('Failed to read the chat status', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Turns the chat on for this person, which is the consent to send messages to the model.
  Future<void> enable() async {
    try {
      final settings = await _profileRepository.getMySettings();
      await _dataSource.setEnabled(profileId: settings.profileId, enabled: true);
    } catch (e, stack) {
      _logger.error('Failed to turn the chat on', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Streams the reply to [message], with the last turns of [history] for context.
  Stream<ChatEvent> send({
    required String message,
    required List<ChatMessage> history,
    required String locale,
    required ChatMode mode,
  }) async* {
    final turns = [
      for (final item in history)
        if (!item.isCrisis && item.text.trim().isNotEmpty) (role: item.role, text: item.text),
    ];
    yield* _dataSource.send(
      message: message,
      history: turns.length > chatHistoryTurns
          ? turns.sublist(turns.length - chatHistoryTurns)
          : turns,
      locale: locale,
      mode: mode,
      accessToken: _authenticationRepository.getAccessToken(),
    );
  }

  /// Turns a reply into a slip, cut to the slip limit; a queued save is fine when offline.
  Future<void> saveAsSlip(String text) async {
    final body = text.trim();
    try {
      await _slipRepository.saveQuick(
        id: _uuid.v4(),
        body: body.length > _slipMaxLength ? body.substring(0, _slipMaxLength) : body,
        createdAt: DateTime.now(),
      );
    } catch (e, stack) {
      _logger.error('Failed to save a reply as a slip', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
