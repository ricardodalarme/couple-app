import 'dart:async';

import 'package:connectivity_service/connectivity_service.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/app/presentation/connectivity/cubit/connectivity_cubit.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/chat_models.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/chat_repository.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/learned_items_repository.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/chat/chat_page.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/chat/cubit/chat_cubit.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/chat/widgets/save_learning_sheet.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockChatRepository() extends Mock implements ChatRepository;

class _MockLearnedItemsRepository() extends Mock implements LearnedItemsRepository;

class _MockConnectivityService() extends Mock implements ConnectivityService;

void main() {
  late ChatRepository chatRepository;
  late LearnedItemsRepository learnedItemsRepository;
  late ConnectivityService connectivityService;
  late StreamController<bool> connectivity;

  setUpAll(() {
    LocaleSettings.setLocaleSync(AppLocale.pt);
    registerFallbackValue(ChatMode.free);
    registerFallbackValue(LearnedTarget.partnerFact);
  });

  setUp(() {
    chatRepository = _MockChatRepository();
    learnedItemsRepository = _MockLearnedItemsRepository();
    connectivityService = _MockConnectivityService();
    connectivity = StreamController<bool>(sync: true);
    addTearDown(connectivity.close);
    when(chatRepository.getStatus)
        .thenAnswer((_) async => (messagesLeft: 5, isEnabled: true, hasPlus: true));
    when(
      () => learnedItemsRepository.add(
        target: any(named: 'target'),
        text: any(named: 'text'),
        excerpt: any(named: 'excerpt'),
      ),
    ).thenAnswer((_) async {});
    when(() => connectivityService.onStatusChange).thenAnswer((_) => connectivity.stream);
  });

  Future<({ChatCubit chat, ConnectivityCubit connectivity})> build({required bool isOnline}) async {
    when(() => connectivityService.hasInternetAccess).thenAnswer((_) async => isOnline);
    final connectivityCubit = ConnectivityCubit(connectivityService: connectivityService);
    addTearDown(connectivityCubit.close);
    await connectivityCubit.start();
    final chatCubit = ChatCubit(
      chatRepository: chatRepository,
      learnedItemsRepository: learnedItemsRepository,
    );
    addTearDown(chatCubit.close);
    await chatCubit.load();

    return (chat: chatCubit, connectivity: connectivityCubit);
  }

  Future<void> pumpChat(
    WidgetTester tester,
    ChatCubit chat,
    ConnectivityCubit connectivityCubit,
  ) async {
    await tester.pumpApp(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: connectivityCubit),
          BlocProvider.value(value: chat),
        ],
        child: const ChatPage(),
      ),
    );
    await tester.pump();
  }

  testWidgets('offline disables the composer and the connection returning enables it', (
    tester,
  ) async {
    final cubits = await build(isOnline: false);
    await pumpChat(tester, cubits.chat, cubits.connectivity);

    expect(find.text('Sem conexão. A conversa volta quando você reconectar.'), findsOneWidget);
    expect(tester.widget<BaseTextField>(find.byType(BaseTextField)).isEnabled, isFalse);

    connectivity.add(true);
    await tester.pump();
    await tester.pump();
    expect(cubits.connectivity.state.isOnline, isTrue);

    expect(find.text('Sem conexão. A conversa volta quando você reconectar.'), findsNothing);
    expect(tester.widget<BaseTextField>(find.byType(BaseTextField)).isEnabled, isTrue);

    cubits.chat.onDraftChanged('Oi');
    await tester.pump();
    expect(
      tester.widget<BaseTextLink>(find.widgetWithText(BaseTextLink, 'Enviar')).onPressed,
      isNotNull,
    );
  });

  testWidgets('a free person sees the Plus gate instead of the composer', (tester) async {
    when(chatRepository.getStatus)
        .thenAnswer((_) async => (messagesLeft: 0, isEnabled: false, hasPlus: false));
    final cubits = await build(isOnline: true);

    await pumpChat(tester, cubits.chat, cubits.connectivity);

    expect(find.text('A conversa faz parte do Plus'), findsOneWidget);
    expect(find.text('Ligar a conversa'), findsNothing);
  });

  testWidgets('a finished reply can be saved as a learning from its action row', (tester) async {
    when(
      () => chatRepository.send(
        message: any(named: 'message'),
        history: any(named: 'history'),
        locale: any(named: 'locale'),
        mode: any(named: 'mode'),
        session: any(named: 'session'),
      ),
    ).thenAnswer(
      (_) => Stream.fromIterable([const ChatDelta('Um passo pequeno.'), const ChatDone([])]),
    );
    final cubits = await build(isOnline: true);
    await tester.runAsync(() => cubits.chat.send('Oi'));
    await pumpChat(tester, cubits.chat, cubits.connectivity);

    expect(find.text('Virar slip'), findsOneWidget);
    expect(find.text('Salvar aprendizado'), findsOneWidget);

    await tester.tap(find.text('Salvar aprendizado'));
    await tester.pumpAndSettle();

    expect(find.byType(SaveLearningSheet), findsOneWidget);
    expect(find.text('Um passo pequeno.'), findsWidgets);

    await tester.tap(find.text('Um date'));
    await tester.pump();
    await tester.tap(find.widgetWithText(BaseButton, 'Guardar'));
    await tester.pumpAndSettle();

    verify(
      () => learnedItemsRepository.add(
        target: LearnedTarget.date,
        text: 'Um passo pequeno.',
        excerpt: 'Um passo pequeno.',
      ),
    ).called(1);
    expect(find.byType(SaveLearningSheet), findsNothing);
  });
}
