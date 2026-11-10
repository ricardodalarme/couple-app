import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'soft_start_state.dart';

class SoftStartCubit() extends Cubit<SoftStartState> {
  this : super(const SoftStartState());

  void onFeelingChanged(String value) => emit(state.copyWith(feeling: value));

  void onSituationChanged(String value) => emit(state.copyWith(situation: value));

  void onNeedChanged(String value) => emit(state.copyWith(need: value));
}
