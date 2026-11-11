import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/today/data/repositories/today_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';

part 'lock_screen_widget_state.dart';

class LockScreenWidgetCubit({
  required final WidgetsRepository _repository,
  final TodayRepository? _todayRepository,
}) extends Cubit<LockScreenWidgetState> {
  this : super(const LockScreenWidgetState());

  Future<void> load() async {
    emit(state.copyWith(overview: const Loading()));
    try {
      final overview = await _repository.loadAndSync();
      if (isClosed) return;
      emit(state.copyWith(overview: Success(overview)));
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(overview: Failure.fromObject(exception)));
    }
  }

  Future<void> endPause() async {
    emit(state.copyWith(endPauseAction: const Loading()));
    try {
      await _todayRepository?.endPause();
      final overview = await _repository.loadAndSync();
      if (isClosed) return;
      emit(state.copyWith(overview: Success(overview), endPauseAction: const Success(null)));
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(endPauseAction: Failure.fromObject(exception)));
      emit(state.copyWith(endPauseAction: const Initial()));
    }
  }
}
