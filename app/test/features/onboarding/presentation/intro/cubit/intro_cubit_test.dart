import 'package:bloc_test/bloc_test.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/onboarding/presentation/intro/cubit/intro_cubit.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSettingsRepository() extends Mock implements SettingsRepository;

void main() {
  late SettingsRepository settingsRepository;

  setUpAll(() => registerFallbackValue(const Settings.empty()));

  setUp(() {
    settingsRepository = _MockSettingsRepository();
    when(() => settingsRepository.get()).thenReturn(const Settings.empty());
    when(() => settingsRepository.save(any())).thenAnswer((_) async {});
  });

  IntroCubit build() => IntroCubit(settingsRepository: settingsRepository);

  blocTest<IntroCubit, IntroState>(
    'start restores answers from an interrupted run',
    build: () {
      when(() => settingsRepository.get()).thenReturn(
        const Settings(introPhase: 'married', introGoals: ['remember_dates'], themeVariant: 'blue'),
      );
      return build();
    },
    act: (cubit) => cubit.start(),
    expect: () => const [
      IntroState(phase: 'married', goals: ['remember_dates'], theme: AppThemeVariant.blue),
    ],
  );

  blocTest<IntroCubit, IntroState>(
    'toggleGoal adds and removes a goal',
    build: build,
    act: (cubit) => cubit
      ..toggleGoal('remember_dates')
      ..toggleGoal('keep_romance')
      ..toggleGoal('remember_dates'),
    expect: () => const [
      IntroState(goals: ['remember_dates']),
      IntroState(goals: ['remember_dates', 'keep_romance']),
      IntroState(goals: ['keep_romance']),
    ],
  );

  blocTest<IntroCubit, IntroState>(
    'complete stores the answers and the step, marking them as not uploaded',
    build: build,
    act: (cubit) async {
      cubit
        ..selectPhase('engaged')
        ..toggleGoal('reconnect');
      await cubit.complete(2);
    },
    verify: (_) {
      final saved = verify(() => settingsRepository.save(captureAny())).captured.single as Settings;
      expect(saved.introStep, 2);
      expect(saved.introPhase, 'engaged');
      expect(saved.introGoals, ['reconnect']);
      expect(saved.introUploaded, isFalse);
    },
  );

  blocTest<IntroCubit, IntroState>(
    'skip advances the step without keeping the chosen answers',
    build: build,
    act: (cubit) async {
      cubit.selectPhase('engaged');
      await cubit.skip(1);
    },
    verify: (_) {
      final saved = verify(() => settingsRepository.save(captureAny())).captured.single as Settings;
      expect(saved.introStep, 1);
      expect(saved.introPhase, isNull);
    },
  );

  test('a later step is never lowered by an earlier screen', () async {
    when(() => settingsRepository.get()).thenReturn(const Settings(introStep: 3));
    final cubit = build();
    await cubit.complete(1);
    final saved = verify(() => settingsRepository.save(captureAny())).captured.single as Settings;
    expect(saved.introStep, 3);
  });
}
