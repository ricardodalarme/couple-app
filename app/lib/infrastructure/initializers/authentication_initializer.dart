import 'package:authentication_service/authentication_service.dart';
import 'package:core/core.dart';
import 'package:logger/logger.dart';

final class AuthenticationInitializer() extends Initializer {
  static final Logger _logger = Logger('AuthenticationInitializer');

  @override
  Future<void> initialize() async {
    _logger.info('Initializing Authentication Service');

    await AppInjector.instance.get<AuthenticationService>().initialize(
      url: Config.supabaseUrl,
      anonKey: Config.supabaseAnonKey,
    );
  }
}
