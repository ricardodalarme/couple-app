import 'dart:async';

import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_entry.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';

part 'slips_list_state.dart';

class SlipsListCubit({required final SlipRepository _slipRepository})
    extends Cubit<SlipsListState> {
  this : super(const SlipsListState());

  StreamSubscription<void>? _changes;

  /// Loads the list and reads it again whenever a slip is saved, undone or sent.
  void start() {
    _changes = _slipRepository.onChanged.listen((_) => load());
    load();
  }

  /// Reads the first page again; the list on screen stays until the new one arrives.
  Future<void> load() async {
    if (state.slips is! Success) emit(state.copyWith(slips: const Loading()));
    try {
      final page = await _slipRepository.getSlips(
        since: _since(state.scope, clock.now()),
        archived: state.scope == SlipsScope.archived,
      );
      emit(
        SlipsListState(
          slips: Success(page.items),
          scope: state.scope,
          hasNext: page.hasNext,
          cursor: page.cursor,
          isSearching: state.isSearching,
          query: state.query,
        ),
      );
    } catch (exception) {
      if (state.slips is Success) return;
      emit(state.copyWith(slips: Failure.fromObject(exception)));
    }
  }

  Future<void> changeScope(SlipsScope scope) async {
    if (scope == state.scope) return;

    emit(SlipsListState(scope: scope, isSearching: state.isSearching, query: state.query));
    await load();
  }

  void openSearch() => emit(state.copyWith(isSearching: true));

  void closeSearch() => emit(state.copyWith(isSearching: false, query: ''));

  void onQueryChanged(String query) => emit(state.copyWith(query: query));

  /// Appends the next page; ignored while one is loading or when there is none.
  Future<void> loadMore() async {
    final current = state.slips;
    if (current is! Success<List<SlipEntry>> || !state.hasNext || state.isLoadingMore) return;

    emit(state.copyWith(isLoadingMore: true));
    try {
      final page = await _slipRepository.getSlips(
        after: state.cursor,
        since: _since(state.scope, clock.now()),
        archived: state.scope == SlipsScope.archived,
      );
      final knownIds = current.value.map((slip) => slip.id).toSet();
      emit(
        SlipsListState(
          slips: Success([
            ...current.value,
            ...page.items.where((slip) => !knownIds.contains(slip.id)),
          ]),
          scope: state.scope,
          hasNext: page.hasNext,
          cursor: page.cursor,
          isSearching: state.isSearching,
          query: state.query,
        ),
      );
    } on Object {
      emit(state.copyWith(isLoadingMore: false));
    }
  }

  @override
  Future<void> close() async {
    await _changes?.cancel();
    return super.close();
  }

  /// Monday 00:00 of the week [now] falls in, or `null` for every slip or the archive.
  static DateTime? _since(SlipsScope scope, DateTime now) {
    if (scope != SlipsScope.week) return null;

    final today = DateTime(now.year, now.month, now.day);

    return today.subtract(Duration(days: today.weekday - DateTime.monday));
  }
}
