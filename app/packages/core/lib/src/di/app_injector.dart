import 'package:core/core.dart';
import 'package:get_it/get_it.dart';

final class AppInjector implements Injector {
  AppInjector._();

  final GetIt _getIt = GetIt.instance;

  static Injector? _internal;

  static Injector get instance => _instance;

  static Injector get _instance {
    _internal ??= AppInjector._();
    return _internal!;
  }

  @override
  T get<T extends Object>({String? instanceName}) =>
      _getIt.get<T>(instanceName: instanceName);

  @override
  void unregister<T extends Object>({String? instanceName}) =>
      _getIt.unregister<T>(instanceName: instanceName);

  @override
  void registerSingleton<T extends Object>(T instance, {String? instanceName}) {
    if (!_getIt.isRegistered<T>(instanceName: instanceName)) {
      _getIt.registerSingleton<T>(instance, instanceName: instanceName);
    }
  }

  @override
  void registerLazySingleton<T extends Object>(
    T Function() function, {
    String? instanceName,
  }) {
    if (!_getIt.isRegistered<T>(instanceName: instanceName)) {
      _getIt.registerLazySingleton<T>(
        () => function.call(),
        instanceName: instanceName,
      );
    }
  }

  @override
  void registerFactory<T extends Object>(
    T Function() function, {
    String? instanceName,
  }) {
    if (!_getIt.isRegistered<T>(instanceName: instanceName)) {
      _getIt.registerFactory<T>(
        () => function.call(),
        instanceName: instanceName,
      );
    }
  }
}
