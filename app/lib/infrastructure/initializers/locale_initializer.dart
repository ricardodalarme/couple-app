import 'package:core/core.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:formatters/formatters.dart';
import 'package:logger/logger.dart';

final class LocaleInitializer() extends Initializer {
  static final Logger _logger = Logger('LocaleInitializer');

  @override
  void initialize() {
    _logger.info('Setting up locale');

    LocaleSettings.getLocaleStream().listen(
      (locale) => Formatters.setDefaultLocale(locale.languageCode),
    );

    LocaleSettings.useDeviceLocaleSync();
  }
}
