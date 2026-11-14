import 'package:equatable/equatable.dart';

/// A one-tap message from the partner that the person has not answered yet.
final class const ReceivedSignal({
  required final String id,
  required final SignalKind kind,
  required final DateTime createdAt,
  final String? value,
  final String? body,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => ReceivedSignal(
    id: 'fake',
    kind: SignalKind.repair,
    createdAt: DateTime(2026),
    body: 'Podemos recomeçar?',
  );

  @override
  List<Object?> get props => [id, kind, createdAt, value, body];
}

/// How a person can answer a repair message, matching the server responses.
enum RepairResponse() {
  talk,
  moreTime,
  later,
}

/// What a one-tap message to the partner is about.
enum SignalKind() {
  need,
  missUs,
  hug,
  distance,
  repair,
  heavyDay,
  goodNews,
}
