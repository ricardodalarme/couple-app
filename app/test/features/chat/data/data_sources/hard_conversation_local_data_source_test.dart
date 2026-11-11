import 'package:flutter_bloc_starter/features/chat/data/data_sources/hard_conversation_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:preferences_service/preferences_service.dart';

class _MockPreferencesService() extends Mock implements PreferencesService;

void main() {
  late PreferencesService preferences;
  late HardConversationLocalDataSource dataSource;

  setUp(() {
    preferences = _MockPreferencesService();
    dataSource = HardConversationLocalDataSource(preferencesService: preferences);
  });

  test('keeps one draft per person', () async {
    when(
      () => preferences.writeString(
        key: any(named: 'key'),
        value: any(named: 'value'),
      ),
    ).thenAnswer((_) async {});

    await dataSource.write(userId: 'u1', draft: '{}');

    verify(() => preferences.writeString(key: 'hardConversationDraft:u1', value: '{}')).called(1);
  });

  test('reads the draft under the person key', () {
    when(() => preferences.readString(key: 'hardConversationDraft:u1')).thenReturn('{"step":0}');

    expect(dataSource.read('u1'), '{"step":0}');
    expect(dataSource.read('u2'), isNull);
  });

  test('clearing removes only that person draft', () async {
    when(() => preferences.delete(key: any(named: 'key'))).thenAnswer((_) async {});

    await dataSource.clear('u1');

    verify(() => preferences.delete(key: 'hardConversationDraft:u1')).called(1);
  });
}
