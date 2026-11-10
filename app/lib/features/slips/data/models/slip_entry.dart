import 'package:equatable/equatable.dart';

/// A slip as shown in the list.
final class const SlipEntry({
  required final String id,
  required final String body,
  required final DateTime createdAt,
  final String? category,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => SlipEntry(id: 'fake', body: 'Fez café sem eu pedir', createdAt: DateTime(2026));

  @override
  List<Object?> get props => [id, body, createdAt, category];
}

/// One page of slips and where the next one starts.
final class const SlipPage({
  required final List<SlipEntry> items,
  required final bool hasNext,
  final String? cursor,
}) with Equatable {
  @override
  List<Object?> get props => [items, hasNext, cursor];
}
