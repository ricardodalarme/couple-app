import 'dart:async';

import 'package:common/common.dart';

abstract interface class InjectionModule {
  FutureOr<void> registerDependencies({required Injector injector});
}
