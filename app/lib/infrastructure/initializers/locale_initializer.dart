import 'package:core/core.dart';
import 'package:design_system/design_system_l10n.dart' as design_system_l10n;
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:formatters/formatters.dart';
import 'package:logger/logger.dart';

final class LocaleInitializer() extends Initializer {
  static final Logger _logger = Logger('LocaleInitializer');

  @override
  void initialize() {
    _logger.info('Setting up locale');

    LocaleSettings.getLocaleStream().listen((locale) {
      Formatters.setDefaultLocale(locale.languageCode);
      design_system_l10n.LocaleSettings.setLocaleRawSync(locale.languageCode);
    });

    LocaleSettings.useDeviceLocaleSync();
    design_system_l10n.LocaleSettings.setLocaleRawSync(LocaleSettings.currentLocale.languageCode);
  }
}
