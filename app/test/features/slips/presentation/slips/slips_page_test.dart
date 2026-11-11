import 'dart:async';

import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_entry.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slips/cubit/slips_list_cubit.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slips/slips_page.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slips/widgets/slips_groups.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockSlipRepository() extends Mock implements SlipRepository;

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  late SlipRepository repository;
  late StreamController<void> changes;

  setUp(() {
    repository = _MockSlipRepository();
    changes = StreamController<void>.broadcast();
    when(() => repository.onChanged).thenAnswer((_) => changes.stream);
  });

  tearDown(() => changes.close());

  void stubPage(List<SlipEntry> items) {
    when(
      () => repository.getSlips(
        after: any(named: 'after'),
        since: any(named: 'since'),
        pageSize: any(named: 'pageSize'),
      ),
    ).thenAnswer((_) async => SlipPage(items: items, hasNext: false));
  }

  Future<SlipsListCubit> build() async {
    final cubit = SlipsListCubit(slipRepository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    return cubit;
  }

  Future<void> pumpPage(WidgetTester tester, SlipsListCubit cubit) async {
    await tester.pumpApp(BlocProvider.value(value: cubit, child: const SlipsPage()));
    await tester.pump();
  }

  testWidgets('an empty list shows only the title and the empty invitation', (tester) async {
    stubPage(const []);
    final cubit = await build();

    await pumpPage(tester, cubit);

    expect(find.byType(BaseEmptyState), findsOneWidget);
    expect(find.byType(BaseChoiceChip), findsNothing);
    expect(find.byType(BaseTextLink), findsNothing);
    expect(find.byType(BaseRoundButton), findsNothing);
    expect(find.byType(SlipsGroups), findsNothing);
    expect(find.text('Slips'), findsOneWidget);
  });

  testWidgets('a populated list keeps the scopes, search and the history link', (tester) async {
    stubPage([SlipEntry(id: 'a', body: 'Fez café sem eu pedir', createdAt: DateTime.now())]);
    final cubit = await build();

    await pumpPage(tester, cubit);

    expect(find.byType(BaseEmptyState), findsNothing);
    expect(find.byType(BaseChoiceChip), findsNWidgets(2));
    expect(find.byType(BaseTextLink), findsOneWidget);
    expect(find.byType(BaseRoundButton), findsOneWidget);
    expect(find.byType(SlipsGroups), findsOneWidget);
    expect(find.text('Fez café sem eu pedir'), findsOneWidget);
  });

  testWidgets('search filters the loaded slips and reports no matches', (tester) async {
    stubPage([SlipEntry(id: 'a', body: 'Fez café sem eu pedir', createdAt: DateTime.now())]);
    final cubit = await build();

    await pumpPage(tester, cubit);
    cubit
      ..openSearch()
      ..onQueryChanged('café');
    await tester.pump();
    await tester.pump();

    expect(find.text('Fez café sem eu pedir'), findsOneWidget);

    cubit.onQueryChanged('xyz');
    await tester.pump();
    await tester.pump();

    expect(find.byType(SlipsGroups), findsNothing);
    expect(find.byType(BaseEmptyState), findsOneWidget);
  });
}
