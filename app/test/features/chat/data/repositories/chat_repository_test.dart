import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/chat_data_source.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/chat_models.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/chat_repository.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockChatDataSource() extends Mock implements ChatDataSource;

class _MockProfileRepository() extends Mock implements ProfileRepository;

class _MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

class _MockSlipRepository() extends Mock implements SlipRepository;

class _MockPlusRepository() extends Mock implements PlusRepository;

void main() {
  late ChatDataSource dataSource;
  late ProfileRepository profileRepository;
  late AuthenticationRepository authenticationRepository;
  late SlipRepository slipRepository;
  late PlusRepository plusRepository;
  late ChatRepository repository;

  setUpAll(() => registerFallbackValue(ChatMode.free));

  setUp(() {
    dataSource = _MockChatDataSource();
    profileRepository = _MockProfileRepository();
    authenticationRepository = _MockAuthenticationRepository();
    slipRepository = _MockSlipRepository();
    plusRepository = _MockPlusRepository();
    repository = ChatRepository(
      dataSource: dataSource,
      profileRepository: profileRepository,
      authenticationRepository: authenticationRepository,
      slipRepository: slipRepository,
      plusRepository: plusRepository,
    );
    when(() => profileRepository.getMySettings()).thenAnswer(
      (_) async => AccountSettings(theme: AppThemeVariant.rose, onboardedAt: DateTime(2026)),
    );
    when(() => dataSource.getStatus(any()))
        .thenAnswer((_) async => (messagesLeft: 3, isEnabled: true));
    when(plusRepository.getPlus).thenAnswer((_) async => const PlusState(hasPlus: true));
    when(() => authenticationRepository.getAccessToken()).thenReturn('token');
  });

  test('the status joins the server count with the person plan', () async {
    final status = await repository.getStatus();

    expect(status.messagesLeft, 3);
    expect(status.isEnabled, isTrue);
    expect(status.hasPlus, isTrue);
  });

  test('crisis and excluded turns never reach the model', () async {
    List<({ChatRole role, String text})>? sentHistory;
    when(
      () => dataSource.send(
        message: any(named: 'message'),
        history: any(named: 'history'),
        locale: any(named: 'locale'),
        mode: any(named: 'mode'),
        session: any(named: 'session'),
        accessToken: any(named: 'accessToken'),
      ),
    ).thenAnswer((invocation) {
      sentHistory = invocation.namedArguments[#history] as List<({ChatRole role, String text})>;

      return const Stream.empty();
    });

    await repository
        .send(
          message: 'Oi',
          history: const [
            ChatMessage(id: 'u1', role: ChatRole.user, text: 'Uma mensagem normal'),
            ChatMessage(id: 'm1', role: ChatRole.mascot, text: 'Uma resposta'),
            ChatMessage(
              id: 'u2',
              role: ChatRole.user,
              text: 'quero morrer',
              excludeFromHistory: true,
            ),
            ChatMessage(id: 'm2', role: ChatRole.mascot, text: '', isCrisis: true),
          ],
          locale: 'pt-BR',
          mode: ChatMode.free,
          session: 'session-1',
        )
        .drain<void>();

    expect(sentHistory!.map((turn) => turn.text), ['Uma mensagem normal', 'Uma resposta']);
  });
}
