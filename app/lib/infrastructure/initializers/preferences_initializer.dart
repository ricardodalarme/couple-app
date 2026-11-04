import 'package:core/core.dart';
import 'package:logger/logger.dart';
import 'package:preferences_service/preferences_service.dart';

final class PreferencesInitializer() extends Initializer {
  static final Logger _logger = Logger('PreferencesInitializer');

  @override
  Future<void> initialize() async {
    _logger.info('Initializing Persistent Storage Service');

    await AppInjector.instance.get<PreferencesService>().initialize();
  }
}
