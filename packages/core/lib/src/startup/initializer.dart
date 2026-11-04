import 'dart:async';

/// Whether a failed [Initializer] aborts app startup.
enum FailurePolicy() {
  /// The failure is critical and aborts the remaining startup work.
  critical,

  /// The failure is non-critical and allows the remaining startup work to continue.
  nonCritical,
}

/// A unit of app startup work with declared prerequisites.
abstract class const Initializer() {
  /// Whether a failure aborts the remaining startup work.
  FailurePolicy get failurePolicy => FailurePolicy.critical;

  /// Initializers that must complete before this one runs.
  List<Type> get dependencies => const [];

  /// Performs the startup work. May be synchronous or asynchronous.
  // ignore: avoid_futureor_void
  FutureOr<void> initialize();
}
