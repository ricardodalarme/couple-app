import 'dart:convert';

import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/hard_conversation_local_data_source.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/chat_models.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/hard_conversation_draft.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/chat_repository.dart';
import 'package:flutter_bloc_starter/features/notes/data/repositories/notes_repository.dart';
import 'package:logger/logger.dart';

/// The unfinished hard conversation is forgotten after a day.
const Duration hardConversationDraftTtl = Duration(hours: 24);

class HardConversationRepository({
  required final ChatRepository _chatRepository,
  required final NotesRepository _notesRepository,
  required final HardConversationLocalDataSource _localDataSource,
  required final AuthenticationRepository _authenticationRepository,
}) {
  final Logger _logger = Logger('HardConversationRepository');

  /// The draft from the last day, or null when it expired or was never written.
  Future<HardConversationDraft?> readDraft() async {
    final userId = _authenticationRepository.currentUserId;
    if (userId == null) return null;

    final raw = _localDataSource.read(userId);
    if (raw == null) return null;

    try {
      final draft = HardConversationDraft.fromMap(jsonDecode(raw) as Map<String, dynamic>);
      if (DateTime.now().difference(draft.savedAt) < hardConversationDraftTtl) return draft;
    } on Object {
      // A malformed draft is treated like an expired one.
    }
    await _localDataSource.clear(userId);

    return null;
  }

  Future<void> saveDraft(HardConversationDraft draft) async {
    final userId = _authenticationRepository.currentUserId;
    if (userId == null || draft.isEmpty) return;

    await _localDataSource.write(userId: userId, draft: jsonEncode(draft.toMap()));
  }

  Future<void> clearDraft() async {
    final userId = _authenticationRepository.currentUserId;
    if (userId == null) return;

    await _localDataSource.clear(userId);
  }

  /// Asks for one opening sentence built only from the person's own answers.
  Stream<ChatEvent> generate({
    required String what,
    required String need,
    required String locale,
    required String session,
    required HardConversationTone tone,
  }) {
    try {
      return _chatRepository.send(
        message: _prompt(what: what, need: need, locale: locale, tone: tone),
        history: const [],
        locale: locale,
        mode: ChatMode.hardConversation,
        session: session,
      );
    } catch (e, stack) {
      _logger.error('Failed to start the hard-conversation reply', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Sends the edited opening sentence to the partner as a widget note.
  Future<void> sendAsNote(String body) => _notesRepository.sendNote(body: body, forWidget: true);

  String _prompt({
    required String what,
    required String need,
    required String locale,
    required HardConversationTone tone,
  }) {
    final pt = locale.startsWith('pt');
    final toneLine = switch ((pt, tone)) {
      (true, HardConversationTone.gentler) => 'Use um tom mais suave e cuidadoso.',
      (true, HardConversationTone.moreDirect) =>
        'Use um tom um pouco mais claro e direto, ainda gentil.',
      (false, HardConversationTone.gentler) => 'Use a softer, more careful tone.',
      (false, HardConversationTone.moreDirect) => 'Use a clearer, more direct tone, still kind.',
      _ => '',
    };

    if (pt) {
      return 'Estou me preparando para uma conversa difícil. '
          'O que aconteceu: $what. '
          'Do que eu preciso: $need. '
          '$toneLine '
          'Escreva uma única frase de abertura, curta e gentil, que eu possa dizer com as minhas '
          'palavras. Responda apenas com a frase, sem conselhos, diagnósticos ou listas.';
    }

    return 'I am preparing for a hard conversation. '
        'What happened: $what. '
        'What I need: $need. '
        '$toneLine '
        'Write one short, gentle opening sentence I can say in my own words. '
        'Reply with only that sentence, with no advice, diagnosis or lists.';
  }
}
