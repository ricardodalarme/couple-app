import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/data/repositories/history_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';

part 'counter_variations_state.dart';

class CounterVariationsCubit({required final HistoryRepository _historyRepository})
    extends Cubit<CounterVariationsState> {
  this : super(const CounterVariationsState());

  Future<void> load() async {
    if (state.overview is! Success) emit(state.copyWith(overview: const Loading()));
    try {
      final overview = await _historyRepository.getOverview();
      emit(state.copyWith(overview: Success(overview), selectedPhase: overview.phase));
    } catch (exception) {
      if (state.overview is Success) return;
      emit(state.copyWith(overview: Failure.fromObject(exception)));
    }
  }

  Future<void> selectPhase(RelationshipPhase phase) async {
    final currentOverview = switch (state.overview) {
      Success(:final value) => value,
      _ => null,
    };
    emit(state.copyWith(selectedPhase: phase));
    if (currentOverview == null || currentOverview.selfId.isEmpty) return;

    try {
      await _historyRepository.updatePhase(profileId: currentOverview.selfId, phase: phase);
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }
}
