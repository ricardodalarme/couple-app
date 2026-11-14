import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_budget.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_idea_status.dart';

/// The longest gift title the server accepts.
const int giftTitleMaxLength = 120;

/// The longest gift note the server accepts.
const int giftNoteMaxLength = 1000;

/// One wish on a person's gift page.
///
/// When [isShared] is false only the author sees it; when it is true the current
/// partner can read it too. [isMine] is false for items the partner shared.
final class const GiftIdea({
  required final String id,
  required final String title,
  final String? note,
  final GiftBudget? budget,
  final GiftIdeaStatus status = GiftIdeaStatus.idea,
  final bool isShared = false,
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
    isShared: isShared,
    isMine: isMine,
  );

  GiftIdea withShared({required bool isShared}) => GiftIdea(
    id: id,
    title: title,
    note: note,
    budget: budget,
    status: status,
    isShared: isShared,
    isMine: isMine,
  );

  @override
  List<Object?> get props => [id, title, note, budget, status, isShared, isMine];
}
