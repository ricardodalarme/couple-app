import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';

part 'partner_note_widget_state.dart';

class PartnerNoteWidgetCubit({required final WidgetsRepository _repository})
    extends Cubit<PartnerNoteWidgetState> {
  this : super(const PartnerNoteWidgetState());

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

  Future<void> setAllowPartnerNotes({required bool allow}) async {
    final current = switch (state.overview) {
      Success(:final value) => value,
      _ => null,
    };
    if (current == null) return;

    emit(state.copyWith(toggleAction: const Loading()));
    try {
      final updatedPrefs = current.preferences.copyWith(allowPartnerNotes: allow);
      final updatedOverview = await _repository.savePreferences(updatedPrefs);
      if (isClosed) return;
      emit(state.copyWith(overview: Success(updatedOverview), toggleAction: const Success(null)));
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(toggleAction: Failure.fromObject(exception)));
      emit(state.copyWith(toggleAction: const Initial()));
    }
  }
}
