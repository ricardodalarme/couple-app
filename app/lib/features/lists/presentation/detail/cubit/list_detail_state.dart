part of 'list_detail_cubit.dart';

final class const ListDetailState({
  final String? listId,
  final Resource<ListDetail> detail = const Loading(),
  final Resource<void> changeAction = const Initial(),
}) with Equatable {
  String? get title => switch (detail) {
    Success<ListDetail>(:final value) => value.list.title,
    _ => null,
  };

  ListDetailState copyWith({
    String? listId,
    Resource<ListDetail>? detail,
    Resource<void>? changeAction,
  }) {
    return ListDetailState(
      listId: listId ?? this.listId,
      detail: detail ?? this.detail,
      changeAction: changeAction ?? this.changeAction,
    );
  }

  @override
  List<Object?> get props => [listId, detail, changeAction];
}
