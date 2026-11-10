import 'dart:async';

import 'package:flutter_bloc_starter/features/settings/data/models/app_text_scale.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/preferences/cubit/app_preferences_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSettingsRepository() extends Mock implements SettingsRepository;

void main() {
  late SettingsRepository repository;
  late Settings stored;

  setUpAll(() => registerFallbackValue(const Settings.empty()));

  setUp(() {
    repository = _MockSettingsRepository();
    stored = const Settings.empty();
    when(repository.get).thenAnswer((_) => stored);
    when(() => repository.save(any())).thenAnswer((invocation) async {
      stored = invocation.positionalArguments.first as Settings;
    });
  });

  AppPreferencesCubit build() => AppPreferencesCubit(repository: repository);

  test('starts from the stored preferences', () {
    stored = const Settings.empty().copyWith(textScale: 1.15, reduceMotion: true);

    final cubit = build();

    expect(cubit.state.settings.textScale, 1.15);
    expect(cubit.state.settings.reduceMotion, isTrue);
  });

  test('saves each preference and keeps the rest', () async {
    final cubit = build();

    expect(await cubit.setTextScale(AppTextScale.large), isTrue);
    expect(await cubit.setReduceMotion(value: true), isTrue);
    expect(await cubit.setHighContrast(value: true), isTrue);

    expect(cubit.state.settings.textScale, 1.15);
    expect(cubit.state.settings.reduceMotion, isTrue);
    expect(cubit.state.settings.highContrast, isTrue);
    verify(() => repository.save(any())).called(3);
  });

  test('saves the language without touching the other preferences', () async {
    stored = const Settings.empty().copyWith(locale: 'en', textScale: 1.3);
    final cubit = build();

    expect(await cubit.setLocale(AppLocale.pt), isTrue);

    expect(cubit.state.settings.locale, 'pt');
    expect(cubit.state.settings.textScale, 1.3);
  });

  test('a change made while a save is running waits instead of being dropped', () async {
    final firstSave = Completer<void>();
    var saves = 0;
    when(() => repository.save(any())).thenAnswer((invocation) async {
      saves++;
      if (saves == 1) await firstSave.future;
      stored = invocation.positionalArguments.first as Settings;
    });
    final cubit = build();

    final motion = cubit.setReduceMotion(value: true);
    final contrast = cubit.setHighContrast(value: true);
    await Future<void>.delayed(Duration.zero);

    expect(saves, 1);
    firstSave.complete();
    await Future.wait([motion, contrast]);

    expect(cubit.state.settings.reduceMotion, isTrue);
    expect(cubit.state.settings.highContrast, isTrue);
    verify(() => repository.save(any())).called(2);
  });

  test('a failed save returns false and restores the previous preference', () async {
    when(() => repository.save(any())).thenThrow(Exception('disk'));
    final cubit = build();

    expect(await cubit.setHighContrast(value: true), isFalse);
    expect(cubit.state.settings.highContrast, isFalse);
  });
}
