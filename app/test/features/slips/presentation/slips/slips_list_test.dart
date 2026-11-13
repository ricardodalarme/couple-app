import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_entry.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slips/cubit/slips_list_cubit.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slips/widgets/slips_groups.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSlipRepository() extends Mock implements SlipRepository;

SlipEntry _slip(String id, DateTime at) => SlipEntry(id: id, body: id, createdAt: at);

void main() {
  late SlipRepository repository;
  late StreamController<void> changes;

  setUp(() {
    repository = _MockSlipRepository();
    changes = StreamController<void>.broadcast();
    when(() => repository.onChanged).thenAnswer((_) => changes.stream);
  });

  tearDown(() => changes.close());

  SlipsListCubit build() => SlipsListCubit(slipRepository: repository);

  void stubPage(SlipPage page, {String? after}) => when(
    () => repository.getSlips(
      after: after,
      since: any(named: 'since'),
      archived: any(named: 'archived'),
      pageSize: any(named: 'pageSize'),
    ),
  ).thenAnswer((_) async => page);

  group('groupByWeek', () {
    test('puts slips from the same Monday-to-Sunday week together, keeping the order', () {
      final groups = groupByWeek([
        _slip('a', DateTime(2026, 11, 9, 20)),
        _slip('b', DateTime(2026, 11, 8, 9)),
        _slip('c', DateTime(2026, 11, 2, 9)),
      ]);

      expect(groups.keys, [DateTime(2026, 11, 9), DateTime(2026, 11, 2)]);
      expect(groups[DateTime(2026, 11, 9)]!.map((slip) => slip.id), ['a']);
      expect(groups[DateTime(2026, 11, 2)]!.map((slip) => slip.id), ['b', 'c']);
    });
  });

  group('SlipsListCubit', () {
    test('load shows the first page', () async {
      stubPage(SlipPage(items: [_slip('a', DateTime(2026, 11, 9))], hasNext: true, cursor: 'c1'));
      final cubit = build();

      await cubit.load();

      expect(cubit.state.slips, isA<Success<List<SlipEntry>>>());
      expect(cubit.state.hasNext, isTrue);
      expect(cubit.state.cursor, 'c1');
    });

    test('an empty page is a success with no items, never an error', () async {
      stubPage(const SlipPage(items: [], hasNext: false));
      final cubit = build();

      await cubit.load();

      expect((cubit.state.slips as Success<List<SlipEntry>>).value, isEmpty);
    });

    test('loadMore appends the next page without duplicates', () async {
      stubPage(SlipPage(items: [_slip('a', DateTime(2026, 11, 9))], hasNext: true, cursor: 'c1'));
      final cubit = build();
      await cubit.load();

      stubPage(
        SlipPage(
          items: [_slip('a', DateTime(2026, 11, 9)), _slip('b', DateTime(2026, 11, 2))],
          hasNext: false,
          cursor: 'c2',
        ),
        after: 'c1',
      );
      await cubit.loadMore();

      final items = (cubit.state.slips as Success<List<SlipEntry>>).value;
      expect(items.map((slip) => slip.id), ['a', 'b']);
      expect(cubit.state.hasNext, isFalse);
    });

    test('loadMore does nothing when there is no next page', () async {
      stubPage(const SlipPage(items: [], hasNext: false));
      final cubit = build();
      await cubit.load();
      await cubit.loadMore();

      verify(
        () => repository.getSlips(
          after: any(named: 'after'),
          since: any(named: 'since'),
          archived: any(named: 'archived'),
          pageSize: any(named: 'pageSize'),
        ),
      ).called(1);
    });

    test('changing the scope reads the list again from the start', () async {
      stubPage(const SlipPage(items: [], hasNext: false));
      final cubit = build();
      await cubit.load();

      await cubit.changeScope(SlipsScope.all);

      expect(cubit.state.scope, SlipsScope.all);
      verify(
        () => repository.getSlips(since: null, archived: false, pageSize: any(named: 'pageSize')),
      ).called(1);
    });

    test('the archived scope reads the slips taken out of the timeline', () async {
      stubPage(const SlipPage(items: [], hasNext: false));
      final cubit = build();
      await cubit.load();

      await cubit.changeScope(SlipsScope.archived);

      verify(
        () => repository.getSlips(since: null, archived: true, pageSize: any(named: 'pageSize')),
      ).called(1);
    });

    test('a failed first load shows a failure', () async {
      when(
        () => repository.getSlips(
          after: any(named: 'after'),
          since: any(named: 'since'),
          archived: any(named: 'archived'),
          pageSize: any(named: 'pageSize'),
        ),
      ).thenAnswer((_) async => throw Exception());
      final cubit = build();

      await cubit.load();

      expect(cubit.state.slips, isA<Failure>());
    });

    test('a saved slip reloads the list', () async {
      stubPage(const SlipPage(items: [], hasNext: false));
      final cubit = build()..start();
      await Future<void>.delayed(Duration.zero);

      changes.add(null);
      await Future<void>.delayed(Duration.zero);

      verify(
        () => repository.getSlips(
          after: any(named: 'after'),
          since: any(named: 'since'),
          archived: any(named: 'archived'),
          pageSize: any(named: 'pageSize'),
        ),
      ).called(2);
      await cubit.close();
    });
  });
}
