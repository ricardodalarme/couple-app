import 'package:equatable/equatable.dart';

/// The list kinds the server accepts, in the order they are offered.
const List<String> listKinds = ['travel', 'restaurants', 'movies', 'custom'];

/// The item states the server accepts.
const List<String> listItemStatuses = ['dream', 'planned', 'done'];

/// The longest list title the server accepts.
const int listTitleMaxLength = 80;

/// The longest item title the server accepts.
const int listItemTitleMaxLength = 160;

/// The code reported when a list no longer exists.
const String listNotFoundCode = 'NOT_FOUND';

/// One shared list of things the couple wants to do together.
final class const CoupleList({
  required final String id,
  required final String title,
  required final String kind,
  final String? coupleId,
  final bool isMine = false,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() =>
      const CoupleList(id: 'fake', title: 'Viagens dos nossos sonhos', kind: 'travel');

  /// Whether the partner can see and change this list.
  bool get isShared => coupleId != null;

  CoupleList copyWith({String? title, String? kind, bool? isMine}) => CoupleList(
    id: id,
    title: title ?? this.title,
    kind: kind ?? this.kind,
    coupleId: coupleId,
    isMine: isMine ?? this.isMine,
  );

  CoupleList withCoupleId(String? coupleId) =>
      CoupleList(id: id, title: title, kind: kind, coupleId: coupleId, isMine: isMine);

  @override
  List<Object?> get props => [id, title, kind, coupleId, isMine];
}

/// One thing inside a [CoupleList].
final class const ListItem({
  required final String id,
  required final String listId,
  required final String title,
  required final String status,
  required final int position,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() =>
      const ListItem(id: 'fake', listId: 'fake', title: 'Lisboa', status: 'planned', position: 0);

  bool get isDone => status == 'done';

  ListItem copyWith({String? title, String? status, int? position}) => ListItem(
    id: id,
    listId: listId,
    title: title ?? this.title,
    status: status ?? this.status,
    position: position ?? this.position,
  );

  @override
  List<Object?> get props => [id, listId, title, status, position];
}

/// A list together with its items, in display order.
final class const ListDetail({
  required final CoupleList list,
  required final List<ListItem> items,
  final String? currentCoupleId,
}) with Equatable {
  @override
  List<Object?> get props => [list, items, currentCoupleId];
}
