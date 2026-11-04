import 'dart:async';

import 'package:core/src/startup/initializer.dart';

/// Timings and failures collected while running the startup initializers.
final class StartupReport({
  required final Duration totalDuration,
  required final Map<Type, Duration> metrics,
  required final Map<Type, Object> errors,
});

/// Runs [Initializer]s in dependency order.
final class StartupPipeline(List<Initializer> initializers) {
  final Map<Type, Initializer> _byType = _index(initializers);
  final Map<Type, Future<void>> _started = {};
  final Map<Type, Duration> _metrics = {};
  final Map<Type, Object> _errors = {};

  /// Runs every initializer once and returns the collected report.
  Future<StartupReport> execute() async {
    _validateGraph();

    final stopwatch = Stopwatch()..start();
    await Future.wait(_byType.keys.map(_orchestrate));
    stopwatch.stop();

    return StartupReport(
      totalDuration: stopwatch.elapsed,
      metrics: Map.unmodifiable(_metrics),
      errors: Map.unmodifiable(_errors),
    );
  }

  Future<void> _orchestrate(Type type) => _started.putIfAbsent(type, () => _run(type));

  Future<void> _run(Type type) async {
    final initializer = _byType[type]!;

    try {
      if (initializer.dependencies.isNotEmpty) {
        await Future.wait(initializer.dependencies.map(_orchestrate));

        if (initializer.dependencies.any(_errors.containsKey)) {
          throw StateError('Skipped: a prerequisite failed.');
        }
      }

      final stopwatch = Stopwatch()..start();
      await Future<void>.sync(initializer.initialize);
      stopwatch.stop();

      _metrics[type] = stopwatch.elapsed;
    } catch (error) {
      _errors[type] = error;
      if (initializer.failurePolicy == FailurePolicy.critical) rethrow;
    }
  }

  static Map<Type, Initializer> _index(List<Initializer> initializers) {
    final byType = <Type, Initializer>{};

    for (final initializer in initializers) {
      if (byType.containsKey(initializer.runtimeType)) {
        throw StateError('Duplicate startup initializer: ${initializer.runtimeType}');
      }
      byType[initializer.runtimeType] = initializer;
    }

    return byType;
  }

  void _validateGraph() {
    final visited = <Type>{};
    final visiting = <Type>{};

    void visit(Type type) {
      if (visiting.contains(type)) {
        throw StateError('Cyclic startup dependency detected at: $type');
      }
      if (!visited.add(type)) return;

      visiting.add(type);
      for (final dependency in _byType[type]?.dependencies ?? const <Type>[]) {
        if (!_byType.containsKey(dependency)) {
          throw StateError('Unregistered dependency $dependency required by $type');
        }
        visit(dependency);
      }
      visiting.remove(type);
    }

    _byType.keys.forEach(visit);
  }
}
