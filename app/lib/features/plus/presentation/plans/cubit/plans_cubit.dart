import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';

part 'plans_state.dart';

class PlansCubit({required final PlusRepository _plusRepository}) extends Cubit<PlansState> {
  this : super(const PlansState());

  /// Reads what the person has and, if they do not have Plus, the plan prices from the store.
  Future<void> load() async {
    emit(const PlansState());
    try {
      final plus = await _plusRepository.getPlus();
      if (isClosed) return;
      emit(state.copyWith(plus: Success(plus)));
      if (!plus.hasPlus) await loadPrices();
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(plus: Failure.fromObject(exception)));
    }
  }

  void onPlanChosen(String id) => emit(state.copyWith(chosenId: id));

  /// Buys the chosen plan; a cancelled purchase returns silently.
  Future<void> purchase() async {
    final id = state.chosenId;
    if (id == null || state.purchaseAction.isLoading) return;

    emit(state.copyWith(purchaseAction: const Loading()));
    try {
      final outcome = await _plusRepository.purchase(id);
      if (isClosed) return;
      if (outcome == PurchaseOutcome.cancelled) {
        emit(state.copyWith(purchaseAction: const Initial()));
        return;
      }
      emit(state.copyWith(purchaseAction: Success(outcome)));
      if (outcome == PurchaseOutcome.unlocked) {
        final plus = await _plusRepository.getPlus();
        if (isClosed) return;
        emit(state.copyWith(plus: Success(plus)));
      }
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(purchaseAction: Failure.fromObject(exception)));
      if (isClosed) return;
      emit(state.copyWith(purchaseAction: const Initial()));
    }
  }

  /// Reads the prices again, for the retry when the store could not be reached.
  Future<void> loadPrices() async {
    emit(state.copyWith(prices: const Loading()));
    try {
      final prices = await _plusRepository.getPrices();
      if (isClosed) return;
      emit(state.copyWith(prices: Success(prices)));
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(prices: Failure.fromObject(exception)));
    }
  }
}
