import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/repair/data/repositories/repair_repository.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/quick_repair/cubit/quick_repair_cubit.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/soft_start/cubit/soft_start_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRepairRepository() extends Mock implements RepairRepository;

void main() {
  late RepairRepository repository;

  setUp(() {
    repository = _MockRepairRepository();
    when(
      () => repository.sendRepair(
        message: any(named: 'message'),
        preset: any(named: 'preset'),
      ),
    ).thenAnswer((_) async {});
  });

  QuickRepairCubit build() => QuickRepairCubit(repairRepository: repository);

  test('send is disabled for an empty message', () async {
    final cubit = build()..onTextChanged('   ');

    await cubit.send();

    verifyNever(
      () => repository.sendRepair(
        message: any(named: 'message'),
        preset: any(named: 'preset'),
      ),
    );
  });

  test('a preset is sent with its key and editing it drops the key', () async {
    final cubit = build()..onPresetChosen('restart', 'Podemos recomeçar?');
    expect(cubit.state.preset, 'restart');

    cubit.onTextChanged('Podemos recomeçar, por favor?');
    expect(cubit.state.preset, isNull);

    await cubit.send();

    verify(() => repository.sendRepair(message: 'Podemos recomeçar, por favor?', preset: null))
        .called(1);
    expect(cubit.state.sendAction, isA<Success<void>>());
  });

  test('a failed send keeps the message as a draft', () async {
    when(
      () => repository.sendRepair(
        message: any(named: 'message'),
        preset: any(named: 'preset'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build()..onTextChanged('Desculpa');

    await cubit.send();

    expect(cubit.state.text, 'Desculpa');
    expect(cubit.state.sendAction, isA<Initial>());
  });

  test('start carries over the soft start sentence', () {
    final cubit = build()..start('Eu sinto cansaço quando x. Eu preciso de y.');

    expect(cubit.state.text, 'Eu sinto cansaço quando x. Eu preciso de y.');
  });

  test('the soft start needs all three blanks', () {
    final cubit = SoftStartCubit()
      ..onFeelingChanged('cansado')
      ..onSituationChanged('a louça fica');
    expect(cubit.state.isComplete, isFalse);

    cubit.onNeedChanged('ajuda');
    expect(cubit.state.isComplete, isTrue);
  });
}
