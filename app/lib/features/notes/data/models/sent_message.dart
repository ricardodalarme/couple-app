import 'package:equatable/equatable.dart';

/// The two kinds of message the server accepts.
enum MessageKind() {
  note,
  drawing,
}

/// The longest note the server accepts.
const int noteMaxLength = 280;

/// A note or drawing the user sent to their partner.
final class const SentMessage({
  required final String id,
  required final MessageKind kind,
  required final DateTime createdAt,
  required final bool forWidget,
  final String? body,
  final String? mediaPath,
  final String? imageUrl,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => SentMessage(
    id: 'fake',
    kind: MessageKind.note,
    createdAt: DateTime(2026),
    forWidget: false,
    body: 'Boa sorte hoje',
  );

  @override
  List<Object?> get props => [id, kind, createdAt, forWidget, body, mediaPath, imageUrl];
}
