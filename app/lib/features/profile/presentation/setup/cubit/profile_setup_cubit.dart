import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';

part 'profile_setup_state.dart';

const int maxNameLength = 30;

/// The earliest relationship date the form accepts.
final DateTime earliestTogetherSince = DateTime(1950);

final RegExp _emoji = RegExp(
  '[\u{1F000}-\u{1FFFF}\u{2190}-\u{21FF}\u{2300}-\u{23FF}\u{2600}-\u{27BF}\u{2B00}-\u{2BFF}'
  '\u{FE0F}\u{200D}]',
  unicode: true,
);

class ProfileSetupCubit({
  required final ProfileRepository _profileRepository,
  required final SettingsRepository _settingsRepository,
}) extends Cubit<ProfileSetupState> {
  this : super(const ProfileSetupState());

  /// Removes emoji, trims and caps a typed name at [maxNameLength] characters.
  static String sanitizeName(String value) {
    final clean = value.replaceAll(_emoji, '').trim();
    final runes = clean.runes.toList();

    return runes.length <= maxNameLength
        ? clean
        : String.fromCharCodes(runes.take(maxNameLength)).trim();
  }

  void onNameChanged(String name) => emit(state.copyWith(name: name));

  void onPartnerNameChanged(String name) => emit(state.copyWith(partnerName: name));

  void onThemeChanged(AppThemeVariant theme) => emit(state.copyWith(theme: theme));

  void onDateChanged(DateTime date) => emit(state.copyWith(togetherSince: date));

  Future<void> save() async {
    if (!state.canSave || state.saveAction.isLoading) return;

    final date = state.togetherSince;
    if (date != null && (date.isAfter(DateTime.now()) || date.isBefore(earliestTogetherSince))) {
      emit(state.copyWith(saveAction: const Failure(LocalizedException(l10nKey: 'INVALID_DATE'))));
      emit(state.copyWith(saveAction: const Initial()));
      return;
    }

    emit(state.copyWith(saveAction: const Loading()));
    try {
      final profile = await _profileRepository.getMyProfile();
      final partner = sanitizeName(state.partnerName);
      await _profileRepository.saveProfileSetup(
        profileId: profile.id,
        displayName: sanitizeName(state.name),
        theme: state.theme,
        partnerName: partner.isEmpty ? null : partner,
        togetherSince: date,
      );
      final settings = _settingsRepository.get();
      await _settingsRepository.save(settings.copyWith(themeVariant: state.theme.name));
      emit(state.copyWith(saveAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }
}
