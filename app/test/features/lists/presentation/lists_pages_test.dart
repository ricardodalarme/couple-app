import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_item_status.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_kind.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_models.dart';
import 'package:flutter_bloc_starter/features/lists/data/repositories/lists_repository.dart';
import 'package:flutter_bloc_starter/features/lists/presentation/create_list/create_list_sheet.dart';
import 'package:flutter_bloc_starter/features/lists/presentation/detail/cubit/list_detail_cubit.dart';
import 'package:flutter_bloc_starter/features/lists/presentation/detail/list_detail_page.dart';
import 'package:flutter_bloc_starter/features/lists/presentation/lists/cubit/lists_cubit.dart';
import 'package:flutter_bloc_starter/features/lists/presentation/lists/lists_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_helpers/pump_app.dart';

class _MockListsRepository() extends Mock implements ListsRepository;

void main() {
  late ListsRepository repository;

  const shared = CoupleList(id: 'l1', title: 'Viagens', kind: ListKind.travel, isShared: true);
  const solo = CoupleList(id: 'l2', title: 'Filmes', kind: ListKind.movies);
  const item = ListItem(
    id: 'i1',
    listId: 'l1',
    title: 'Lisboa',
    status: ListItemStatus.planned,
    position: 0,
  );

  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  setUp(() {
    repository = _MockListsRepository();
    when(repository.getCoupleId).thenAnswer((_) async => 'couple-1');
    when(repository.getLists).thenAnswer((_) async => [shared, solo]);
    when(() => repository.getList(any()))
        .thenAnswer((_) async => const ListDetail(list: shared, items: [item]));
  });

  testWidgets('the lists page shows shared and private lists without platform calls', (
    tester,
  ) async {
    final cubit = ListsCubit(listsRepository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    final calls = <MethodCall>[];
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(SystemChannels.platform, (
      call,
    ) async {
      calls.add(call);

      return null;
    });
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        null,
      ),
    );

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const ListsPage()));
    await tester.pump();

    expect(find.text('Listas'), findsOneWidget);
    expect(find.text('Viagens'), findsOneWidget);
    expect(find.text('Filmes'), findsOneWidget);
    expect(find.text('Compartilhada'), findsOneWidget);
    expect(find.text('Privada'), findsOneWidget);
    expect(
      calls.where(
        (call) =>
            call.method == 'HapticFeedback.vibrate' ||
            call.method.toLowerCase().contains('notification'),
      ),
      isEmpty,
    );
  });

  testWidgets('the new-list action sits in the page app bar', (tester) async {
    final cubit = ListsCubit(listsRepository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const ListsPage()));
    await tester.pump();

    final action = find.descendant(
      of: find.byType(BaseAppBar),
      matching: find.byType(BaseRoundButton),
    );
    expect(action, findsOneWidget);
    expect(
      find.descendant(of: find.byType(BaseAppBar), matching: find.text('Listas')),
      findsOneWidget,
    );

    await tester.tap(action);
    await tester.pumpAndSettle();

    expect(find.text('Criar lista'), findsOneWidget);
  });

  testWidgets('the create sheet defaults to shared when the person has a partner', (tester) async {
    await tester.pumpApp(CreateListSheet(hasPartner: true, onCreate: (_, _, _) {}));

    expect(find.text('Vocês dois podem ver e mudar esta lista.'), findsOneWidget);
  });

  testWidgets('the create sheet defaults to private when the person is alone', (tester) async {
    await tester.pumpApp(CreateListSheet(hasPartner: false, onCreate: (_, _, _) {}));

    expect(find.text('Só você vê esta lista.'), findsOneWidget);
  });

  testWidgets('the create sheet asks for a name instead of creating', (tester) async {
    var created = 0;
    await tester.pumpApp(CreateListSheet(hasPartner: false, onCreate: (_, _, _) => created++));

    await tester.tap(find.text('Criar lista'));
    await tester.pump();

    expect(find.text('Dê um nome para a lista.'), findsOneWidget);
    expect(created, 0);
  });

  testWidgets('creating a list is unavailable until the lists load', (tester) async {
    when(repository.getLists).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = ListsCubit(listsRepository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const ListsPage()));
    await tester.pump();

    final button = tester.widget<BaseRoundButton>(find.byType(BaseRoundButton));
    expect(button.onPressed, isNull);
    expect(cubit.state.lists, isA<Failure>());
  });

  testWidgets('tapping an item toggles it done instead of opening the options sheet', (
    tester,
  ) async {
    when(
      () => repository.setItemStatus(
        id: any(named: 'id'),
        status: any(named: 'status'),
      ),
    ).thenAnswer((_) async => item.copyWith(status: ListItemStatus.done));
    final cubit = ListDetailCubit(listsRepository: repository);
    addTearDown(cubit.close);
    await cubit.load('l1');

    await tester.pumpApp(
      BlocProvider.value(
        value: cubit,
        child: const ListDetailPage(listId: 'l1'),
      ),
    );
    await tester.pump();

    await tester.tap(find.text('Lisboa'));
    await tester.pump();

    final detail = cubit.state.detail;
    expect(detail, isA<Success<ListDetail>>());
    expect((detail as Success<ListDetail>).value.items.single.isDone, isTrue);
    verify(() => repository.setItemStatus(id: 'i1', status: ListItemStatus.done)).called(1);
    expect(find.text('Marcar como feito'), findsNothing);

    await tester.tap(find.byIcon(AppIcons.more));
    await tester.pumpAndSettle();

    expect(find.text('Marcar como feito'), findsOneWidget);
  });

  testWidgets('the detail page shows the items and their status without platform calls', (
    tester,
  ) async {
    final cubit = ListDetailCubit(listsRepository: repository);
    addTearDown(cubit.close);
    await cubit.load('l1');

    final calls = <MethodCall>[];
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(SystemChannels.platform, (
      call,
    ) async {
      calls.add(call);

      return null;
    });
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        null,
      ),
    );

    await tester.pumpApp(
      BlocProvider.value(
        value: cubit,
        child: const ListDetailPage(listId: 'l1'),
      ),
    );
    await tester.pump();

    expect(find.text('Viagens'), findsOneWidget);
    expect(find.text('Lisboa'), findsOneWidget);
    expect(find.text('Planejado'), findsOneWidget);
    expect(find.text('Compartilhada'), findsOneWidget);
    expect(
      calls.where(
        (call) =>
            call.method == 'HapticFeedback.vibrate' ||
            call.method.toLowerCase().contains('notification'),
      ),
      isEmpty,
    );
  });
}
