import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/pause_return.dart';
import 'package:flutter_bloc_starter/features/repair/data/repositories/repair_repository.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/pause/cubit/pause_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';

class _MockRepairRepository() extends Mock implements RepairRepository;

void main() {
  late RepairRepository repository;

  setUpAll(() => registerFallbackValue(DateTime(2026)));

  setUp(() {
    repository = _MockRepairRepository();
    when(
      () => repository.startPause(
        returnAt: any(named: 'returnAt'),
        message: any(named: 'message'),
      ),
    ).thenAnswer((_) async {});
  });

  PauseCubit build() => PauseCubit(repairRepository: repository);

  test('every return choice stays inside the 24 hours the server allows', () {
    final now = DateTime(2026, 11, 10, 12);

    for (final option in PauseReturn.values) {
      expect(option.returnAt(now).difference(now), lessThan(const Duration(hours: 24)));
      expect(option.returnAt(now).isAfter(now), isTrue);
    }
  });

  test('an empty message is reported as a field error', () async {
    final cubit = build()..onMessageChanged('  ');

    await cubit.send();

    expect(cubit.state.message.error, NonEmptyValidationError.empty);
    verifyNever(
      () => repository.startPause(
        returnAt: any(named: 'returnAt'),
        message: any(named: 'message'),
      ),
    );
  });

  test('send starts the pause with the chosen message', () async {
    final cubit = build()
      ..onPresetChosen('later', 'Vamos conversar mais tarde, com calma?')
      ..onReturnChosen(PauseReturn.oneHour);

    await cubit.send();

    verify(
      () => repository.startPause(
        returnAt: any(named: 'returnAt'),
        message: 'Vamos conversar mais tarde, com calma?',
      ),
    ).called(1);
    expect(cubit.state.sendAction, isA<Success<void>>());
  });

  test('a failed send keeps the message', () async {
    when(
      () => repository.startPause(
        returnAt: any(named: 'returnAt'),
        message: any(named: 'message'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'INVALID_RETURN_TIME'));
    final cubit = build()..onMessageChanged('Preciso de um tempo');

    await cubit.send();

    expect(cubit.state.message.value, 'Preciso de um tempo');
    expect(cubit.state.sendAction, isA<Initial>());
  });
}
