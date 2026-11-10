import 'package:flutter_bloc_starter/features/onboarding/presentation/first_slip/cubit/first_slip_cubit.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSlipRepository() extends Mock implements SlipRepository;

class _MockSettingsRepository() extends Mock implements SettingsRepository;

void main() {
  late SlipRepository slipRepository;
  late SettingsRepository settingsRepository;

  setUpAll(() {
    registerFallbackValue(const Settings.empty());
    registerFallbackValue(DateTime(2026));
  });

  setUp(() {
    slipRepository = _MockSlipRepository();
    settingsRepository = _MockSettingsRepository();
    when(() => settingsRepository.get()).thenReturn(const Settings.empty());
    when(() => settingsRepository.save(any())).thenAnswer((_) async {});
    when(
      () => slipRepository.keepOnDevice(
        id: any(named: 'id'),
        body: any(named: 'body'),
        createdAt: any(named: 'createdAt'),
      ),
    ).thenAnswer((_) async {});
  });

  FirstSlipCubit build() =>
      FirstSlipCubit(slipRepository: slipRepository, settingsRepository: settingsRepository);

  test('an empty or space-only slip cannot be saved', () async {
    final cubit = build()..onTextChanged('   ');
    await cubit.save();

    verifyNever(
      () => slipRepository.keepOnDevice(
        id: any(named: 'id'),
        body: any(named: 'body'),
        createdAt: any(named: 'createdAt'),
      ),
    );
  });

  test('saving keeps the slip on the device and completes the step', () async {
    final cubit = build()..onTextChanged(' Fez café ');
    await cubit.save();

    verify(
      () => slipRepository.keepOnDevice(
        id: any(named: 'id'),
        body: 'Fez café',
        createdAt: any(named: 'createdAt'),
      ),
    ).called(1);
    final saved = verify(() => settingsRepository.save(captureAny())).captured.single as Settings;
    expect(saved.introStep, firstSlipStep);
  });

  test('skip completes the step without storing a slip', () async {
    await build().skip();

    verifyNever(
      () => slipRepository.keepOnDevice(
        id: any(named: 'id'),
        body: any(named: 'body'),
        createdAt: any(named: 'createdAt'),
      ),
    );
    verify(() => settingsRepository.save(any())).called(1);
  });
}
