import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity_service/connectivity_service.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/app/presentation/connectivity/cubit/connectivity_cubit.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/chat_models.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/hard_conversation_draft.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/chat_repository.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/hard_conversation_repository.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/hard_conversation/cubit/hard_conversation_cubit.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/hard_conversation/hard_conversation_page.dart';
import 'package:flutter_bloc_starter/features/repair/data/repositories/repair_repository.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/pause/cubit/pause_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockHardConversationRepository() extends Mock implements HardConversationRepository;

class _MockChatRepository() extends Mock implements ChatRepository;

class _MockConnectivityService() extends Mock implements ConnectivityService;

class _MockRepairRepository() extends Mock implements RepairRepository;

class _TestRouter() extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HardConversationRoute.page, initial: true),
    AutoRoute(page: PauseRoute.page, fullscreenDialog: true),
  ];
}

void main() {
  late HardConversationRepository repository;
  late ChatRepository chatRepository;
  late ConnectivityService connectivityService;
  late StreamController<bool> connectivity;

  setUpAll(() {
    LocaleSettings.setLocaleSync(AppLocale.pt);
    registerFallbackValue(HardConversationTone.neutral);
    registerFallbackValue(
      HardConversationDraft(
        step: HardConversationStep.whatHappened,
        whatChoice: '',
        whatText: '',
        needChoice: '',
        needText: '',
        message: '',
        savedAt: DateTime(2026),
      ),
    );
  });

  setUp(() {
    repository = _MockHardConversationRepository();
    chatRepository = _MockChatRepository();
    connectivityService = _MockConnectivityService();
    connectivity = StreamController<bool>.broadcast();
    when(chatRepository.getStatus)
        .thenAnswer((_) async => (messagesLeft: 5, limit: 20, isEnabled: true, hasPlus: true));
    when(repository.readDraft).thenAnswer((_) async => null);
    when(repository.clearDraft).thenAnswer((_) async {});
    when(() => repository.saveDraft(any())).thenAnswer((_) async {});
    when(() => repository.sendAsNote(any())).thenAnswer((_) async {});
    when(() => connectivityService.onStatusChange).thenAnswer((_) => connectivity.stream);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (_) async => null,
    );
  });

  tearDown(() => connectivity.close());

  void stubReply(Stream<ChatEvent> Function() events) {
    when(
      () => repository.generate(
        what: any(named: 'what'),
        need: any(named: 'need'),
        locale: any(named: 'locale'),
        session: any(named: 'session'),
        tone: any(named: 'tone'),
      ),
    ).thenAnswer((_) => events());
  }

  Future<HardConversationCubit> pumpPage(WidgetTester tester, {bool isOnline = true}) async {
    when(() => connectivityService.hasInternetAccess).thenAnswer((_) async => isOnline);
    final connectivityCubit = ConnectivityCubit(connectivityService: connectivityService);
    addTearDown(connectivityCubit.close);
    await connectivityCubit.start();
    final cubit = HardConversationCubit(repository: repository, chatRepository: chatRepository);
    addTearDown(cubit.close);
    await cubit.load();

    await tester.pumpApp(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: connectivityCubit),
          BlocProvider.value(value: cubit),
        ],
        child: const HardConversationPage(),
      ),
    );
    await tester.pump();
    return cubit;
  }

  testWidgets('the three steps end with the generated sentence', (tester) async {
    stubReply(
      () => Stream.fromIterable([
        const ChatDelta('Percebi que fiquei no celular. '),
        const ChatDelta('Posso te ouvir agora?'),
        const ChatDone([]),
      ]),
    );
    final cubit = await pumpPage(tester);

    expect(find.text('O que aconteceu?'), findsOneWidget);
    expect(find.text('Ela se sentiu ignorada'), findsOneWidget);
    expect(find.text('Outro: escrever'), findsOneWidget);
    expect(find.byType(BaseOptionTile), findsNWidgets(4));
    expect(find.byType(BaseChoiceChip), findsNothing);
    expect(
      tester.widget<BaseButton>(find.widgetWithText(BaseButton, 'Próximo')).isEnabled,
      isFalse,
    );

    await tester.tap(find.text('Ela se sentiu ignorada'));
    await tester.pump();

    expect(cubit.state.whatChoice, 'Ela se sentiu ignorada');
    expect(
      tester
          .widget<BaseOptionTile>(find.widgetWithText(BaseOptionTile, 'Ela se sentiu ignorada'))
          .isSelected,
      isTrue,
    );
    expect(tester.widget<BaseButton>(find.widgetWithText(BaseButton, 'Próximo')).isEnabled, isTrue);

    await tester.tap(find.text('Próximo'));
    await tester.pump();

    expect(find.text('Do que eu preciso?'), findsOneWidget);
    expect(find.text('Ser ouvido'), findsOneWidget);

    await tester.tap(find.text('Ser ouvido'));
    await tester.pump();
    await tester.tap(find.text('Próximo'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    expect(find.text('Como dizer'), findsOneWidget);
    expect(find.text('Percebi que fiquei no celular. Posso te ouvir agora?'), findsOneWidget);
    expect(cubit.state.step, HardConversationStep.howToSay);
  });

  testWidgets('the first step can open the pause flow', (tester) async {
    AppInjector.instance.registerFactory<HardConversationCubit>(
      () => HardConversationCubit(repository: repository, chatRepository: chatRepository),
    );
    AppInjector.instance.registerFactory<PauseCubit>(
      () => PauseCubit(repairRepository: _MockRepairRepository()),
    );
    addTearDown(() {
      AppInjector.instance.unregister<HardConversationCubit>();
      AppInjector.instance.unregister<PauseCubit>();
    });

    final router = _TestRouter();
    await tester.pumpWidget(
      TranslationProvider(
        child: AppThemeHost(
          initialVariant: AppThemeVariant.rose,
          child: Builder(
            builder: (context) => BaseApp.router(
              routerConfig: router.config(),
              theme: AppTheme.light(AppThemeScope.of(context)),
              supportedLocales: AppLocaleUtils.supportedLocales,
            ),
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(find.text('Preciso de pausa'), findsOneWidget);

    await tester.tap(find.text('Preciso de pausa'));
    await tester.pumpAndSettle();

    expect(router.stack.map((route) => route.name), contains(PauseRoute.name));
  });

  testWidgets('the sentence can be edited, copied and sent as a note', (tester) async {
    stubReply(
      () => Stream.fromIterable([const ChatDelta('Podemos conversar?'), const ChatDone([])]),
    );
    final cubit = await pumpPage(tester);
    await tester.runAsync(() async {
      await cubit.selectWhat('Ela se sentiu ignorada');
      await cubit.next();
      await cubit.selectNeed('Ser ouvido');
      await cubit.next();
    });
    await tester.pump();

    await tester.enterText(find.byType(BaseTextArea), 'Uma frase que eu editei.');
    await tester.pump();
    expect(cubit.state.message.value, 'Uma frase que eu editei.');

    await tester.tap(find.text('Copiar'));
    await tester.pump();
    expect(find.text('Copiado'), findsOneWidget);

    await tester.tap(find.text('Enviar como recado'));
    await tester.pump();
    verify(() => repository.sendAsNote('Uma frase que eu editei.')).called(1);
    expect(find.text('Recado enviado'), findsOneWidget);
  });

  testWidgets('offline keeps the person out of the model step', (tester) async {
    final cubit = await pumpPage(tester, isOnline: false);

    await tester.tap(find.text('Ela se sentiu ignorada'));
    await tester.pump();
    await tester.tap(find.text('Próximo'));
    await tester.pump();
    await tester.tap(find.text('Ser ouvido'));
    await tester.pump();

    expect(find.text('Sem conexão. A frase de abertura precisa de internet.'), findsOneWidget);
    expect(
      tester.widget<BaseButton>(find.widgetWithText(BaseButton, 'Próximo')).isEnabled,
      isFalse,
    );
    expect(cubit.state.step, HardConversationStep.whatINeed);
  });

  testWidgets('without consent the page asks first and can turn it on', (tester) async {
    var enabled = false;
    when(chatRepository.getStatus)
        .thenAnswer((_) async => (messagesLeft: 5, limit: 20, isEnabled: enabled, hasPlus: true));
    when(chatRepository.enable).thenAnswer((_) async => enabled = true);

    final cubit = await pumpPage(tester);

    expect(find.text('Ligar a conversa'), findsOneWidget);
    await tester.tap(find.text('Ligar a conversa'));
    await tester.pump();
    await tester.pump();

    verify(chatRepository.enable).called(1);
    expect(cubit.state.gate, HardConversationGate.ready);
    expect(find.text('O que aconteceu?'), findsOneWidget);
  });

  testWidgets('a free person sees the hard-conversation gate with a plans action', (tester) async {
    when(chatRepository.getStatus)
        .thenAnswer((_) async => (messagesLeft: 0, limit: 0, isEnabled: false, hasPlus: false));

    await pumpPage(tester);

    expect(find.text('Preparar uma conversa faz parte do Plus'), findsOneWidget);
    expect(find.text('As três etapas e a sugestão de abertura estão no Plus.'), findsOneWidget);
    expect(find.widgetWithText(BaseButton, 'Ver planos'), findsOneWidget);
    expect(find.text('A conversa faz parte do Plus'), findsNothing);
  });

  testWidgets('the daily limit shows the Plus limit card', (tester) async {
    when(chatRepository.getStatus)
        .thenAnswer((_) async => (messagesLeft: 0, limit: 20, isEnabled: true, hasPlus: true));

    await pumpPage(tester);

    expect(find.text('As mensagens de hoje acabaram'), findsOneWidget);
  });

  testWidgets('a draft from today is hydrated on open', (tester) async {
    when(repository.readDraft).thenAnswer(
      (_) async => HardConversationDraft(
        step: HardConversationStep.howToSay,
        whatChoice: 'Brigamos por dinheiro',
        whatText: '',
        needChoice: 'Combinar algo',
        needText: '',
        message: 'Podemos falar com calma?',
        savedAt: DateTime(2026, 3, 10, 12),
      ),
    );

    await pumpPage(tester);

    expect(find.text('Como dizer'), findsOneWidget);
    expect(find.text('Podemos falar com calma?'), findsOneWidget);
  });
}
