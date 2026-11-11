import 'package:equatable/equatable.dart';

/// The budgets the server accepts, in the order they are offered.
const List<String> giftBudgets = ['free', 'low', 'medium', 'high'];

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
  final String? budget,
  final String status = 'idea',
  final String? coupleId,
  final bool isMine = false,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => const GiftIdea(
    id: 'fake',
    title: 'Livro de poemas',
    note: 'Capa dura',
    budget: 'low',
    isMine: true,
  );

  /// Whether the partner can see this wish.
  bool get isShared => coupleId != null;

  GiftIdea withDetails({required String title, required String? note, required String? budget}) =>
      GiftIdea(
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
