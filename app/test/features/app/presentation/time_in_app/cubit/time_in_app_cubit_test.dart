import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_starter/features/app/presentation/time_in_app/cubit/time_in_app_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:preferences_service/preferences_service.dart';

class _MockPreferencesService() extends Mock implements PreferencesService;

class _FakeTimer(final void Function() onTick) implements Timer {
  @override
  bool isActive = true;

  @override
  int tick = 0;

  @override
  void cancel() => isActive = false;

  void fire() {
    if (!isActive) return;
    tick++;
    onTick();
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late PreferencesService preferences;
  late DateTime now;
  late _FakeTimer timer;

  setUp(() {
    preferences = _MockPreferencesService();
    now = DateTime(2026, 11, 11, 9);
    when(() => preferences.readString(key: any(named: 'key'))).thenReturn(null);
    when(
      () => preferences.writeString(
        key: any(named: 'key'),
        value: any(named: 'value'),
      ),
    ).thenAnswer((_) async {});
  });

  TimeInAppCubit build() {
    final cubit = TimeInAppCubit(
      preferencesService: preferences,
      now: () => now,
      tickInterval: const Duration(minutes: 5),
      timerFactory: (_, onTick) => timer = _FakeTimer(onTick),
    );
    addTearDown(() async {
      if (!cubit.isClosed) await cubit.close();
    });

    return cubit;
  }

  void fireTimes(int count) {
    for (var index = 0; index < count; index++) {
      timer.fire();
    }
  }

  test('below the threshold no prompt is requested', () {
    final cubit = build()..start();

    fireTimes(5);

    expect(cubit.state.shouldPrompt, isFalse);
    verifyNever(
      () => preferences.writeString(
        key: any(named: 'key'),
        value: any(named: 'value'),
      ),
    );
  });

  test('reaching the threshold requests the prompt once and records the day', () {
    final cubit = build()..start();

    fireTimes(6);

    expect(cubit.state.shouldPrompt, isTrue);
    verify(() => preferences.writeString(key: timeInAppPromptedOnKey, value: '2026-11-11'))
        .called(1);
  });

  test('crossing the threshold again on the same day does not prompt again', () async {
    final cubit = build()..start();
    final states = <TimeInAppState>[];
    final subscription = cubit.stream.listen(states.add);
    addTearDown(subscription.cancel);

    fireTimes(6);
    fireTimes(12);
    await Future<void>.delayed(Duration.zero);

    expect(states.where((state) => state.shouldPrompt), hasLength(1));
  });

  test('a new day can prompt again', () async {
    final cubit = build()..start();
    final states = <TimeInAppState>[];
    final subscription = cubit.stream.listen(states.add);
    addTearDown(subscription.cancel);

    fireTimes(6);
    now = DateTime(2026, 11, 12, 9);
    fireTimes(6);
    await Future<void>.delayed(Duration.zero);

    expect(states.where((state) => state.shouldPrompt), hasLength(2));
    verify(() => preferences.writeString(key: timeInAppPromptedOnKey, value: '2026-11-12'))
        .called(1);
  });

  test('time while the app is not resumed is not counted', () {
    final cubit = build()
      ..start()
      ..didChangeAppLifecycleState(AppLifecycleState.paused);

    fireTimes(10);
    expect(cubit.state.shouldPrompt, isFalse);

    cubit.didChangeAppLifecycleState(AppLifecycleState.resumed);
    fireTimes(5);
    expect(cubit.state.shouldPrompt, isFalse);

    fireTimes(1);
    expect(cubit.state.shouldPrompt, isTrue);
  });

  test('closing cancels the timer', () async {
    final cubit = build()..start();

    expect(timer.isActive, isTrue);

    await cubit.close();

    expect(timer.isActive, isFalse);
  });
}
