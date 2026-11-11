import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/learned_items_repository.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/learned/cubit/learned_items_cubit.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/learned/learned_items_page.dart';
import 'package:flutter_bloc_starter/features/partner/data/repositories/partner_repository.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockLearnedItemsRepository() extends Mock implements LearnedItemsRepository;

class _MockPartnerRepository() extends Mock implements PartnerRepository;

void main() {
  late LearnedItemsRepository learnedItemsRepository;
  late PartnerRepository partnerRepository;

  final pending = LearnedItem(
    id: 'l1',
    target: LearnedTarget.partnerFact,
    text: 'Gosta de café',
    status: LearnedStatus.pending,
    createdAt: DateTime(2026, 11, 11),
  );
  final confirmed = LearnedItem(
    id: 'l2',
    target: LearnedTarget.date,
    text: 'Jantar na sexta',
    status: LearnedStatus.confirmed,
    createdAt: DateTime(2026, 11, 11),
  );
  final rejected = LearnedItem(
    id: 'l3',
    target: LearnedTarget.memory,
    text: 'Uma memória descartada',
    status: LearnedStatus.rejected,
    createdAt: DateTime(2026, 11, 11),
  );

  setUpAll(() {
    LocaleSettings.setLocaleSync(AppLocale.pt);
    registerFallbackValue(LearnedStatus.pending);
  });

  setUp(() {
    learnedItemsRepository = _MockLearnedItemsRepository();
    partnerRepository = _MockPartnerRepository();
    when(learnedItemsRepository.getItems).thenAnswer((_) async => [pending, confirmed, rejected]);
    when(() => learnedItemsRepository.setStatus(any(), any())).thenAnswer((_) async {});
    when(() => learnedItemsRepository.updateText(any(), any())).thenAnswer((_) async {});
    when(
      () => partnerRepository.addFact(
        id: any(named: 'id'),
        label: any(named: 'label'),
        value: any(named: 'value'),
        category: any(named: 'category'),
      ),
    ).thenAnswer((_) async {});
  });

  Future<LearnedItemsCubit> loaded() async {
    final cubit = LearnedItemsCubit(
      learnedItemsRepository: learnedItemsRepository,
      partnerRepository: partnerRepository,
    );
    addTearDown(cubit.close);
    await cubit.load();

    return cubit;
  }

  testWidgets('an empty list is calm, not an error', (tester) async {
    when(learnedItemsRepository.getItems).thenAnswer((_) async => []);
    final cubit = await loaded();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const LearnedItemsPage()));
    await tester.pump();

    expect(find.text('Nada guardado ainda'), findsOneWidget);
    expect(find.text('Não deu para carregar'), findsNothing);
  });

  testWidgets('pending comes first, confirmed follows and rejected stays hidden', (tester) async {
    final cubit = await loaded();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const LearnedItemsPage()));
    await tester.pump();

    expect(find.text('Para revisar'), findsOneWidget);
    expect(find.text('Confirmado'), findsOneWidget);
    expect(find.text('Gosta de café'), findsOneWidget);
    expect(find.text('Jantar na sexta'), findsOneWidget);
    expect(find.text('Uma memória descartada'), findsNothing);
    expect(find.text('Confirmar'), findsOneWidget);
    expect(find.text('Editar'), findsOneWidget);
    expect(find.text('Descartar'), findsOneWidget);
  });

  testWidgets('confirming a pending partner fact asks first and saves the note', (tester) async {
    final cubit = await loaded();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const LearnedItemsPage()));
    await tester.pump();

    await tester.tap(find.text('Confirmar'));
    await tester.pumpAndSettle();

    expect(find.text('Confirmar este aprendizado?'), findsOneWidget);

    await tester.tap(
      find.descendant(of: find.byType(BaseConfirmSheet), matching: find.text('Confirmar')),
    );
    await tester.pumpAndSettle();

    verify(() => learnedItemsRepository.setStatus('l1', LearnedStatus.confirmed)).called(1);
    verify(
      () => partnerRepository.addFact(
        id: any(named: 'id'),
        label: 'Da conversa',
        value: 'Gosta de café',
        category: null,
      ),
    ).called(1);
  });

  testWidgets('editing opens a sheet with the fixed target and saves the text', (tester) async {
    final cubit = await loaded();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const LearnedItemsPage()));
    await tester.pump();

    await tester.tap(find.text('Editar'));
    await tester.pumpAndSettle();

    expect(find.text('Sobre meu par'), findsWidgets);
    expect(tester.widget<BaseTextArea>(find.byType(BaseTextArea)).text, 'Gosta de café');

    await tester.enterText(find.byType(BaseTextArea), 'Gosta de chá');
    await tester.pump();
    await tester.tap(find.widgetWithText(BaseButton, 'Guardar'));
    await tester.pumpAndSettle();

    verify(() => learnedItemsRepository.updateText('l1', 'Gosta de chá')).called(1);
  });

  testWidgets('the failure state offers a retry', (tester) async {
    when(learnedItemsRepository.getItems).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = await loaded();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const LearnedItemsPage()));
    await tester.pump();

    expect(find.text('Não deu para carregar'), findsOneWidget);
    expect(find.text('Tentar novamente'), findsOneWidget);
  });
}
