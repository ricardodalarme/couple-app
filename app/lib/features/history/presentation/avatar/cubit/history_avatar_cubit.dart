import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/data/repositories/history_repository.dart';

part 'history_avatar_state.dart';

class HistoryAvatarCubit({required final HistoryRepository _historyRepository})
    extends Cubit<HistoryAvatarState> {
  this : super(const HistoryAvatarState());

  Future<void> load() async {
    if (state.overview is! Success) emit(state.copyWith(overview: const Loading()));
    try {
      final overview = await _historyRepository.getOverview();
      emit(state.copyWith(overview: Success(overview), selectedKind: AvatarKind.initials));
    } catch (exception) {
      if (state.overview is Success) return;
      emit(state.copyWith(overview: Failure.fromObject(exception)));
    }
  }

  void selectKind(AvatarKind kind) => emit(state.copyWith(selectedKind: kind));

  Future<void> save() async {
    if (state.saveAction.isLoading) return;
    final currentOverview = switch (state.overview) {
      Success(:final value) => value,
      _ => null,
    };
    if (currentOverview == null || currentOverview.selfId.isEmpty) {
      emit(state.copyWith(saveAction: const Success(null)));
      return;
    }

    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _historyRepository.updateAvatarKind(
        profileId: currentOverview.selfId,
        kind: state.selectedKind,
      );
      emit(state.copyWith(saveAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }
}
