import 'package:flutter_bloc_starter/features/app/data/repositories/app_config_repository.dart';
import 'package:flutter_bloc_starter/features/app/presentation/version/cubit/version_gate_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAppConfigRepository() extends Mock implements AppConfigRepository;

void main() {
  late AppConfigRepository repository;

  setUp(() => repository = _MockAppConfigRepository());

  VersionGateCubit build({String installed = '0.1.1'}) =>
      VersionGateCubit(repository: repository, installedVersion: () async => installed);

  test('a lower minimum allows the app', () async {
    when(() => repository.getMinAppVersion()).thenAnswer((_) async => '0.1.0');
    final cubit = build();

    await cubit.check();

    expect(cubit.state.updateRequired, isFalse);
    expect(cubit.state.installedVersion, '0.1.1');
  });

  test('a higher minimum blocks the app', () async {
    when(() => repository.getMinAppVersion()).thenAnswer((_) async => '1.0.0');
    final cubit = build();

    await cubit.check();

    expect(cubit.state.updateRequired, isTrue);
  });

  test('a failing check never blocks the app', () async {
    when(() => repository.getMinAppVersion()).thenThrow(Exception('offline'));
    final cubit = build();

    await cubit.check();

    expect(cubit.state.updateRequired, isFalse);
  });

  test('versions compare by their dotted numbers', () {
    expect(isOlder('0.1.1', '0.1.2'), isTrue);
    expect(isOlder('0.1', '0.1.0'), isFalse);
    expect(isOlder('2.0.0', '1.9.9'), isFalse);
    expect(isOlder('1.0.0+12', '1.0.0'), isFalse);
  });
}
