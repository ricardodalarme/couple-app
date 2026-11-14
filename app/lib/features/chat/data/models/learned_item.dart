import 'package:equatable/equatable.dart';

/// The longest learning the server accepts.
const int learnedItemMaxLength = 500;

/// The longest excerpt the server keeps from the reply that started the learning.
const int learnedExcerptMaxLength = 500;

/// What a saved learning is about.
enum LearnedTarget() {
  partnerFact,
  date,
  memory,
  commitment,
}

/// Where a learning is in the person's own review.
enum LearnedStatus() {
  pending,
  confirmed,
  rejected,
}

/// One thing the person chose to keep from a conversation; only its author sees it.
final class const LearnedItem({
  required final String id,
  required final LearnedTarget target,
  required final String text,
  required final LearnedStatus status,
  required final DateTime createdAt,
  final String? excerpt,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => LearnedItem(
    id: 'fake',
    target: LearnedTarget.partnerFact,
    text: 'Prefere café sem açúcar',
    excerpt: 'Da conversa',
    status: LearnedStatus.pending,
    createdAt: DateTime(2026, 11, 11),
  );

  @override
  List<Object?> get props => [id, target, text, excerpt, status, createdAt];
}
