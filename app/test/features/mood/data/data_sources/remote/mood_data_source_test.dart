import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/mood/data/data_sources/remote/mood_data_source.dart';
import 'package:flutter_bloc_starter/features/mood/data/data_sources/remote/mutations/generated/UpdateMood.graphql.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class _MockGQLClient() extends Mock implements GQLClient;

void main() {
  late GQLClient client;
  late MoodDataSource dataSource;

  setUpAll(() {
    registerFallbackValue(
      OptionsMutationUpdateMood(
        variables: VariablesMutationUpdateMood(
          id: 'x',
          mood: EnumMood.happy,
          share: EnumMoodShare.none,
          day: DateTime(2026),
        ),
      ),
    );
  });

  setUp(() {
    client = _MockGQLClient();
    dataSource = MoodDataSource(client: client);
    when(() => client.mutate<MutationUpdateMood>(any())).thenAnswer(
      (invocation) async => QueryResult<MutationUpdateMood>(
        options: invocation.positionalArguments.first as MutationOptions<MutationUpdateMood>,
        source: QueryResultSource.network,
        data: {
          'updateMoodsCollection': {
            'affectedCount': 1,
            'records': [
              {
                'id': 'm1',
                'day': '2026-11-11',
                'mood': 'happy',
                'need': null,
                'share': 'none',
                '__typename': 'Moods',
              },
            ],
            '__typename': 'MoodsUpdateResponse',
          },
          '__typename': 'Mutation',
        },
      ),
    );
  });

  MutationOptions<MutationUpdateMood> sent() =>
      verify(() => client.mutate<MutationUpdateMood>(captureAny())).captured.single
          as MutationOptions<MutationUpdateMood>;

  test('clearing the need sends it as null in the update', () async {
    await dataSource.updateMood(
      id: 'm1',
      mood: EnumMood.happy,
      need: null,
      share: EnumMoodShare.none,
      day: DateTime(2026, 11, 11),
    );

    final variables = sent().variables;
    expect(variables.containsKey('need'), isTrue);
    expect(variables['need'], isNull);
  });

  test('the update sends the need and the server day', () async {
    await dataSource.updateMood(
      id: 'm1',
      mood: EnumMood.happy,
      need: EnumMoodNeed.hug,
      share: EnumMoodShare.mood_need,
      day: DateTime(2026, 11, 11),
    );

    final variables = sent().variables;
    expect(variables['need'], 'hug');
    expect(variables['share'], 'mood_need');
    expect(variables['day'], '2026-11-11');
  });
}
