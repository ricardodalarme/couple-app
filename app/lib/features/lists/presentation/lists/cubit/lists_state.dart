part of 'lists_cubit.dart';

final class const ListsState({
  final Resource<List<CoupleList>> lists = const Loading(),
  final String? coupleId,
  final Resource<void> createAction = const Initial(),
  final Resource<void> changeAction = const Initial(),
}) with Equatable {
  List<CoupleList> get currentLists => switch (lists) {
    Success<List<CoupleList>>(:final value) => value,
    _ => const [],
  };

  bool get isShared => coupleId != null;

  ListsState copyWith({
    Resource<List<CoupleList>>? lists,
    String? coupleId,
    Resource<void>? createAction,
    Resource<void>? changeAction,
  }) {
    return ListsState(
      lists: lists ?? this.lists,
      coupleId: coupleId ?? this.coupleId,
      createAction: createAction ?? this.createAction,
      changeAction: changeAction ?? this.changeAction,
    );
  }

  @override
  List<Object?> get props => [lists, coupleId, createAction, changeAction];
}
