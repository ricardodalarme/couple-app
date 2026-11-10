import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/app_text_scale.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

part 'app_preferences_state.dart';

/// Device preferences that change the app immediately.
class AppPreferencesCubit({required final SettingsRepository _repository})
    extends Cubit<AppPreferencesState> {
  this : super(AppPreferencesState(settings: _repository.get()));

  Future<void> _queue = Future<void>.value();

  Future<bool> setTextScale(AppTextScale scale) =>
      _save((settings) => settings.copyWith(textScale: scale.factor));

  Future<bool> setReduceMotion({required bool value}) =>
      _save((settings) => settings.copyWith(reduceMotion: value));

  Future<bool> setHighContrast({required bool value}) =>
      _save((settings) => settings.copyWith(highContrast: value));

  Future<bool> setLocale(AppLocale locale) async {
    final success = await _save((settings) => settings.copyWith(locale: locale.languageCode));
    if (success) LocaleSettings.setLocaleSync(locale);
    return success;
  }

  Future<bool> _save(Settings Function(Settings) update) {
    final operation = _queue.then((_) => _performSave(update));
    _queue = operation.catchError((Object _) => false);
    return operation;
  }

  Future<bool> _performSave(Settings Function(Settings) update) async {
    final previous = _repository.get();
    final next = update(previous);
    if (next == previous) return true;

    emit(state.copyWith(settings: next, saveAction: const Loading()));
    try {
      await _repository.save(next);
      emit(state.copyWith(saveAction: const Success(null)));
      return true;
    } catch (exception) {
      emit(state.copyWith(settings: previous, saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
      return false;
    }
  }
}
