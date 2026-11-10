import 'package:equatable/equatable.dart';

/// One slip on a card.
final class const CardItem({
  required final String slipId,
  required final String body,
  final String? category,
  final DateTime? writtenAt,
}) with Equatable {
  @override
  List<Object?> get props => [slipId, body, category, writtenAt];
}

/// The weekly card, in any state from draft to sent.
final class const SundayCard({
  required final String id,
  required final String status,
  required final DateTime weekStart,
  required final List<CardItem> items,
  final String? note,
  final DateTime? sentAt,
}) with Equatable {
  /// Whether the person can still change the card.
  bool get isDraft => status == 'draft';

  SundayCard copyWith({List<CardItem>? items, String? note}) => SundayCard(
    id: id,
    status: status,
    weekStart: weekStart,
    items: items ?? this.items,
    note: note ?? this.note,
    sentAt: sentAt,
  );

  @override
  List<Object?> get props => [id, status, weekStart, items, note, sentAt];
}
