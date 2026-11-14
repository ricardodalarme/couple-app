import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/capsules/data/data_sources/remote/capsules_data_source.dart';
import 'package:flutter_bloc_starter/features/capsules/data/data_sources/remote/queries/generated/Capsules.graphql.dart';
import 'package:flutter_bloc_starter/features/capsules/data/models/capsule.dart';
import 'package:flutter_bloc_starter/features/capsules/data/repositories/capsules_repository.dart';
import 'package:flutter_bloc_starter/features/capsules/presentation/capsules/cubit/capsules_cubit.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';

class _MockCapsulesRepository() extends Mock implements CapsulesRepository;

class _MockDataSource() extends Mock implements CapsulesDataSource;

class _MockTogether() extends Mock implements TogetherRepository;

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

    test('saving reports a missing or out-of-window open date', () async {
      final missing = build()..onBodyChanged('Oi, futuro');
      await missing.save(now: today);
      expect(missing.state.opensOn.error, CapsuleDateValidationError.empty);

      final tooSoon = build()
        ..onBodyChanged('Oi, futuro')
        ..onOpensOnChanged(DateTime(2026, 11, 18));
      await tooSoon.save(now: today);
      expect(tooSoon.state.opensOn.error, CapsuleDateValidationError.outOfRange);

      final tooFar = build()
        ..onBodyChanged('Oi, futuro')
        ..onOpensOnChanged(DateTime(2076, 11, 11));
      await tooFar.save(now: today);
      expect(tooFar.state.opensOn.error, CapsuleDateValidationError.outOfRange);

      final justRight = build()
        ..onBodyChanged('Oi, futuro')
        ..onOpensOnChanged(DateTime(2026, 11, 19));
      await justRight.save(now: today);
      expect(justRight.state.opensOn.isValid, isTrue);
    });

    test('saving reports a body over the limit', () async {
      final cubit = build()
        ..onBodyChanged('a' * (capsuleBodyMaxLength + 1))
        ..onOpensOnChanged(DateTime(2027));

      await cubit.save(now: today);

      expect(cubit.state.body.error, MaxLengthValidationError.tooLong);
      verifyNever(
        () => repository.add(
          id: any(named: 'id'),
          body: any(named: 'body'),
          opensOn: any(named: 'opensOn'),
          isShared: any(named: 'isShared'),
        ),
      );
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
      expect(cubit.state.body.value, '');
      expect(cubit.state.opensOn.value, isNull);
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

    blocTest<CapsulesCubit, CapsulesState>(
      'a failed delete keeps its own error, apart from the save slot',
      build: () {
        when(() => repository.delete(any()))
            .thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
        return build();
      },
      act: (cubit) => cubit.delete(
        Capsule(id: 'capsule-1', opensOn: DateTime(2027), isMine: true, isShared: false),
      ),
      expect: () => [
        isA<CapsulesState>().having((state) => state.deleteAction, 'deleteAction', isA<Loading>()),
        isA<CapsulesState>().having((state) => state.deleteAction, 'deleteAction', isA<Failure>()),
        isA<CapsulesState>().having((state) => state.deleteAction, 'deleteAction', isA<Initial>()),
      ],
      verify: (_) => verify(() => repository.delete('capsule-1')).called(1),
    );
  });

  group('CapsulesRepository', () {
    test('the text of a closed capsule is never kept', () async {
      final dataSource = _MockDataSource();
      when(dataSource.getCapsules).thenAnswer(
        (_) async => [
          _node('a', DateTime(2026, 12, 1), 'segredo'),
          _node('b', DateTime(2026, 11, 11), 'aberta'),
        ],
      );
      final repository = CapsulesRepository(
        dataSource: dataSource,
        togetherRepository: _MockTogether(),
      );

      final capsules = await repository.getCapsules(now: DateTime(2026, 11, 11, 18));

      expect(capsules.first.body, isNull);
      expect(capsules.first.isOpen, isFalse);
      expect(capsules.last.body, 'aberta');
    });

    test('ownership and sharing come from the server flags', () async {
      final dataSource = _MockDataSource();
      when(dataSource.getCapsules).thenAnswer(
        (_) async => [
          QueryCapsulescapsulesCollectionedgesnode(
            id: 'a',
            isMine: false,
            isShared: true,
            body: 'do parceiro',
            opensOn: DateTime(2026, 11, 1),
          ),
          QueryCapsulescapsulesCollectionedgesnode(
            id: 'b',
            body: 'sem flags',
            opensOn: DateTime(2026, 11, 1),
          ),
        ],
      );
      final repository = CapsulesRepository(
        dataSource: dataSource,
        togetherRepository: _MockTogether(),
      );

      final capsules = await repository.getCapsules(now: DateTime(2026, 11, 11));

      expect(capsules.first.isMine, isFalse);
      expect(capsules.first.isShared, isTrue);
      expect(capsules.last.isMine, isFalse);
      expect(capsules.last.isShared, isFalse);
    });
  });
}

QueryCapsulescapsulesCollectionedgesnode _node(String id, DateTime opensOn, String body) =>
    QueryCapsulescapsulesCollectionedgesnode(
      id: id,
      isMine: true,
      isShared: false,
      body: body,
      opensOn: opensOn,
    );
