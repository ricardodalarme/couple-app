import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/fight_style/data/data_sources/fight_style_data_source.dart';
import 'package:flutter_bloc_starter/features/fight_style/data/repositories/fight_style_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class _MockFightStyleDataSource() extends Mock implements FightStyleDataSource;

void main() {
  late FightStyleDataSource dataSource;
  late FightStyleRepository repository;

  const first = ['withdraw', 'repair', 'pursue', 'avoid'];
  const retaken = ['pursue', 'withdraw', 'repair', 'avoid'];

  setUpAll(() {
    registerFallbackValue(<String>[]);
    registerFallbackValue(<String?>[]);
  });

  setUp(() {
    dataSource = _MockFightStyleDataSource();
    repository = FightStyleRepository(dataSource: dataSource);
  });

  test('inserts the first ranking and never updates another row', () async {
    when(() => dataSource.getResult()).thenAnswer((_) async => null);
    when(() => dataSource.insertResult(any())).thenAnswer((_) async {});

    await repository.saveRanked(first);

    verify(() => dataSource.insertResult(first)).called(1);
    verifyNever(
      () => dataSource.updateResult(
        id: any(named: 'id'),
        ranked: any(named: 'ranked'),
      ),
    );
  });

  test('a retake updates the saved row so the latest ranking wins', () async {
    when(() => dataSource.getResult()).thenAnswer((_) async => (id: 'q1', ranked: first));
    when(
      () => dataSource.updateResult(
        id: any(named: 'id'),
        ranked: any(named: 'ranked'),
      ),
    ).thenAnswer((_) async {});

    await repository.saveRanked(retaken);

    verify(() => dataSource.updateResult(id: 'q1', ranked: retaken)).called(1);
    verifyNever(() => dataSource.insertResult(any()));
  });

  test('a race on the unique key falls back to updating the saved row', () async {
    var reads = 0;
    when(() => dataSource.getResult()).thenAnswer((_) async {
      reads++;

      return reads == 1 ? null : (id: 'q1', ranked: first);
    });
    when(() => dataSource.insertResult(any()))
        .thenThrow(const LocalizedException(l10nKey: '23505'));
    when(
      () => dataSource.updateResult(
        id: any(named: 'id'),
        ranked: any(named: 'ranked'),
      ),
    ).thenAnswer((_) async {});

    await repository.saveRanked(retaken);

    verify(() => dataSource.updateResult(id: 'q1', ranked: retaken)).called(1);
  });

  test('a retake whose row is gone surfaces as a failure', () async {
    when(() => dataSource.getResult()).thenAnswer((_) async => (id: 'q1', ranked: first));
    when(
      () => dataSource.updateResult(
        id: any(named: 'id'),
        ranked: any(named: 'ranked'),
      ),
    ).thenThrow(const NoDataException());

    await expectLater(repository.saveRanked(retaken), throwsA(isA<NoDataException>()));
  });

  test('a repair tool is a private learning row of kind trigger', () async {
    when(
      () => dataSource.addRepairTool(
        id: any(named: 'id'),
        note: any(named: 'note'),
      ),
    ).thenAnswer((_) async {});

    await repository.addRepairTool('  Você tende a se afastar primeiro.  ');

    verify(
      () => dataSource.addRepairTool(
        id: any(named: 'id'),
        note: 'Você tende a se afastar primeiro.',
      ),
    ).called(1);
  });
}
