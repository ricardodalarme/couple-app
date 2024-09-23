abstract interface class Injector {
  T get<T extends Object>({String? instanceName});

  void unregister<T extends Object>({String? instanceName});

  void registerSingleton<T extends Object>(T instance, {String? instanceName});

  void registerLazySingleton<T extends Object>(
    T Function() function, {
    String? instanceName,
  });

  void registerFactory<T extends Object>(
    T Function() function, {
    String? instanceName,
  });
}
