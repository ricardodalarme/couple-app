import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/distance/data/models/distance_info.dart';
import 'package:flutter_bloc_starter/features/distance/data/repositories/distance_repository.dart';

part 'distance_state.dart';

class DistanceCubit({required final DistanceRepository _distanceRepository})
    extends Cubit<DistanceState> {
  this : super(const DistanceState());

  Future<void> load() async {
    if (state.distance is! Success) emit(state.copyWith(distance: const Loading()));
    try {
      emit(state.copyWith(distance: Success(await _distanceRepository.getDistance())));
    } catch (exception) {
      if (state.distance is Success) return;
      emit(state.copyWith(distance: Failure.fromObject(exception)));
    }
  }
}
