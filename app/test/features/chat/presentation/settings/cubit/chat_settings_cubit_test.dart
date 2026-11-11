import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/chat_repository.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/settings/cubit/chat_settings_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockChatRepository() extends Mock implements ChatRepository;

void main() {
  late ChatRepository repository;

  setUp(() {
    repository = _MockChatRepository();
    when(repository.getStatus)
        .thenAnswer((_) async => (messagesLeft: 4, limit: 20, isEnabled: true, hasPlus: true));
    when(repository.enable).thenAnswer((_) async {});
    when(repository.disable).thenAnswer((_) async {});
  });

  ChatSettingsCubit build() => ChatSettingsCubit(chatRepository: repository);

  test('load reads the switch and today usage', () async {
    final cubit = build();

    await cubit.load();

    expect(cubit.state.status, const Success<void>(null));
    expect(cubit.state.isEnabled, isTrue);
    expect(cubit.state.messagesLeft, 4);
    expect(cubit.state.limit, 20);
    expect(cubit.state.hasPlus, isTrue);
  });

  test('turning it off calls the revoke and moves the switch at once', () async {
    final cubit = build();
    await cubit.load();

    await cubit.setEnabled(enabled: false);

    verify(repository.disable).called(1);
    expect(cubit.state.isEnabled, isFalse);
    expect(cubit.state.toggleAction, const Initial());
  });

  test('turning it back on gives consent again', () async {
    when(repository.getStatus)
        .thenAnswer((_) async => (messagesLeft: 4, limit: 20, isEnabled: false, hasPlus: true));
    final cubit = build();
    await cubit.load();

    await cubit.setEnabled(enabled: true);

    verify(repository.enable).called(1);
    expect(cubit.state.isEnabled, isTrue);
  });

  test('a failed turn-off puts the switch back and reports the failure', () async {
    when(repository.disable).thenThrow(Exception('offline'));
    final cubit = build();
    await cubit.load();

    await cubit.setEnabled(enabled: false);

    expect(cubit.state.isEnabled, isTrue);
    expect(cubit.state.toggleAction, const Initial());
  });

  test('a failed load offers the retry state', () async {
    when(repository.getStatus).thenThrow(Exception('offline'));
    final cubit = build();

    await cubit.load();

    expect(cubit.state.status, isA<Failure>());
  });
}
