import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/data/models/story_event_kind.dart';
import 'package:flutter_bloc_starter/features/history/data/repositories/history_repository.dart';
import 'package:uuid/uuid.dart';

part 'story_dates_state.dart';

class StoryDatesCubit({required final HistoryRepository _historyRepository})
    extends Cubit<StoryDatesState> {
  this : super(const StoryDatesState());

  final Uuid _uuid = const Uuid();

  Future<void> load() async {
    if (state.overview is! Success) emit(state.copyWith(overview: const Loading()));
    try {
      final overview = await _historyRepository.getOverview();
      emit(state.copyWith(overview: Success(overview)));
    } catch (exception) {
      if (state.overview is Success) return;
      emit(state.copyWith(overview: Failure.fromObject(exception)));
    }
  }

  /// Saves one of the four canonical dates the person picked.
  Future<void> saveDate({
    required StoryEventKind kind,
    required String title,
    required DateTime date,
  }) async {
    final currentOverview = switch (state.overview) {
      Success(:final value) => value,
      _ => null,
    };
    if (currentOverview == null || state.saveAction.isLoading) return;

    final entry = switch (kind) {
      StoryEventKind.met => currentOverview.storyDates.met,
      StoryEventKind.dating => currentOverview.storyDates.dating,
      StoryEventKind.engaged => currentOverview.storyDates.engaged,
      StoryEventKind.married => currentOverview.storyDates.married,
      _ => null,
    };

    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _historyRepository.saveStoryDate(
        id: _uuid.v4(),
        profileId: currentOverview.selfId,
        kind: kind,
        title: title,
        date: date,
        existingEventId: entry != null && entry.isMine ? entry.id : null,
        existingEventIsMine: entry?.isMine ?? true,
        coupleId: currentOverview.coupleId,
        updateTogetherSince:
            kind == StoryEventKind.dating ||
            (kind == StoryEventKind.met && currentOverview.togetherSince == null),
      );
      emit(state.copyWith(saveAction: const Success(null)));
      await load();
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(saveAction: const Initial()));
  }
}
