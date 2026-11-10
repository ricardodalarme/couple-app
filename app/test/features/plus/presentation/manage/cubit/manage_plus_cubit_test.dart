import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/plus/presentation/manage/cubit/manage_plus_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockPlusRepository() extends Mock implements PlusRepository;

void main() {
  late PlusRepository repository;

  setUp(() => repository = _MockPlusRepository());

  ManagePlusCubit build() => ManagePlusCubit(plusRepository: repository);

  test('load reads the plan for the status rows', () async {
    when(() => repository.getPlus())
        .thenAnswer((_) async => const PlusState(hasPlus: true, plan: 'plus_annual'));
    final cubit = build();

    await cubit.load();

    expect((cubit.state.plus as Success<PlusState>).value.plan, 'plus_annual');
  });

  test('a failed plan read can be retried', () async {
    when(() => repository.getPlus()).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();

    await cubit.load();

    expect(cubit.state.plus, isA<Failure>());
  });

  test('the store management page becomes a success with its URL', () async {
    final url = Uri.parse('https://play.google.com/store/account/subscriptions');
    when(() => repository.getManagementUrl()).thenAnswer((_) async => url);
    final cubit = build();

    await cubit.openManagement();

    expect((cubit.state.manageAction as Success<Uri>).value, url);
  });

  test('a null management page is a calm failure', () async {
    when(() => repository.getManagementUrl()).thenAnswer((_) async => null);
    final cubit = build();

    await cubit.openManagement();

    expect((cubit.state.manageAction as Failure).exception.l10nKey, 'manageUnavailable');
  });

  test('an unavailable store keeps the management action retryable', () async {
    when(() => repository.getManagementUrl())
        .thenThrow(const LocalizedException(l10nKey: 'storeUnavailable'));
    final cubit = build();

    await cubit.openManagement();

    expect((cubit.state.manageAction as Failure).exception.l10nKey, 'storeUnavailable');

    cubit.clearManagement();
    expect(cubit.state.manageAction, isA<Initial>());
  });
}
