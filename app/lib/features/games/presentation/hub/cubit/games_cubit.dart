import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/games/data/models/games_overview.dart';
import 'package:flutter_bloc_starter/features/games/data/repositories/games_repository.dart';

part 'games_state.dart';

class GamesCubit({required final GamesRepository _repository}) extends Cubit<GamesState> {
  this : super(const GamesState());

  /// Reads the games and their latest sessions, again on resume or pull to refresh.
  Future<void> load() async {
    if (isClosed) return;
    if (state.overview is! Success) emit(state.copyWith(overview: const Loading()));
    try {
      final overview = await _repository.getOverview();
      if (isClosed) return;
      emit(state.copyWith(overview: Success(overview)));
    } catch (exception) {
      if (isClosed || state.overview is Success) return;
      emit(state.copyWith(overview: Failure.fromObject(exception)));
    }
  }
}
