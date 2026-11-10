import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';

part 'unpair_done_state.dart';

class UnpairDoneCubit({required final PairingRepository _pairingRepository})
    extends Cubit<UnpairDoneState> {
  this : super(const UnpairDoneState());

  Future<void> chooseSharedItems(SharedItemsChoice choice) async {
    if (state.resolveAction.isLoading) return;

    emit(state.copyWith(choice: choice, resolveAction: const Loading()));
    try {
      await _pairingRepository.resolveSharedItems(keep: choice.shouldKeep);
      emit(state.copyWith(resolveAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(resolveAction: Failure.fromObject(exception)));
    }
  }
}
