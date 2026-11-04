import 'dart:async';

import 'package:core/core.dart';
import 'package:test/test.dart';

final class _FirstInitializer(final List<String> _events) extends Initializer {
  @override
  void initialize() => _events.add('first');
}

final class _SecondInitializer(final List<String> _events) extends Initializer {
  @override
  List<Type> get dependencies => const [_FirstInitializer];

  @override
  void initialize() => _events.add('second');
}

final class _FirstBlockingInitializer(
  final Completer<void> _started,
  final Completer<void> _release,
) extends Initializer {
  @override
  Future<void> initialize() async {
    _started.complete();
    await _release.future;
  }
}

final class _SecondBlockingInitializer(
  final Completer<void> _started,
  final Completer<void> _release,
) extends Initializer {
  @override
  Future<void> initialize() async {
    _started.complete();
    await _release.future;
  }
}

final class _CriticalFailureInitializer() extends Initializer {
  @override
  Future<void> initialize() => Future<void>.error(StateError('critical failure'));
}

final class _NonCriticalFailureInitializer() extends Initializer {
  @override
  FailurePolicy get failurePolicy => FailurePolicy.nonCritical;

  @override
  Future<void> initialize() => Future<void>.error(StateError('non-critical failure'));
}

final class _SurvivingInitializer(final List<String> _events) extends Initializer {
  @override
  void initialize() => _events.add('survived');
}

final class _MissingDependencyInitializer() extends Initializer {
  @override
  List<Type> get dependencies => const [_NeverRegisteredInitializer];

  @override
  void initialize() {}
}

final class _NeverRegisteredInitializer() extends Initializer {
  @override
  void initialize() {}
}

final class _CycleA() extends Initializer {
  @override
  List<Type> get dependencies => const [_CycleB];

  @override
  void initialize() {}
}

final class _CycleB() extends Initializer {
  @override
  List<Type> get dependencies => const [_CycleA];

  @override
  void initialize() {}
}

void main() {
  group('AppStartupPipeline', () {
    test('runs dependencies before dependents', () async {
      final events = <String>[];

      final report = await StartupPipeline([_SecondInitializer(events), _FirstInitializer(events)])
          .execute();

      expect(events, ['first', 'second']);
      expect(report.metrics.keys, containsAll([_FirstInitializer, _SecondInitializer]));
      expect(report.errors, isEmpty);
    });

    test('starts independent initializers in parallel', () async {
      final firstStarted = Completer<void>();
      final secondStarted = Completer<void>();
      final release = Completer<void>();

      final execution = StartupPipeline([
        _FirstBlockingInitializer(firstStarted, release),
        _SecondBlockingInitializer(secondStarted, release),
      ]).execute();

      try {
        await Future.wait([firstStarted.future, secondStarted.future])
            .timeout(const Duration(seconds: 1));
      } finally {
        release.complete();
      }

      final report = await execution;
      expect(report.errors, isEmpty);
    });

    test('aborts when a critical initializer fails', () async {
      await expectLater(
        StartupPipeline([_CriticalFailureInitializer()]).execute(),
        throwsA(isA<StateError>()),
      );
    });

    test('continues past a non-critical failure and records it', () async {
      final events = <String>[];

      final report = await StartupPipeline([
        _NonCriticalFailureInitializer(),
        _SurvivingInitializer(events),
      ]).execute();

      expect(events, ['survived']);
      expect(report.errors.keys, contains(_NonCriticalFailureInitializer));
    });

    test('rejects missing dependencies', () async {
      await expectLater(
        StartupPipeline([_MissingDependencyInitializer()]).execute(),
        throwsA(isA<StateError>()),
      );
    });

    test('rejects cycles', () async {
      await expectLater(
        StartupPipeline([_CycleA(), _CycleB()]).execute(),
        throwsA(isA<StateError>()),
      );
    });

    test('rejects duplicate initializers', () {
      expect(
        () => StartupPipeline([_FirstInitializer([]), _FirstInitializer([])]),
        throwsA(isA<StateError>()),
      );
    });
  });
}
