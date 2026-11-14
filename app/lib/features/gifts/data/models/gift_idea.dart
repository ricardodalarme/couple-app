import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_budget.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_idea_status.dart';

/// The longest gift title the server accepts.
const int giftTitleMaxLength = 120;

/// The longest gift note the server accepts.
const int giftNoteMaxLength = 1000;

/// One wish on a person's gift page.
///
/// A null [coupleId] means only the author sees it; a set one means the current
/// partner can read it too. [isMine] is false for items the partner shared.
final class const GiftIdea({
  required final String id,
  required final String title,
  final String? note,
  final GiftBudget? budget,
  final GiftIdeaStatus status = GiftIdeaStatus.idea,
  final String? coupleId,
  final bool isMine = false,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => const GiftIdea(
    id: 'fake',
    title: 'Livro de poemas',
    note: 'Capa dura',
    budget: GiftBudget.low,
    isMine: true,
  );

  /// Whether the partner can see this wish.
  bool get isShared => coupleId != null;

  GiftIdea withDetails({
    required String title,
    required String? note,
    required GiftBudget? budget,
  }) => GiftIdea(
    id: id,
    title: title,
    note: note,
    budget: budget,
    status: status,
    coupleId: coupleId,
    isMine: isMine,
  );

  GiftIdea withCoupleId(String? coupleId) => GiftIdea(
    id: id,
    title: title,
    note: note,
    budget: budget,
    status: status,
    coupleId: coupleId,
    isMine: isMine,
  );

  @override
  List<Object?> get props => [id, title, note, budget, status, coupleId, isMine];
}
