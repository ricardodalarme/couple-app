import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/chat_repository.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/settings/chat_settings_page.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/settings/cubit/chat_settings_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockChatRepository() extends Mock implements ChatRepository;

void main() {
  late ChatRepository repository;

  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  setUp(() {
    repository = _MockChatRepository();
    when(repository.getStatus)
        .thenAnswer((_) async => (messagesLeft: 4, limit: 20, isEnabled: true, hasPlus: true));
    when(repository.enable).thenAnswer((_) async {});
    when(repository.disable).thenAnswer((_) async {});
  });

  Future<ChatSettingsCubit> pumpSettings(WidgetTester tester) async {
    final cubit = ChatSettingsCubit(chatRepository: repository);
    addTearDown(cubit.close);
    await cubit.load();
    await tester.pumpApp(BlocProvider.value(value: cubit, child: const ChatSettingsPage()));
    await tester.pump();
    return cubit;
  }

  testWidgets('shows the switch, the usage and what is sent', (tester) async {
    await pumpSettings(tester);

    expect(find.text('Conversar com a mascote'), findsOneWidget);
    expect(find.text('Restam 4 de 20 mensagens hoje'), findsOneWidget);
    expect(find.text('O que é enviado'), findsOneWidget);
    expect(
      find.text(
        'Ao desligar, o passo de consentimento volta. A próxima mensagem só é enviada depois que você ligar de novo.',
      ),
      findsOneWidget,
    );
    expect(tester.widget<BaseSwitch>(find.byType(BaseSwitch)).value, isTrue);
  });

  testWidgets('turning the switch off revokes consent immediately', (tester) async {
    final cubit = await pumpSettings(tester);

    await tester.tap(find.byType(BaseSwitch));
    await tester.pump();

    expect(cubit.state.isEnabled, isFalse);
    verify(repository.disable).called(1);
  });

  testWidgets('a free plan sees its plan and no message count', (tester) async {
    when(repository.getStatus)
        .thenAnswer((_) async => (messagesLeft: 0, limit: 0, isEnabled: false, hasPlus: false));
    await pumpSettings(tester);

    expect(find.text('Plano gratuito'), findsOneWidget);
    expect(
      find.text('A conversa faz parte do Plus. O plano gratuito não tem mensagens.'),
      findsOneWidget,
    );
  });

  testWidgets('a failed load offers a retry', (tester) async {
    when(repository.getStatus).thenThrow(Exception('offline'));
    final cubit = ChatSettingsCubit(chatRepository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const ChatSettingsPage()));
    await tester.pump();

    expect(find.text('Não deu para carregar'), findsOneWidget);
    expect(find.text('Tentar novamente'), findsOneWidget);
  });
}
