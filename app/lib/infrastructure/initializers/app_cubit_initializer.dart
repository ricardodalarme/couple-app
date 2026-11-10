import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/infrastructure/initializers/authentication_initializer.dart';
import 'package:flutter_bloc_starter/infrastructure/initializers/bloc_initializer.dart';
import 'package:flutter_bloc_starter/infrastructure/initializers/preferences_initializer.dart';
import 'package:logger/logger.dart';

final class AppCubitInitializer() extends Initializer {
  static final Logger _logger = Logger('AppCubitInitializer');

  @override
  List<Type> get dependencies => const [
    PreferencesInitializer,
    AuthenticationInitializer,
    BlocInitializer,
  ];

  @override
  void initialize() {
    _logger.info('Initializing App Cubit');

    unawaited(AppInjector.instance.get<AppCubit>().initialize());
  }
}
