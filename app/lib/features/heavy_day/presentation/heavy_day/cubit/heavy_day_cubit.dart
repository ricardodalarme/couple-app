import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notes/data/repositories/notes_repository.dart';
import 'package:flutter_bloc_starter/features/privacy/data/models/consent.dart';
import 'package:flutter_bloc_starter/features/privacy/data/repositories/privacy_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';

part 'heavy_day_state.dart';

class HeavyDayCubit({
  required final PrivacyRepository _privacyRepository,
  required final ProfileRepository _profileRepository,
  required final NotesRepository _notesRepository,
}) extends Cubit<HeavyDayState> {
  this : super(const HeavyDayState());

  Future<void> load() async {
    emit(state.copyWith(setup: const Loading()));
    try {
      final (consents, settings) = await (
        _privacyRepository.getConsents(),
        _profileRepository.getMySettings(),
      ).wait;
      if (isClosed) return;
      emit(
        state.copyWith(
          setup: Success(
            HeavyDaySetup(
              profileId: settings.profileId,
              hasConsent: consents[ConsentKind.sensitiveTracks] ?? false,
              sharing: settings.heavyDaySharing,
              partnerName: settings.partnerName,
            ),
          ),
        ),
      );
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(setup: Failure.fromObject(exception)));
    }
  }

  /// Records the consent and turns the notice on for the first time.
  Future<bool> activate() async {
    final setup = state.currentSetup;
    if (setup == null || setup.hasConsent || state.action.isLoading) return false;

    emit(state.copyWith(action: const Loading()));
    try {
      await _privacyRepository.setConsent(ConsentKind.sensitiveTracks, granted: true);
      await _profileRepository.updateHeavyDaySharing(
        profileId: setup.profileId,
        sharing: HeavyDaySharing.ask,
      );
      if (isClosed) return false;
      emit(
        state.copyWith(
          setup: Success(setup.copyWith(hasConsent: true, sharing: HeavyDaySharing.ask)),
          action: const Success(null),
        ),
      );

      return true;
    } catch (exception) {
      if (isClosed) return false;
      emit(state.copyWith(action: Failure.fromObject(exception)));
      emit(state.copyWith(action: const Initial()));

      return false;
    }
  }

  Future<bool> setSharing(HeavyDaySharing sharing) async {
    final setup = state.currentSetup;
    if (setup == null || !setup.hasConsent || state.action.isLoading) return false;

    emit(state.copyWith(action: const Loading()));
    try {
      await _profileRepository.updateHeavyDaySharing(profileId: setup.profileId, sharing: sharing);
      if (isClosed) return false;
      emit(
        state.copyWith(
          setup: Success(setup.copyWith(sharing: sharing)),
          action: const Success(null),
        ),
      );

      return true;
    } catch (exception) {
      if (isClosed) return false;
      emit(state.copyWith(action: Failure.fromObject(exception)));
      emit(state.copyWith(action: const Initial()));

      return false;
    }
  }

  /// Sends the fixed widget note; the page passes the localized sentence.
  Future<bool> share({required String body}) async {
    final setup = state.currentSetup;
    if (setup == null || !setup.hasConsent || state.action.isLoading) return false;

    emit(state.copyWith(action: const Loading()));
    try {
      await _notesRepository.sendNote(body: body, forWidget: true);
      if (isClosed) return false;
      emit(state.copyWith(action: const Success(null), isSent: true));

      return true;
    } catch (exception) {
      if (isClosed) return false;
      emit(state.copyWith(action: Failure.fromObject(exception)));
      emit(state.copyWith(action: const Initial()));

      return false;
    }
  }
}
