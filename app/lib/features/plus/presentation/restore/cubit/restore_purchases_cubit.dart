import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';

part 'restore_purchases_state.dart';

class RestorePurchasesCubit({required final PlusRepository _plusRepository})
    extends Cubit<RestorePurchasesState> {
  this : super(const RestorePurchasesState());

  /// Re-applies store purchases and waits for the server to confirm.
  Future<void> restore() async {
    if (state.restoreAction.isLoading) return;

    emit(state.copyWith(restoreAction: const Loading()));
    try {
      final outcome = await _plusRepository.restorePurchases();
      if (isClosed) return;
      emit(state.copyWith(restoreAction: Success(outcome)));
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(restoreAction: Failure.fromObject(exception)));
    }
  }
}
