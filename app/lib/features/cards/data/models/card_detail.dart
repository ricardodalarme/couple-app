import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/sunday_card.dart';

/// One sent card with who wrote it and how the other person answered.
final class const CardDetail({
  required final SundayCard card,
  required final bool isMine,
  final String? authorName,
  final String? recipientName,
  final String? reaction,
  final String? reply,
}) with Equatable {
  @override
  List<Object?> get props => [card, isMine, authorName, recipientName, reaction, reply];
}
