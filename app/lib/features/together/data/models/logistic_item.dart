import 'package:equatable/equatable.dart';

/// One practical thing the couple shares; an unset [assigneeId] means both of them.
final class const LogisticItem({
  required final String id,
  required final String title,
  final String? assigneeId,
  final bool isDone = false,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => const LogisticItem(id: 'fake', title: 'Comprar pão');

  LogisticItem copyWith({String? assigneeId, bool clearAssignee = false, bool? isDone}) =>
      LogisticItem(
        id: id,
        title: title,
        assigneeId: clearAssignee ? null : assigneeId ?? this.assigneeId,
        isDone: isDone ?? this.isDone,
      );

  @override
  List<Object?> get props => [id, title, assigneeId, isDone];
}

/// The longest title the server accepts.
const int logisticTitleMaxLength = 120;
