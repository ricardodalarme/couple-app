import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_details.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_status.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';

part 'relationship_changed_state.dart';

class RelationshipChangedCubit({required final ProfileRepository _profileRepository})
    extends Cubit<RelationshipChangedState> {
  this : super(const RelationshipChangedState());

  Future<void> load() async {
    emit(state.copyWith(details: const Loading()));
    try {
      final details = await _profileRepository.getRelationshipDetails();
      if (isClosed) return;
      emit(state.copyWith(details: Success(details), selected: details.relationshipStatus));
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(details: Failure.fromObject(exception)));
    }
  }

  /// Keeps the choice on screen until [save] is asked for.
  void choose(RelationshipStatus status) {
    if (state.current == null) return;
    emit(state.copyWith(selected: status));
  }

  /// Writes the choice and resolves whether the page may move on.
  Future<bool> save() async {
    if (state.saveAction.isLoading) return false;

    final current = state.current;
    final status = state.selected;
    if (current == null || status == null) return false;
    if (status == current.relationshipStatus) return true;

    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _profileRepository.updateRelationshipStatus(
        profileId: current.profileId,
        status: status,
      );
      if (isClosed) return false;
      emit(
        state.copyWith(
          details: Success(current.copyWith(relationshipStatus: status)),
          selected: status,
          saveAction: const Success(null),
        ),
      );
      emit(state.copyWith(saveAction: const Initial()));
      return true;
    } catch (exception) {
      if (isClosed) return false;
      emit(
        state.copyWith(
          selected: current.relationshipStatus,
          saveAction: Failure.fromObject(exception),
        ),
      );
      emit(state.copyWith(saveAction: const Initial()));
      return false;
    }
  }
}
