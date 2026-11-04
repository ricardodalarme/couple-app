import 'package:authentication_service/authentication_service.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/infrastructure/config/env_variables.dart';
import 'package:logger/logger.dart';

final class AuthenticationInitializer() extends Initializer {
  static final Logger _logger = Logger('AuthenticationInitializer');

  @override
  Future<void> initialize() async {
    _logger.info('Initializing Authentication Service');

    await AppInjector.instance.get<AuthenticationService>().initialize(
      url: EnvVariables.supabaseUrl,
      anonKey: EnvVariables.supabaseAnonKey,
    );
  }
}
