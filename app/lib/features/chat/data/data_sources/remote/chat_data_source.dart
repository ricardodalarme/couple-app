import 'dart:convert';

import 'package:flutter_bloc_starter/features/chat/data/data_sources/remote/mutations/generated/SetChatEnabled.graphql.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/remote/queries/generated/ChatStatus.graphql.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/chat_models.dart';
import 'package:network/network.dart';

/// What the server knows before the first message.
typedef ChatSettings = ({int messagesLeft, bool isEnabled, int plusLimit, int freeLimit});

class ChatDataSource({
  required final GQLClient _client,
  required final RestClient _restClient,
  required final String _functionUrl,
  required final String _apiKey,
}) {
  Future<ChatSettings> getStatus(String profileId) async {
    final response = await _client.query(
      OptionsQueryChatStatus(
        variables: VariablesQueryChatStatus(profileId: profileId),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    return validateResponseData(
      response,
      getData: (data) => (
        messagesLeft: data.chatMessagesLeft ?? 0,
        isEnabled: data.profileSettingsByPk?.chatEnabled ?? false,
        plusLimit: int.tryParse(data.plusLimit?.value ?? '') ?? 0,
        freeLimit: int.tryParse(data.freeLimit?.value ?? '') ?? 0,
      ),
    );
  }

  Future<void> setEnabled({required String profileId, required bool enabled}) async {
    final response = await _client.mutate(
      OptionsMutationSetChatEnabled(
        variables: VariablesMutationSetChatEnabled(profileId: profileId, enabled: enabled),
      ),
    );

    validateResponse(response);
  }

  /// Sends [message] and streams the reply; the stream ends when the server closes it.
  Stream<ChatEvent> send({
    required String message,
    required List<({ChatRole role, String text})> history,
    required String locale,
    required ChatMode mode,
    required String session,
    required String? accessToken,
  }) async* {
    final lines = _restClient.postLines(
      _functionUrl,
      data: {
        'message': message,
        'locale': locale,
        'mode': mode.wire,
        'session': session,
        'history': [
          for (final turn in history) {'role': turn.role.wire, 'text': turn.text},
        ],
      },
      headers: {'apikey': _apiKey, 'authorization': 'Bearer ${accessToken ?? _apiKey}'},
    );
    await for (final line in lines) {
      final event = parseChatLine(line);
      if (event != null) yield event;
    }
  }
}

/// Reads one line of the stream: a `data:` event, or a plain JSON error body.
ChatEvent? parseChatLine(String line) {
  final text = line.trim();
  if (text.isEmpty) return null;
  final raw = text.startsWith('data:') ? text.substring(5).trim() : text;
  try {
    final json = jsonDecode(raw);
    if (json is! Map<String, dynamic>) return null;

    return switch (json['type']) {
      'delta' => ChatDelta(json['text'] as String? ?? ''),
      'done' => ChatDone([
        for (final option in (json['options'] as List<dynamic>? ?? const [])) '$option',
      ]),
      'crisis' => const ChatCrisis(),
      'error' => ChatError(json['code'] as String? ?? 'UPSTREAM'),
      _ => json['error'] is String ? ChatError(json['error'] as String) : null,
    };
  } on FormatException {
    return null;
  }
}
