import 'dart:async';

import 'package:core/core.dart';

abstract interface class InjectionModule {
  FutureOr<void> registerDependencies({required Injector injector});
}
