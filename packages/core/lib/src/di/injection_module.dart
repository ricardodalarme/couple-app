import 'package:core/core.dart';

abstract interface class InjectionModule() {
  void registerDependencies({required Injector injector});
}
