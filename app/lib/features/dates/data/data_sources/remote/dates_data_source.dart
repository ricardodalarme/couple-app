import 'package:flutter_bloc_starter/features/dates/data/data_sources/remote/mutations/generated/AddGiftIdea.graphql.dart';
import 'package:flutter_bloc_starter/features/dates/data/data_sources/remote/mutations/generated/AddImportantDate.graphql.dart';
import 'package:flutter_bloc_starter/features/dates/data/data_sources/remote/mutations/generated/DeleteGiftIdea.graphql.dart';
import 'package:flutter_bloc_starter/features/dates/data/data_sources/remote/mutations/generated/DeleteImportantDate.graphql.dart';
import 'package:flutter_bloc_starter/features/dates/data/data_sources/remote/mutations/generated/SetGiftIdeaStatus.graphql.dart';
import 'package:flutter_bloc_starter/features/dates/data/data_sources/remote/queries/generated/GiftIdeas.graphql.dart';
import 'package:flutter_bloc_starter/features/dates/data/data_sources/remote/queries/generated/Holidays.graphql.dart';
import 'package:flutter_bloc_starter/features/dates/data/data_sources/remote/queries/generated/ImportantDates.graphql.dart';
import 'package:network/network.dart';

class DatesDataSource({required final GQLClient _client}) {
  Future<List<QueryImportantDatesimportantDatesCollectionedgesnode>> getDates() async {
    final response = await _client.query(
      OptionsQueryImportantDates(fetchPolicy: FetchPolicy.networkOnly),
    );
    final edges = validateResponseData(
      response,
      getData: (data) => data.importantDatesCollection.edges,
    );

    return [for (final edge in edges) edge.node];
  }

  Future<void> addDate({
    required String id,
    required String title,
    required String kind,
    required int month,
    required int day,
    required bool yearly,
    required List<int> remindDays,
    required String origin,
    int? year,
    String? holidayKey,
    String? coupleId,
  }) async {
    final response = await _client.mutate(
      OptionsMutationAddImportantDate(
        variables: VariablesMutationAddImportantDate(
          id: id,
          title: title,
          kind: kind,
          month: month,
          day: day,
          year: year,
          yearly: yearly,
          remindDays: remindDays,
          origin: origin,
          holidayKey: holidayKey,
          coupleId: coupleId,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<void> deleteDate(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeleteImportantDate(variables: VariablesMutationDeleteImportantDate(id: id)),
    );

    validateResponse(response);
  }

  Future<List<QueryGiftIdeasgiftIdeasCollectionedgesnode>> getGiftIdeas({
    required String authorId,
  }) async {
    final response = await _client.query(
      OptionsQueryGiftIdeas(
        variables: VariablesQueryGiftIdeas(authorId: authorId),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    final edges = validateResponseData(response, getData: (data) => data.giftIdeasCollection.edges);

    return [for (final edge in edges) edge.node];
  }

  Future<void> addGiftIdea({required String id, required String title}) async {
    final response = await _client.mutate(
      OptionsMutationAddGiftIdea(
        variables: VariablesMutationAddGiftIdea(id: id, title: title),
      ),
    );

    validateResponse(response);
  }

  Future<void> setGiftIdeaStatus({required String id, required String status}) async {
    final response = await _client.mutate(
      OptionsMutationSetGiftIdeaStatus(
        variables: VariablesMutationSetGiftIdeaStatus(id: id, status: status),
      ),
    );

    validateResponse(response);
  }

  Future<void> deleteGiftIdea(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeleteGiftIdea(variables: VariablesMutationDeleteGiftIdea(id: id)),
    );

    validateResponse(response);
  }

  Future<List<QueryHolidayscontentItemsCollectionedgesnode>> getHolidays(String locale) async {
    final response = await _client.query(
      OptionsQueryHolidays(variables: VariablesQueryHolidays(locale: locale)),
    );
    final edges = validateResponseData(
      response,
      getData: (data) => data.contentItemsCollection.edges,
    );

    return [for (final edge in edges) edge.node];
  }
}
