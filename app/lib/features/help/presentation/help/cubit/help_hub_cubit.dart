import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/help/data/repositories/support_repository.dart';

part 'help_hub_state.dart';

class HelpHubCubit({
  required final SupportRepository _repository,
  required final AuthenticationRepository _authenticationRepository,
}) extends Cubit<HelpHubState> {
  this : super(const HelpHubState());

  /// Sends this account's saved requests, then reads what still waits.
  Future<void> load() async {
    emit(state.copyWith(flushAction: const Loading(), discarded: 0));
    final authorId = _authenticationRepository.currentUserId;
    if (authorId == null) {
      emit(state.copyWith(flushAction: const Success(null)));
      return;
    }
    try {
      final dropped = await _repository.flushPending(authorId: authorId);
      final wasDiscarded = await _repository.takeDiscarded();
      emit(
        state.copyWith(
          flushAction: const Success(null),
          pending: _repository.pendingCount(authorId: authorId),
          discarded: dropped > 0 || wasDiscarded ? 1 : 0,
        ),
      );
    } catch (exception) {
      emit(state.copyWith(flushAction: Failure.fromObject(exception)));
    }
  }
}
