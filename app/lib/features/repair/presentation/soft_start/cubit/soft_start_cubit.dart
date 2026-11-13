import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';

part 'soft_start_state.dart';

class SoftStartCubit() extends Cubit<SoftStartState> {
  this : super(const SoftStartState());

  void onFeelingChanged(String value) => emit(state.copyWith(feeling: FormInput(value)));

  void onSituationChanged(String value) => emit(state.copyWith(situation: FormInput(value)));

  void onNeedChanged(String value) => emit(state.copyWith(need: FormInput(value)));

  bool validate() {
    final validatedFeeling = state.feeling.validate(NonEmptyValidator());
    final validatedSituation = state.situation.validate(NonEmptyValidator());
    final validatedNeed = state.need.validate(NonEmptyValidator());

    emit(
      state.copyWith(feeling: validatedFeeling, situation: validatedSituation, need: validatedNeed),
    );

    return validatedFeeling.isValid && validatedSituation.isValid && validatedNeed.isValid;
  }
}
