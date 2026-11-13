import 'dart:async';

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile_details.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile_name.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:form_inputs/form_inputs.dart';

part 'profile_settings_state.dart';

const Duration _editDebounce = Duration(milliseconds: 600);
const int maxPronounsLength = 30;

class ProfileSettingsCubit({
  required final ProfileRepository _profileRepository,
  required final AuthenticationRepository _authenticationRepository,
  required final SettingsRepository _settingsRepository,
}) extends Cubit<ProfileSettingsState> {
  this : super(const ProfileSettingsState());

  Timer? _nameTimer;
  Timer? _pronounsTimer;
  Future<void>? _nameSave;
  Future<void>? _pronounsSave;
  Future<void>? _themeSave;
  Future<void>? _timeZoneSave;
  String _savedName = '';
  String? _savedPronouns;
  bool _isClosing = false;

  bool get _canEmit => !isClosed && !_isClosing;

  Future<void> load() async {
    emit(state.copyWith(details: const Loading()));
    try {
      final details = await _profileRepository.getProfileDetails();
      _savedName = details.displayName;
      _savedPronouns = details.pronouns;
      await _rememberLocalTheme(details.theme);
      if (!_canEmit) return;
      emit(
        state.copyWith(
          details: Success(details),
          nameDraft: FormInput(details.displayName),
          pronounsDraft: FormInput(details.pronouns ?? ''),
          loginProvider: _authenticationRepository.loginProvider,
        ),
      );
    } catch (exception) {
      if (!_canEmit) return;
      emit(state.copyWith(details: Failure.fromObject(exception)));
    }
  }

  void onNameChanged(String value) {
    if (!_canEmit) return;

    _nameTimer?.cancel();
    emit(state.copyWith(nameDraft: FormInput(value)));
    if (sanitizeDisplayName(value).isEmpty) {
      _validateName();
      return;
    }

    _nameTimer = Timer(_editDebounce, saveName);
  }

  Future<void> saveName() async {
    _nameTimer?.cancel();
    if (_nameSave case final pending?) await pending;

    final current = state.current;
    if (current == null || !_canEmit) return;
    if (!_validateName()) return;

    final name = sanitizeDisplayName(state.nameDraft?.value ?? current.displayName);
    if (name.isEmpty) return;
    if (name == _savedName) {
      emit(state.copyWith(nameDraft: FormInput(name)));
      return;
    }

    final future = _saveName(current, name);
    _nameSave = future;
    try {
      await future;
    } finally {
      if (identical(_nameSave, future)) _nameSave = null;
    }
  }

  Future<void> _saveName(ProfileDetails previous, String name) async {
    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _profileRepository.updateDisplayName(profileId: previous.profileId, displayName: name);
      _savedName = name;
      if (!_canEmit) return;
      final latest = state.current ?? previous;
      emit(
        state.copyWith(
          details: Success(latest.copyWith(displayName: name)),
          nameDraft: FormInput(name),
          saveAction: const Initial(),
        ),
      );
    } catch (exception) {
      if (!_canEmit) return;
      final latest = state.current ?? previous;
      emit(
        state.copyWith(
          details: Success(latest.copyWith(displayName: _savedName)),
          nameDraft: FormInput(_savedName),
          saveAction: Failure.fromObject(exception),
        ),
      );
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  void onPronounsChanged(String value) {
    if (!_canEmit) return;

    _pronounsTimer?.cancel();
    emit(state.copyWith(pronounsDraft: FormInput(value)));
    if (value.trim().runes.length > maxPronounsLength) {
      _validatePronouns();
      return;
    }

    _pronounsTimer = Timer(_editDebounce, savePronouns);
  }

  Future<void> savePronouns() async {
    _pronounsTimer?.cancel();
    if (_pronounsSave case final pending?) await pending;

    final current = state.current;
    if (current == null || !_canEmit) return;
    if (!_validatePronouns()) return;

    final raw = (state.pronounsDraft?.value ?? current.pronouns ?? '').trim();
    final pronouns = raw.isEmpty ? null : raw;
    if (pronouns == _savedPronouns) {
      emit(state.copyWith(pronounsDraft: FormInput(pronouns ?? '')));
      return;
    }

    final future = _savePronouns(current, pronouns);
    _pronounsSave = future;
    try {
      await future;
    } finally {
      if (identical(_pronounsSave, future)) _pronounsSave = null;
    }
  }

  Future<void> _savePronouns(ProfileDetails previous, String? pronouns) async {
    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _profileRepository.updatePronouns(profileId: previous.profileId, pronouns: pronouns);
      _savedPronouns = pronouns;
      if (!_canEmit) return;
      final latest = state.current ?? previous;
      emit(
        state.copyWith(
          details: Success(latest.copyWith(pronouns: pronouns, clearPronouns: pronouns == null)),
          pronounsDraft: FormInput(pronouns ?? ''),
          saveAction: const Initial(),
        ),
      );
    } catch (exception) {
      if (!_canEmit) return;
      final latest = state.current ?? previous;
      emit(
        state.copyWith(
          details: Success(
            latest.copyWith(pronouns: _savedPronouns, clearPronouns: _savedPronouns == null),
          ),
          pronounsDraft: FormInput(_savedPronouns ?? ''),
          saveAction: Failure.fromObject(exception),
        ),
      );
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  Future<void> onThemeChanged(AppThemeVariant theme) async {
    if (_themeSave case final pending?) await pending;

    final current = state.current;
    if (current == null || current.theme == theme || !_canEmit) return;

    emit(
      state.copyWith(
        details: Success(current.copyWith(theme: theme)),
        saveAction: const Loading(),
      ),
    );
    final future = _saveTheme(current, theme);
    _themeSave = future;
    try {
      await future;
    } finally {
      if (identical(_themeSave, future)) _themeSave = null;
    }
  }

  Future<void> _saveTheme(ProfileDetails previous, AppThemeVariant theme) async {
    await _rememberLocalTheme(theme);
    try {
      await _profileRepository.updateTheme(profileId: previous.profileId, theme: theme);
      if (!_canEmit) return;
      emit(state.copyWith(saveAction: const Success(null)));
      emit(state.copyWith(saveAction: const Initial()));
    } catch (exception) {
      await _rememberLocalTheme(previous.theme);
      if (!_canEmit) return;
      final latest = state.current ?? previous;
      emit(
        state.copyWith(
          details: Success(latest.copyWith(theme: previous.theme)),
          saveAction: Failure.fromObject(exception),
        ),
      );
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  Future<void> onTimeZoneChanged(String timeZone) async {
    if (_timeZoneSave case final pending?) await pending;

    final current = state.current;
    if (current == null || current.timeZone == timeZone || !_canEmit) return;

    emit(
      state.copyWith(
        details: Success(current.copyWith(timeZone: timeZone)),
        saveAction: const Loading(),
      ),
    );
    final future = _saveTimeZone(current, timeZone);
    _timeZoneSave = future;
    try {
      await future;
    } finally {
      if (identical(_timeZoneSave, future)) _timeZoneSave = null;
    }
  }

  Future<void> _saveTimeZone(ProfileDetails previous, String timeZone) async {
    try {
      await _profileRepository.updateTimeZone(profileId: previous.profileId, timeZone: timeZone);
      if (!_canEmit) return;
      emit(state.copyWith(saveAction: const Success(null)));
      emit(state.copyWith(saveAction: const Initial()));
    } catch (exception) {
      if (!_canEmit) return;
      final latest = state.current ?? previous;
      emit(
        state.copyWith(
          details: Success(latest.copyWith(timeZone: previous.timeZone)),
          saveAction: Failure.fromObject(exception),
        ),
      );
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  bool _validateName() {
    final draft = state.nameDraft;
    if (draft == null) return true;

    final validatedName = draft.validate(
      CompositeValidator<String>([NonEmptyValidator(), MaxLengthValidator(maxNameLength)]),
    );

    emit(state.copyWith(nameDraft: validatedName));

    return validatedName.isValid;
  }

  bool _validatePronouns() {
    final draft = state.pronounsDraft;
    if (draft == null) return true;

    final validatedPronouns = draft.validate(MaxLengthValidator(maxPronounsLength));

    emit(state.copyWith(pronounsDraft: validatedPronouns));

    return validatedPronouns.isValid;
  }

  Future<void> _rememberLocalTheme(AppThemeVariant theme) async {
    try {
      final settings = _settingsRepository.get();
      await _settingsRepository.save(settings.copyWith(themeVariant: theme.name));
    } on Object {
      // The device mirror is best-effort; the app still uses the in-memory theme.
    }
  }

  @override
  Future<void> close() async {
    _isClosing = true;
    _nameTimer?.cancel();
    _pronounsTimer?.cancel();
    await _nameSave;
    await _pronounsSave;

    final current = state.current;
    if (current != null) {
      final name = sanitizeDisplayName(state.nameDraft?.value ?? current.displayName);
      if (name.isNotEmpty && name != _savedName) {
        try {
          await _profileRepository.updateDisplayName(
            profileId: current.profileId,
            displayName: name,
          );
        } on Object {
          // Closing cannot surface a failed last write.
        }
      }

      final rawPronouns = (state.pronounsDraft?.value ?? current.pronouns ?? '').trim();
      if (rawPronouns.runes.length <= maxPronounsLength) {
        final pronouns = rawPronouns.isEmpty ? null : rawPronouns;
        if (pronouns != _savedPronouns) {
          try {
            await _profileRepository.updatePronouns(
              profileId: current.profileId,
              pronouns: pronouns,
            );
          } on Object {
            // Closing cannot surface a failed last write.
          }
        }
      }
    }

    return super.close();
  }
}
