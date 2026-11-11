import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/memories/data/models/memory.dart';
import 'package:flutter_bloc_starter/features/memories/data/repositories/memories_repository.dart';

part 'places_state.dart';

class PlacesCubit({required final MemoriesRepository _memoriesRepository})
    extends Cubit<PlacesState> {
  this : super(const PlacesState());

  Future<void> load() async {
    if (state.places is! Success) emit(state.copyWith(places: const Loading()));
    try {
      final memories = await _memoriesRepository.getMemories();
      emit(state.copyWith(places: Success(groupByPlace(memories))));
    } catch (exception) {
      if (state.places is Success) return;
      emit(state.copyWith(places: Failure.fromObject(exception)));
    }
  }
}
