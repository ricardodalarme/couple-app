import 'package:flutter_bloc_starter/features/connect/data/repositories/connect_repository.dart';
import 'package:flutter_bloc_starter/features/connect/presentation/us/cubit/us_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockConnectRepository() extends Mock implements ConnectRepository;

void main() {
  late ConnectRepository repository;

  setUp(() {
    repository = _MockConnectRepository();
    when(() => repository.sendMissUs()).thenAnswer((_) async {});
  });

  test('sending marks it sent and cannot be sent twice', () async {
    final cubit = UsCubit(connectRepository: repository);

    await cubit.send();
    await cubit.send();

    expect(cubit.state.wasSent, isTrue);
    verify(() => repository.sendMissUs()).called(1);
  });

  test('a failed send can be tried again', () async {
    when(() => repository.sendMissUs()).thenThrow(Exception('offline'));
    final cubit = UsCubit(connectRepository: repository);

    await cubit.send();

    expect(cubit.state.wasSent, isFalse);
  });
}
