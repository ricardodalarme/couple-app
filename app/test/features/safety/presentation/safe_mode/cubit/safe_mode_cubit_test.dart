import 'package:flutter_bloc_starter/features/safety/data/repositories/safe_mode_repository.dart';
import 'package:flutter_bloc_starter/features/safety/presentation/safe_mode/cubit/safe_mode_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSafeModeRepository() extends Mock implements SafeModeRepository;

void main() {
  late SafeModeRepository repository;

  setUp(() {
    repository = _MockSafeModeRepository();
    when(() => repository.setOn(value: any(named: 'value'))).thenAnswer((_) async {});
  });

  test('it starts from what the device remembers, so a restart keeps it on', () {
    when(() => repository.isOn).thenReturn(true);

    expect(SafeModeCubit(repository: repository).state.isOn, isTrue);
  });

  test('switching it stores the choice on the device only', () async {
    when(() => repository.isOn).thenReturn(false);
    final cubit = SafeModeCubit(repository: repository);

    await cubit.set(value: true);

    expect(cubit.state.isOn, isTrue);
    verify(() => repository.setOn(value: true)).called(1);
  });
}
