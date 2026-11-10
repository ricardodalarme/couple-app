import 'package:flutter_bloc_starter/features/mood/data/data_sources/mutations/generated/ClearMoodNeed.graphql.dart';
import 'package:flutter_bloc_starter/features/mood/data/data_sources/mutations/generated/InsertMood.graphql.dart';
import 'package:flutter_bloc_starter/features/mood/data/data_sources/mutations/generated/UpdateMood.graphql.dart';
import 'package:flutter_bloc_starter/features/mood/data/data_sources/queries/generated/TodayMood.graphql.dart';
import 'package:network/network.dart';

/// A mood row with its raw server values, before the domain mapping.
typedef MoodRecord = ({String id, DateTime day, String mood, String? need, String share});

/// The server's local day, the partner's name and today's own mood, when there is one.
typedef MoodTodayRecord = ({DateTime day, String? partnerName, MoodRecord? mood});

class MoodDataSource({required final GQLClient _client}) {
  /// Reads the server local day and today's own mood in one request.
  Future<MoodTodayRecord> getTodayMood() async {
    final response = await _client.query(
      OptionsQueryTodayMood(fetchPolicy: FetchPolicy.networkOnly),
    );
    final data = validateResponseData<QueryTodayMood, QueryTodayMood>(response);
    final localDate = data.today?.localDate;
    if (localDate == null) throw const NoDataException();

    final node = data.moodsCollection.edges.firstOrNull?.node;
    final mood = node != null && node.day == localDate ? node.toRecord() : null;

    return (day: localDate, partnerName: data.today?.partnerName, mood: mood);
  }

  Future<MoodRecord> insertMood({
    required String mood,
    required String? need,
    required String share,
    required DateTime day,
  }) async {
    final response = await _client.mutate(
      OptionsMutationInsertMood(
        variables: VariablesMutationInsertMood(mood: mood, need: need, share: share, day: day),
      ),
    );
    final data = validateResponseData<MutationInsertMood, MutationInsertMood>(response);
    final record = data.insertIntoMoodsCollection?.records.firstOrNull;
    if (record == null) throw const NoDataException();

    return record.toRecord();
  }

  Future<MoodRecord> updateMood({
    required String id,
    required String mood,
    required String need,
    required String share,
    required DateTime day,
  }) async {
    final response = await _client.mutate(
      OptionsMutationUpdateMood(
        variables: VariablesMutationUpdateMood(
          id: id,
          mood: mood,
          need: need,
          share: share,
          day: day,
        ),
      ),
    );
    final data = validateResponseData<MutationUpdateMood, MutationUpdateMood>(response);
    final record = data.updateMoodsCollection.records.firstOrNull;
    if (record == null) throw const NoDataException();

    return record.toRecord();
  }

  /// Clears the need with a literal null, because a null variable would be omitted.
  Future<MoodRecord> clearNeed({
    required String id,
    required String mood,
    required String share,
    required DateTime day,
  }) async {
    final response = await _client.mutate(
      OptionsMutationClearMoodNeed(
        variables: VariablesMutationClearMoodNeed(id: id, mood: mood, share: share, day: day),
      ),
    );
    final data = validateResponseData<MutationClearMoodNeed, MutationClearMoodNeed>(response);
    final record = data.updateMoodsCollection.records.firstOrNull;
    if (record == null) throw const NoDataException();

    return record.toRecord();
  }
}

extension on QueryTodayMoodmoodsCollectionedgesnode {
  MoodRecord toRecord() => (id: id, day: day, mood: mood, need: need, share: share);
}

extension on MutationInsertMoodinsertIntoMoodsCollectionrecords {
  MoodRecord toRecord() => (id: id, day: day, mood: mood, need: need, share: share);
}

extension on MutationUpdateMoodupdateMoodsCollectionrecords {
  MoodRecord toRecord() => (id: id, day: day, mood: mood, need: need, share: share);
}

extension on MutationClearMoodNeedupdateMoodsCollectionrecords {
  MoodRecord toRecord() => (id: id, day: day, mood: mood, need: need, share: share);
}
