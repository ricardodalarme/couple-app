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
      emit(state.copyWith(plus: Success(plus)));
      if (!plus.hasPlus) await loadPrices();
    } catch (exception) {
      emit(state.copyWith(plus: Failure.fromObject(exception)));
    }
  }

  /// Reads the prices again, for the retry when the store could not be reached.
  Future<void> loadPrices() async {
    emit(state.copyWith(prices: const Loading()));
    try {
      emit(state.copyWith(prices: Success(await _plusRepository.getPrices())));
    } catch (exception) {
      emit(state.copyWith(prices: Failure.fromObject(exception)));
    }
  }
}
