import 'package:equatable/equatable.dart';

/// The longest message the server reads.
const int chatMessageMaxLength = 1000;

/// How many earlier turns are sent along so the mascot keeps the thread.
const int chatHistoryTurns = 12;

enum ChatRole(final String wire) {
  user('user'),
  mascot('mascot'),
}

/// What kind of help the chat gives.
enum ChatMode(final String wire) {
  free('free'),
  hardConversation('hard_conversation'),
}

/// One bubble of the conversation; the chat is never stored, so this lives only in memory.
final class const ChatMessage({
  required final String id,
  required final ChatRole role,
  required final String text,
  final bool isStreaming = false,
  final bool isInterrupted = false,
  final bool isCrisis = false,
}) with Equatable {
  ChatMessage copyWith({String? text, bool? isStreaming, bool? isInterrupted}) => ChatMessage(
    id: id,
    role: role,
    text: text ?? this.text,
    isStreaming: isStreaming ?? this.isStreaming,
    isInterrupted: isInterrupted ?? this.isInterrupted,
    isCrisis: isCrisis,
  );

  @override
  List<Object?> get props => [id, role, text, isStreaming, isInterrupted, isCrisis];
}

/// What the server streams back.
sealed class const ChatEvent();

final class const ChatDelta(final String text) extends ChatEvent;

final class const ChatDone(final List<String> options) extends ChatEvent;

final class const ChatCrisis() extends ChatEvent;

final class const ChatError(final String code) extends ChatEvent;

final RegExp _crisis = RegExp(
  'suic[ií]d|me matar|quero morrer|n[aã]o quero mais viver|acabar com tudo|me machucar|me cortar|'
  'autolesion|automutila|tirar minha vida|kill myself|want to die|end it all|hurt myself|'
  'self[- ]?harm|take my own life|ele me bate|ela me bate|me agrid|me amea[cç]|'
  'tenho medo (dele|dela|do meu)|hits me|beats me|afraid of (him|her|my partner)|threatens me',
  caseSensitive: false,
);

/// Whether [text] may mean the person is in danger; the app then answers itself and sends nothing.
bool looksLikeCrisis(String text) => _crisis.hasMatch(text);
