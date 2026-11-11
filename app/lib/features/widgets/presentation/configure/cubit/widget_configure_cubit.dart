import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';

part 'widget_configure_state.dart';

class WidgetConfigureCubit({required final WidgetsRepository _repository})
    extends Cubit<WidgetConfigureState> {
  this : super(const WidgetConfigureState());

  Future<void> load() async {
    emit(state.copyWith(overview: const Loading()));
    try {
      final overview = await _repository.loadAndSync();
      if (isClosed) return;
      emit(state.copyWith(overview: Success(overview), draft: overview.preferences));
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(overview: Failure.fromObject(exception)));
    }
  }

  void setContentSource(WidgetContentSource contentSource) {
    emit(state.copyWith(draft: state.draft.copyWith(contentSource: contentSource)));
  }

  void setRotationCadence(WidgetRotationCadence rotationCadence) {
    emit(state.copyWith(draft: state.draft.copyWith(rotationCadence: rotationCadence)));
  }

  void setShowNames({required bool value}) {
    emit(state.copyWith(draft: state.draft.copyWith(showNames: value)));
  }

  void setHideInDiscreet({required bool value}) {
    emit(state.copyWith(draft: state.draft.copyWith(hideInDiscreet: value)));
  }

  void setAllowPartnerNotes({required bool value}) {
    emit(state.copyWith(draft: state.draft.copyWith(allowPartnerNotes: value)));
  }

  void setOnLockScreen({required bool value}) {
    emit(state.copyWith(draft: state.draft.copyWith(onLockScreen: value)));
  }

  Future<void> save() async {
    emit(state.copyWith(saveAction: const Loading()));
    try {
      final updated = await _repository.savePreferences(state.draft);
      if (isClosed) return;
      emit(
        state.copyWith(
          overview: Success(updated),
          draft: updated.preferences,
          saveAction: const Success(null),
        ),
      );
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }
}
