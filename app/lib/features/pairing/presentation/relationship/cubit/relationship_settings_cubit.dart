import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_details.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';

part 'relationship_settings_state.dart';

class RelationshipSettingsCubit({
  required final ProfileRepository _profileRepository,
  required final PairingRepository _pairingRepository,
}) extends Cubit<RelationshipSettingsState> {
  this : super(const RelationshipSettingsState());

  Future<void>? _phaseSave;
  Future<void>? _dateSave;
  bool _isClosing = false;

  bool get _canEmit => !isClosed && !_isClosing;

  Future<void> load() async {
    emit(state.copyWith(details: const Loading()));
    try {
      final details = await _profileRepository.getRelationshipDetails();
      if (!_canEmit) return;
      emit(state.copyWith(details: Success(details)));
      await loadPartner();
    } catch (exception) {
      if (!_canEmit) return;
      emit(state.copyWith(details: Failure.fromObject(exception)));
    }
  }

  /// Reads the partner again so a failed read can be retried without losing the page.
  Future<void> loadPartner() async {
    final current = state.current;
    if (current == null) return;

    try {
      final partner = await _pairingRepository.getPartner();
      if (!_canEmit) return;
      final displayName = partner?.displayName;
      emit(
        state.copyWith(
          details: Success(
            current.copyWith(partnerName: displayName, clearPartnerName: displayName == null),
          ),
          hasPartner: partner != null,
          partnerLoadFailed: false,
        ),
      );
    } on Object {
      if (!_canEmit) return;
      emit(state.copyWith(partnerLoadFailed: true));
    }
  }

  Future<void> onPhaseChanged(RelationshipPhase phase) async {
    if (_phaseSave case final pending?) await pending;

    final current = state.current;
    if (current == null || current.phase == phase || !_canEmit) return;

    emit(
      state.copyWith(
        details: Success(current.copyWith(phase: phase)),
        saveAction: const Loading(),
      ),
    );
    final future = _savePhase(current, phase);
    _phaseSave = future;
    try {
      await future;
    } finally {
      if (identical(_phaseSave, future)) _phaseSave = null;
    }
  }

  Future<void> _savePhase(RelationshipDetails previous, RelationshipPhase phase) async {
    try {
      await _profileRepository.updateRelationshipPhase(profileId: previous.profileId, phase: phase);
      if (!_canEmit) return;
      emit(state.copyWith(saveAction: const Success(null)));
      emit(state.copyWith(saveAction: const Initial()));
    } catch (exception) {
      if (!_canEmit) return;
      final latest = state.current ?? previous;
      emit(
        state.copyWith(
          details: Success(
            latest.copyWith(phase: previous.phase, clearPhase: previous.phase == null),
          ),
          saveAction: Failure.fromObject(exception),
        ),
      );
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  Future<void> onDateChanged(DateTime togetherSince) async {
    if (_dateSave case final pending?) await pending;

    final current = state.current;
    if (current == null || current.togetherSince == togetherSince || !_canEmit) return;

    emit(
      state.copyWith(
        details: Success(current.copyWith(togetherSince: togetherSince)),
        saveAction: const Loading(),
      ),
    );
    final future = _saveDate(current, togetherSince);
    _dateSave = future;
    try {
      await future;
    } finally {
      if (identical(_dateSave, future)) _dateSave = null;
    }
  }

  Future<void> _saveDate(RelationshipDetails previous, DateTime togetherSince) async {
    try {
      await _profileRepository.updateTogetherSince(
        profileId: previous.profileId,
        togetherSince: togetherSince,
      );
      if (!_canEmit) return;
      emit(state.copyWith(saveAction: const Success(null)));
      emit(state.copyWith(saveAction: const Initial()));
    } catch (exception) {
      if (!_canEmit) return;
      final latest = state.current ?? previous;
      emit(
        state.copyWith(
          details: Success(
            latest.copyWith(
              togetherSince: previous.togetherSince,
              clearTogetherSince: previous.togetherSince == null,
            ),
          ),
          saveAction: Failure.fromObject(exception),
        ),
      );
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  @override
  Future<void> close() async {
    _isClosing = true;
    await _phaseSave;
    await _dateSave;
    return super.close();
  }
}
