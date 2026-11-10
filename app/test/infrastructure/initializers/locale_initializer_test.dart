import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/infrastructure/initializers/locale_initializer.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSettingsRepository() extends Mock implements SettingsRepository;

void main() {
  final repository = _MockSettingsRepository();

  tearDown(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  test('uses the locale stored on the device instead of the device locale', () {
    when(repository.get).thenReturn(const Settings.empty().copyWith(locale: 'en'));

    LocaleInitializer(settingsRepository: repository).initialize();

    expect(LocaleSettings.currentLocale, AppLocale.en);
  });
}
