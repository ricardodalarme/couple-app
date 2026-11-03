import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/account/data/repositories/account_repository.dart';
import 'package:flutter_bloc_starter/features/account/presentation/delete_account/cubit/delete_account_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAccountRepository() extends Mock implements AccountRepository;

void main() {
  group('DeleteAccountCubit', () {
    late AccountRepository accountRepository;
    late DeleteAccountCubit cubit;

    setUp(() {
      accountRepository = MockAccountRepository();
      cubit = DeleteAccountCubit(accountRepository: accountRepository);
    });

    tearDown(() => cubit.close());

    test('initial state is correct', () {
      expect(cubit.state, const DeleteAccountState());
    });

    test('emits Loading then Success when deletion succeeds', () async {
      when(() => accountRepository.deleteAccount()).thenAnswer((_) async {});

      final states = <DeleteAccountState>[];
      final subscription = cubit.stream.listen(states.add);
      addTearDown(subscription.cancel);

      await cubit.deleteAccount();
      await Future<void>.delayed(Duration.zero);

      expect(states, [
        const DeleteAccountState(deletion: Loading()),
        const DeleteAccountState(deletion: Success<void>(null)),
      ]);
    });

    test('emits Failure when deletion fails', () async {
      when(() => accountRepository.deleteAccount())
          .thenThrow(const LocalizedException(l10nKey: 'account_deletion_failed'));

      final states = <DeleteAccountState>[];
      final subscription = cubit.stream.listen(states.add);
      addTearDown(subscription.cancel);

      await cubit.deleteAccount();
      await Future<void>.delayed(Duration.zero);

      expect(states, [
        const DeleteAccountState(deletion: Loading()),
        const DeleteAccountState(
          deletion: Failure(LocalizedException(l10nKey: 'account_deletion_failed')),
        ),
      ]);
    });
  });
}
