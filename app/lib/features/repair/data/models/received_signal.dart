import 'package:equatable/equatable.dart';

/// A one-tap message from the partner that the person has not answered yet.
final class const ReceivedSignal({
  required final String id,
  required final String kind,
  required final DateTime createdAt,
  final String? value,
  final String? body,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => ReceivedSignal(
    id: 'fake',
    kind: 'repair',
    createdAt: DateTime(2026),
    body: 'Podemos recomeçar?',
  );

  @override
  List<Object?> get props => [id, kind, createdAt, value, body];
}

/// How a person can answer a repair message, matching the server responses.
const List<String> repairResponses = ['talk', 'more_time', 'later'];
