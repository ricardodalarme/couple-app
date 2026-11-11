import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/discreet/cubit/discreet_mode_cubit.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';

part 'widget_states_state.dart';

class WidgetStatesCubit({
  required final WidgetsRepository _repository,
  final DiscreetModeCubit? _discreetModeCubit,
}) extends Cubit<WidgetStatesState> {
  this : super(const WidgetStatesState());

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

  void setDarkPreview({required bool isDark}) {
    if (state.isDarkPreview == isDark) return;
    emit(state.copyWith(isDarkPreview: isDark));
  }

  Future<void> toggleDiscreet({required bool discreet}) async {
    final current = switch (state.overview) {
      Success(:final value) => value,
      _ => null,
    };
    emit(state.copyWith(discreetToggleAction: const Loading()));
    try {
      final cubit = _discreetModeCubit;
      final updatedPayload = cubit != null
          ? await cubit.setHideWidgetText(value: discreet)
          : await _repository.applyDiscreetModeImmediately(discreet: discreet);
      if (updatedPayload == null) throw Exception('Discreet mode save failed');
      if (isClosed) return;
      if (current != null) {
        emit(
          state.copyWith(
            overview: Success(
              current.copyWith(
                payload: updatedPayload,
                preferences: current.preferences.copyWith(hideInDiscreet: discreet),
              ),
            ),
            discreetToggleAction: const Success(null),
          ),
        );
      } else {
        emit(state.copyWith(discreetToggleAction: const Success(null)));
      }
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(discreetToggleAction: Failure.fromObject(exception)));
      emit(state.copyWith(discreetToggleAction: const Initial()));
    }
  }
}
