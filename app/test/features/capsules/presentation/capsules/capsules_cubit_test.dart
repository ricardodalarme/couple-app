import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/capsules/data/data_sources/capsules_data_source.dart';
import 'package:flutter_bloc_starter/features/capsules/data/data_sources/queries/generated/Capsules.graphql.dart';
import 'package:flutter_bloc_starter/features/capsules/data/repositories/capsules_repository.dart';
import 'package:flutter_bloc_starter/features/capsules/presentation/capsules/cubit/capsules_cubit.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockCapsulesRepository() extends Mock implements CapsulesRepository;

class _MockDataSource() extends Mock implements CapsulesDataSource;

class _MockTogether() extends Mock implements TogetherRepository;

class _MockAuth() extends Mock implements AuthenticationRepository;

void main() {
  final today = DateTime(2026, 11, 11);

  group('CapsulesCubit', () {
    late CapsulesRepository repository;

    setUp(() {
      repository = _MockCapsulesRepository();
      when(() => repository.getCapsules()).thenAnswer((_) async => const []);
      when(
        () => repository.add(
          id: any(named: 'id'),
          body: any(named: 'body'),
          opensOn: any(named: 'opensOn'),
          isShared: any(named: 'isShared'),
        ),
      ).thenAnswer((_) async {});
    });

    CapsulesCubit build() => CapsulesCubit(capsulesRepository: repository);

    test('a capsule needs text and a date from tomorrow to fifty years ahead', () {
      final cubit = build()..onBodyChanged('Oi, futuro');
      expect(cubit.state.canSave(today), isFalse);

      cubit.onOpensOnChanged(DateTime(2026, 11, 11));
      expect(cubit.state.canSave(today), isFalse);

      cubit.onOpensOnChanged(DateTime(2026, 11, 12));
      expect(cubit.state.canSave(today), isTrue);

      cubit.onOpensOnChanged(DateTime(2076, 11, 11));
      expect(cubit.state.canSave(today), isTrue);

      cubit.onOpensOnChanged(DateTime(2076, 11, 12));
      expect(cubit.state.canSave(today), isFalse);
    });

    test('saving clears the form and reads the list again', () async {
      final cubit = build()
        ..onBodyChanged('Oi, futuro')
        ..onOpensOnChanged(DateTime(2027))
        ..onSharedChanged(true);

      await cubit.save(now: today);

      verify(
        () => repository.add(
          id: any(named: 'id'),
          body: 'Oi, futuro',
          opensOn: DateTime(2027),
          isShared: true,
        ),
      ).called(1);
      expect(cubit.state.body, '');
      expect(cubit.state.opensOn, isNull);
      verify(() => repository.getCapsules()).called(1);
    });

    test('a past date is never saved', () async {
      final cubit = build()
        ..onBodyChanged('Oi')
        ..onOpensOnChanged(DateTime(2020));

      await cubit.save(now: today);

      verifyNever(
        () => repository.add(
          id: any(named: 'id'),
          body: any(named: 'body'),
          opensOn: any(named: 'opensOn'),
          isShared: any(named: 'isShared'),
        ),
      );
    });
  });

  group('CapsulesRepository', () {
    test('the text of a closed capsule is never kept', () async {
      final dataSource = _MockDataSource();
      final auth = _MockAuth();
      when(() => auth.currentUserId).thenReturn('me');
      when(dataSource.getCapsules).thenAnswer(
        (_) async => [
          _node('a', DateTime(2026, 12, 1), 'segredo'),
          _node('b', DateTime(2026, 11, 11), 'aberta'),
        ],
      );
      final repository = CapsulesRepository(
        dataSource: dataSource,
        togetherRepository: _MockTogether(),
        authenticationRepository: auth,
      );

      final capsules = await repository.getCapsules(now: DateTime(2026, 11, 11, 18));

      expect(capsules.first.body, isNull);
      expect(capsules.first.isOpen, isFalse);
      expect(capsules.last.body, 'aberta');
    });
  });
}

QueryCapsulescapsulesCollectionedgesnode _node(String id, DateTime opensOn, String body) =>
    QueryCapsulescapsulesCollectionedgesnode(id: id, authorId: 'me', body: body, opensOn: opensOn);
