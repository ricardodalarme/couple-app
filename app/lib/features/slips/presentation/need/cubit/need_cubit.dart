import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';

part 'need_state.dart';

/// The gentle needs a person can ask for, matching the wording on the need screen.
const List<String> needOptions = ['hug', 'talk', 'help_home', 'quiet', 'time_together', 'rest'];

class NeedCubit({required final SlipRepository _slipRepository}) extends Cubit<NeedState> {
  this : super(const NeedState());

  void onNeedToggled(String need) {
    final isSame = state.need == need;
    emit(state.copyWith(need: isSame ? null : need, clearNeed: isSame));
  }

  Future<void> send() async {
    final need = state.need;
    if (need == null || state.sendAction.isLoading || state.sendAction is Success) return;

    emit(state.copyWith(sendAction: const Loading()));
    try {
      await _slipRepository.sendNeed(need);
      emit(state.copyWith(sendAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(sendAction: Failure.fromObject(exception)));
      emit(state.copyWith(sendAction: const Initial()));
    }
  }
}
