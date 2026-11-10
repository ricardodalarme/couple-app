import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/help/data/repositories/support_repository.dart';
import 'package:flutter_bloc_starter/features/help/presentation/help/cubit/help_hub_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSupportRepository() extends Mock implements SupportRepository;

class _MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

void main() {
  late SupportRepository repository;
  late AuthenticationRepository authenticationRepository;
  late HelpHubCubit cubit;

  setUp(() {
    repository = _MockSupportRepository();
    authenticationRepository = _MockAuthenticationRepository();
    cubit = HelpHubCubit(
      repository: repository,
      authenticationRepository: authenticationRepository,
    );
    when(() => authenticationRepository.currentUserId).thenReturn('profile-a');
    when(() => repository.flushPending(authorId: any(named: 'authorId')))
        .thenAnswer((_) async => 0);
    when(() => repository.takeDiscarded()).thenAnswer((_) async => false);
    when(() => repository.pendingCount(authorId: any(named: 'authorId'))).thenReturn(0);
  });

  test('opening help sends what was saved offline and reads what remains', () async {
    when(() => repository.pendingCount(authorId: any(named: 'authorId'))).thenReturn(2);
    when(() => repository.flushPending(authorId: any(named: 'authorId')))
        .thenAnswer((_) async => 0);

    await cubit.load();

    verify(() => repository.flushPending(authorId: 'profile-a')).called(1);
    verify(() => repository.pendingCount(authorId: 'profile-a')).called(1);
    expect(cubit.state.flushAction, isA<Success<void>>());
    expect(cubit.state.pending, 2);
  });

  test('a permanently rejected entry is surfaced calmly', () async {
    when(() => repository.flushPending(authorId: any(named: 'authorId')))
        .thenAnswer((_) async => 1);

    await cubit.load();

    expect(cubit.state.discarded, 1);
  });

  test('a drop from an earlier startup flush is surfaced once', () async {
    when(() => repository.takeDiscarded()).thenAnswer((_) async => true);

    await cubit.load();

    expect(cubit.state.discarded, 1);
  });

  test('signed out shows no queue', () async {
    when(() => authenticationRepository.currentUserId).thenReturn(null);

    await cubit.load();

    verifyNever(() => repository.flushPending(authorId: any(named: 'authorId')));
    expect(cubit.state.pending, 0);
  });

  test('a failed flush still keeps the help content usable', () async {
    when(() => repository.flushPending(authorId: any(named: 'authorId')))
        .thenThrow(const LocalizedException(l10nKey: 'NETWORK'));

    await cubit.load();

    expect(cubit.state.flushAction, isA<Failure>());
    expect(cubit.state.pending, 0);
  });
}
