import 'dart:math' as math;

import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';

part 'intro_state.dart';

/// The relationship phases offered on the first introduction screen.
const List<String> introPhases = [
  'dating',
  'living_together',
  'engaged',
  'married',
  'with_kids',
  'long_distance',
  'with_parents',
  'restarting',
];

/// The goals offered on the second introduction screen.
const List<String> introGoalOptions = [
  'reconnect',
  'fight_less',
  'keep_romance',
  'remember_dates',
  'organize_routine',
  'just_record',
];

/// Number of screens in the first-use sequence, including the ones after the theme.
const int introStepCount = 5;

/// Keeps the introduction answers on the device until the person signs in.
class IntroCubit({required final SettingsRepository _settingsRepository})
    extends Cubit<IntroState> {
  this : super(const IntroState());

  /// Loads the answers saved by an earlier, interrupted run.
  void start() {
    final settings = _settingsRepository.get();
    emit(
      IntroState(
        phase: settings.introPhase,
        goals: settings.introGoals,
        theme: AppThemeVariant.values.firstWhere(
          (variant) => variant.name == settings.themeVariant,
          orElse: () => AppThemeVariant.rose,
        ),
      ),
    );
  }

  void selectPhase(String phase) => emit(state.copyWith(phase: phase));

  void toggleGoal(String goal) {
    final goals = [...state.goals];
    goals.contains(goal) ? goals.remove(goal) : goals.add(goal);
    emit(state.copyWith(goals: goals));
  }

  void selectTheme(AppThemeVariant theme) => emit(state.copyWith(theme: theme));

  /// Stores the answers and marks [step] (1-based) as completed.
  Future<void> complete(int step) async {
    final settings = _settingsRepository.get();
    await _settingsRepository.save(
      settings.copyWith(
        introStep: math.max(settings.introStep, step),
        introPhase: state.phase,
        introGoals: state.goals,
        themeVariant: state.theme.name,
        introUploaded: false,
      ),
    );
  }

  /// Marks [step] completed without keeping what was chosen on that screen.
  Future<void> skip(int step) async {
    final settings = _settingsRepository.get();
    await _settingsRepository.save(
      settings.copyWith(introStep: math.max(settings.introStep, step)),
    );
  }
}
