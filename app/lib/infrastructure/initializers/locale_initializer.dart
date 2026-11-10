import 'package:core/core.dart';
import 'package:design_system/design_system_l10n.dart' as design_system_l10n;
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/infrastructure/initializers/preferences_initializer.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:formatters/formatters.dart';
import 'package:logger/logger.dart';

final class LocaleInitializer({final SettingsRepository? settingsRepository}) extends Initializer {
  static final Logger _logger = Logger('LocaleInitializer');

  @override
  List<Type> get dependencies => const [PreferencesInitializer];

  @override
  void initialize() {
    _logger.info('Setting up locale');

    LocaleSettings.getLocaleStream().listen((locale) {
      Formatters.setDefaultLocale(locale.languageCode);
      design_system_l10n.LocaleSettings.setLocaleRawSync(locale.languageCode);
    });

    final repository = settingsRepository ?? AppInjector.instance.get<SettingsRepository>();
    final stored = repository.get();
    final preferred = switch (stored.locale) {
      'en' => AppLocale.en,
      _ => AppLocale.pt,
    };
    LocaleSettings.setLocaleSync(preferred);
    design_system_l10n.LocaleSettings.setLocaleRawSync(LocaleSettings.currentLocale.languageCode);
  }
}
