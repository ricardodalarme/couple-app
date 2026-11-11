import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

part 'language_state.dart';

/// The app language, persisted on the device and applied immediately.
class LanguageCubit({required final SettingsRepository _repository}) extends Cubit<LanguageState> {
  this : super(LanguageState(locale: _repository.get().locale));

  Future<bool> setLocale(AppLocale locale) async {
    final previous = state.locale;
    if (previous == locale.languageCode) return true;

    emit(state.copyWith(locale: locale.languageCode, saveAction: const Loading()));
    try {
      await _repository.save(_repository.get().copyWith(locale: locale.languageCode));
      LocaleSettings.setLocaleSync(locale);
      if (!isClosed) emit(state.copyWith(saveAction: const Success(null)));
      return true;
    } catch (exception) {
      if (!isClosed) {
        emit(state.copyWith(locale: previous, saveAction: Failure.fromObject(exception)));
        emit(state.copyWith(saveAction: const Initial()));
      }
      return false;
    }
  }
}
