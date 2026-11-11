import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';

part 'card_encounter_widget_state.dart';

class CardEncounterWidgetCubit({required final WidgetsRepository _repository})
    extends Cubit<CardEncounterWidgetState> {
  this : super(const CardEncounterWidgetState());

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
}
