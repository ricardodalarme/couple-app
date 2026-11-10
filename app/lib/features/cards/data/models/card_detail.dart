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
  /// A skeleton placeholder, never shown as a real card.
  factory fake() => CardDetail(
    card: SundayCard(
      id: 'fake',
      status: 'sent',
      weekStart: DateTime(2026),
      items: const [
        CardItem(slipId: 'fake', body: 'Uma coisa boa desta semana'),
        CardItem(slipId: 'fake-2', body: 'Outra coisa boa'),
      ],
    ),
    isMine: false,
    authorName: 'Nome',
  );

  @override
  List<Object?> get props => [card, isMine, authorName, recipientName, reaction, reply];
}
