import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/connect/data/repositories/connect_repository.dart';

part 'us_state.dart';

class UsCubit({required final ConnectRepository _connectRepository}) extends Cubit<UsState> {
  this : super(const UsState());

  /// Sends "I miss us"; on failure the button stays so it can be tried again.
  Future<void> send() async {
    if (state.sendAction.isLoading || state.wasSent) return;

    emit(state.copyWith(sendAction: const Loading()));
    try {
      await _connectRepository.sendMissUs();
      emit(state.copyWith(sendAction: const Success(null), wasSent: true));
    } catch (exception) {
      emit(state.copyWith(sendAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(sendAction: const Initial()));
  }
}
