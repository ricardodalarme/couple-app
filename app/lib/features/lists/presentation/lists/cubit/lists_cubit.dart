import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_kind.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_models.dart';
import 'package:flutter_bloc_starter/features/lists/data/repositories/lists_repository.dart';
import 'package:uuid/uuid.dart';

part 'lists_state.dart';

class ListsCubit({required final ListsRepository _listsRepository}) extends Cubit<ListsState> {
  this : super(const ListsState());

  final Uuid _uuid = const Uuid();

  /// Reads the couple's lists and whether they are shared with a partner.
  Future<void> load() async {
    if (state.lists is! Success) emit(state.copyWith(lists: const Loading()));
    try {
      final coupleId = await _listsRepository.getCoupleId();
      final lists = await _listsRepository.getLists();
      emit(state.copyWith(lists: Success(lists), coupleId: coupleId));
    } catch (exception) {
      if (state.lists is Success) return;
      emit(state.copyWith(lists: Failure.fromObject(exception)));
    }
  }

  /// Adds the list on screen first and puts the previous read back if the server refuses it.
  Future<void> create({
    required String title,
    required ListKind kind,
    required bool isShared,
  }) async {
    final trimmed = title.trim();
    if (trimmed.isEmpty ||
        trimmed.length > listTitleMaxLength ||
        state.createAction.isLoading ||
        state.lists is! Success) {
      return;
    }

    final previous = state.lists;
    emit(state.copyWith(createAction: const Loading()));
    try {
      final coupleId = isShared ? await _listsRepository.getCoupleId() : null;
      final list = CoupleList(
        id: _uuid.v4(),
        title: trimmed,
        kind: kind,
        coupleId: coupleId,
        isMine: true,
      );
      emit(state.copyWith(lists: Success([list, ...state.currentLists])));
      await _listsRepository.createList(
        id: list.id,
        title: trimmed,
        kind: kind,
        coupleId: coupleId,
      );
      emit(state.copyWith(createAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(lists: previous, createAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(createAction: const Initial()));
  }

  Future<void> rename(CoupleList list, String title) async {
    final trimmed = title.trim();
    if (trimmed.isEmpty || trimmed.length > listTitleMaxLength || state.changeAction.isLoading) {
      return;
    }

    final previous = state.currentLists;
    await _change(
      previous: previous,
      next: [
        for (final item in previous)
          if (item.id == list.id) item.copyWith(title: trimmed) else item,
      ],
      action: () => _listsRepository.renameList(id: list.id, title: trimmed),
    );
  }

  Future<void> delete(CoupleList list) => _change(
    previous: state.currentLists,
    next: [
      for (final item in state.currentLists)
        if (item.id != list.id) item,
    ],
    action: () => _listsRepository.deleteList(list.id),
  );

  Future<void> _change({
    required List<CoupleList> previous,
    required List<CoupleList> next,
    required Future<void> Function() action,
  }) async {
    if (state.changeAction.isLoading) return;

    emit(state.copyWith(lists: Success(next), changeAction: const Loading()));
    try {
      await action();
      emit(state.copyWith(changeAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(lists: Success(previous), changeAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(changeAction: const Initial()));
  }
}
