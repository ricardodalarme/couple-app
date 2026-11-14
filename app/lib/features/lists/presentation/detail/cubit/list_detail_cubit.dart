import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_item_status.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_models.dart';
import 'package:flutter_bloc_starter/features/lists/data/repositories/lists_repository.dart';
import 'package:uuid/uuid.dart';

part 'list_detail_state.dart';

class ListDetailCubit({required final ListsRepository _listsRepository})
    extends Cubit<ListDetailState> {
  this : super(const ListDetailState());

  final Uuid _uuid = const Uuid();

  /// Reads the list and its items; the list on screen stays while it reloads.
  Future<void> load(String listId) async {
    if (state.detail is! Success) emit(state.copyWith(listId: listId, detail: const Loading()));
    try {
      final detail = await _listsRepository.getList(listId);
      emit(state.copyWith(listId: listId, detail: Success(detail)));
    } catch (exception) {
      final failure = Failure.fromObject(exception);
      if (state.detail is! Success || failure.exception.l10nKey == listNotFoundCode) {
        emit(state.copyWith(listId: listId, detail: failure));
      }
    }
  }

  Future<void> refresh() async {
    final listId = state.listId;
    if (listId != null) await load(listId);
  }

  /// Adds the item at the end of the list.
  Future<void> addItem(String title) async {
    final detail = _currentDetail;
    final trimmed = title.trim();
    if (detail == null ||
        trimmed.isEmpty ||
        trimmed.length > listItemTitleMaxLength ||
        state.changeAction.isLoading) {
      return;
    }

    final position = detail.items.isEmpty ? 0 : detail.items.last.position + 1;
    final item = ListItem(
      id: _uuid.v4(),
      listId: detail.list.id,
      title: trimmed,
      status: ListItemStatus.dream,
      position: position,
    );

    await _change(
      previous: detail,
      next: ListDetail(list: detail.list, items: [...detail.items, item]),
      action: () => _listsRepository.addItem(
        id: item.id,
        listId: item.listId,
        title: item.title,
        position: item.position,
      ),
    );
  }

  /// Switches the list between shared and private; only the author can change it.
  Future<void> setVisibility({required bool isShared}) async {
    final detail = _currentDetail;
    if (detail == null || !detail.list.isMine || state.changeAction.isLoading) return;

    String? coupleId;
    try {
      coupleId = isShared ? await _listsRepository.getCoupleId() : null;
    } catch (exception) {
      emit(state.copyWith(changeAction: Failure.fromObject(exception)));
      emit(state.copyWith(changeAction: const Initial()));

      return;
    }
    if (isShared && coupleId == null) return;

    await _change(
      previous: detail,
      next: ListDetail(
        list: detail.list.withCoupleId(coupleId),
        items: detail.items,
        currentCoupleId: detail.currentCoupleId,
      ),
      action: () => _listsRepository.setListVisibility(id: detail.list.id, coupleId: coupleId),
    );
  }

  /// A check marks the item done; unchecking puts it back in the plans.
  Future<void> toggleDone(ListItem item) =>
      setStatus(item, item.isDone ? ListItemStatus.planned : ListItemStatus.done);

  Future<void> setStatus(ListItem item, ListItemStatus status) async {
    final detail = _currentDetail;
    if (detail == null) return;

    await _change(
      previous: detail,
      next: ListDetail(
        list: detail.list,
        items: [
          for (final current in detail.items)
            if (current.id == item.id) current.copyWith(status: status) else current,
        ],
      ),
      action: () => _listsRepository.setItemStatus(id: item.id, status: status),
    );
  }

  /// Moves [item] one place up or down and renumbers every position in order.
  Future<void> move(ListItem item, {required bool up}) async {
    final detail = _currentDetail;
    if (detail == null) return;
    final index = detail.items.indexWhere((current) => current.id == item.id);
    final target = index + (up ? -1 : 1);
    if (index < 0 || target < 0 || target >= detail.items.length) return;

    final reordered = [...detail.items];
    reordered.insert(target, reordered.removeAt(index));
    final previousPositions = {for (final current in detail.items) current.id: current.position};
    final next = [
      for (var index = 0; index < reordered.length; index++)
        reordered[index].copyWith(position: index),
    ];
    final changed = [
      for (final current in next)
        if (previousPositions[current.id] != current.position) current,
    ];

    await _change(
      previous: detail,
      next: ListDetail(list: detail.list, items: next),
      action: () async {
        for (final current in changed) {
          await _listsRepository.setItemPosition(id: current.id, position: current.position);
        }
      },
    );
  }

  Future<void> deleteItem(ListItem item) async {
    final detail = _currentDetail;
    if (detail == null) return;

    await _change(
      previous: detail,
      next: ListDetail(
        list: detail.list,
        items: [
          for (final current in detail.items)
            if (current.id != item.id) current,
        ],
      ),
      action: () => _listsRepository.deleteItem(item.id),
    );
  }

  ListDetail? get _currentDetail => switch (state.detail) {
    Success<ListDetail>(:final value) => value,
    _ => null,
  };

  Future<void> _change({
    required ListDetail previous,
    required ListDetail next,
    required Future<void> Function() action,
  }) async {
    if (state.changeAction.isLoading) return;

    emit(state.copyWith(detail: Success(next), changeAction: const Loading()));
    try {
      await action();
      emit(state.copyWith(changeAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(detail: Success(previous), changeAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(changeAction: const Initial()));
  }
}
