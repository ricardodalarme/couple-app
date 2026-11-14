import 'package:flutter_bloc_starter/features/chat/data/data_sources/remote/chat_data_source.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/remote/queries/generated/ChatStatus.graphql.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class _MockGQLClient() extends Mock implements GQLClient;

class _MockRestClient() extends Mock implements RestClient;

void main() {
  late GQLClient client;
  late ChatDataSource dataSource;

  setUpAll(() {
    registerFallbackValue(
      OptionsQueryChatStatus(variables: VariablesQueryChatStatus(profileId: 'x')),
    );
  });

  setUp(() {
    client = _MockGQLClient();
    dataSource = ChatDataSource(
      client: client,
      restClient: _MockRestClient(),
      functionUrl: 'https://example.test/chat',
      apiKey: 'key',
    );
  });

  void answerWith(Map<String, dynamic> data) {
    when(() => client.query<QueryChatStatus>(any())).thenAnswer(
      (invocation) async => QueryResult<QueryChatStatus>(
        options: invocation.positionalArguments.first as QueryOptions<QueryChatStatus>,
        source: QueryResultSource.network,
        data: {...data, '__typename': 'Query'},
      ),
    );
  }

  Map<String, dynamic> config(String value) => {'value': value, '__typename': 'AppConfig'};

  test(
    'reads the per-day limits from the two config rows and the switch from the settings',
    () async {
      answerWith({
        'chatMessagesLeft': 7,
        'plusLimit': config('30'),
        'freeLimit': config('5'),
        'profileSettingsByPk': {
          'profileId': 'p1',
          'chatEnabled': true,
          '__typename': 'ProfileSettings',
        },
      });

      final status = await dataSource.getStatus('p1');

      expect(status.messagesLeft, 7);
      expect(status.isEnabled, isTrue);
      expect(status.plusLimit, 30);
      expect(status.freeLimit, 5);
    },
  );

  test('a missing config row or an unreadable value reads as 0', () async {
    answerWith({
      'chatMessagesLeft': null,
      'plusLimit': null,
      'freeLimit': config('many'),
      'profileSettingsByPk': null,
    });

    final status = await dataSource.getStatus('p1');

    expect(status.messagesLeft, 0);
    expect(status.plusLimit, 0);
    expect(status.freeLimit, 0);
  });

  test('a missing settings row reads as off', () async {
    answerWith({
      'chatMessagesLeft': 1,
      'plusLimit': config('30'),
      'freeLimit': config('5'),
      'profileSettingsByPk': null,
    });

    expect((await dataSource.getStatus('p1')).isEnabled, isFalse);
  });
}
