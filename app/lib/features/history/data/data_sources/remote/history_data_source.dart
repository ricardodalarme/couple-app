import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/history/data/data_sources/remote/mutations/generated/DeleteHistoryDate.graphql.dart';
import 'package:flutter_bloc_starter/features/history/data/data_sources/remote/mutations/generated/DeleteHistoryMemory.graphql.dart';
import 'package:flutter_bloc_starter/features/history/data/data_sources/remote/mutations/generated/DeleteStoryEvent.graphql.dart';
import 'package:flutter_bloc_starter/features/history/data/data_sources/remote/mutations/generated/InsertHistoryDate.graphql.dart';
import 'package:flutter_bloc_starter/features/history/data/data_sources/remote/mutations/generated/InsertHistoryMemory.graphql.dart';
import 'package:flutter_bloc_starter/features/history/data/data_sources/remote/mutations/generated/InsertStoryEvent.graphql.dart';
import 'package:flutter_bloc_starter/features/history/data/data_sources/remote/mutations/generated/UpdateAvatarKind.graphql.dart';
import 'package:flutter_bloc_starter/features/history/data/data_sources/remote/mutations/generated/UpdateHistoryDate.graphql.dart';
import 'package:flutter_bloc_starter/features/history/data/data_sources/remote/mutations/generated/UpdateHistoryMemory.graphql.dart';
import 'package:flutter_bloc_starter/features/history/data/data_sources/remote/mutations/generated/UpdateHistoryPhase.graphql.dart';
import 'package:flutter_bloc_starter/features/history/data/data_sources/remote/mutations/generated/UpdateHistoryTogetherSince.graphql.dart';
import 'package:flutter_bloc_starter/features/history/data/data_sources/remote/mutations/generated/UpdateStoryEvent.graphql.dart';
import 'package:flutter_bloc_starter/features/history/data/data_sources/remote/queries/generated/HistoryOverview.graphql.dart';
import 'package:network/network.dart';

class HistoryDataSource({required final GQLClient _client}) {
  Future<QueryHistoryOverview> getOverview({required int year}) async {
    final response = await _client.query(
      OptionsQueryHistoryOverview(
        variables: VariablesQueryHistoryOverview(year: year),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    return validateResponseData(response, getData: (data) => data);
  }

  Future<void> insertStoryEvent({
    required String id,
    required EnumStoryEventKind kind,
    required DateTime happenedOn,
    required EnumDatePrecision datePrecision,
    String? title,
    String? coupleId,
  }) async {
    final response = await _client.mutate(
      OptionsMutationInsertStoryEvent(
        variables: VariablesMutationInsertStoryEvent(
          id: id,
          coupleId: coupleId,
          kind: kind,
          title: title,
          happenedOn: happenedOn,
          datePrecision: datePrecision,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<void> updateStoryEvent({
    required String id,
    required EnumStoryEventKind kind,
    required DateTime happenedOn,
    required EnumDatePrecision datePrecision,
    String? title,
    String? coupleId,
  }) async {
    final response = await _client.mutate(
      OptionsMutationUpdateStoryEvent(
        variables: VariablesMutationUpdateStoryEvent(
          id: id,
          coupleId: coupleId,
          kind: kind,
          title: title,
          happenedOn: happenedOn,
          datePrecision: datePrecision,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<void> deleteStoryEvent(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeleteStoryEvent(variables: VariablesMutationDeleteStoryEvent(id: id)),
    );

    validateResponse(response);
  }

  Future<void> insertMemory({
    required String id,
    required String title,
    required DateTime happenedOn,
    required EnumDatePrecision datePrecision,
    required EnumMemoryOrigin origin,
    String? body,
    String? place,
    String? coupleId,
  }) async {
    final response = await _client.mutate(
      OptionsMutationInsertHistoryMemory(
        variables: VariablesMutationInsertHistoryMemory(
          id: id,
          coupleId: coupleId,
          title: title,
          body: body,
          happenedOn: happenedOn,
          datePrecision: datePrecision,
          place: place,
          origin: origin,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<void> updateMemory({
    required String id,
    required String title,
    required DateTime happenedOn,
    required EnumDatePrecision datePrecision,
    required EnumMemoryOrigin origin,
    String? body,
    String? place,
    String? coupleId,
  }) async {
    final response = await _client.mutate(
      OptionsMutationUpdateHistoryMemory(
        variables: VariablesMutationUpdateHistoryMemory(
          id: id,
          coupleId: coupleId,
          title: title,
          body: body,
          happenedOn: happenedOn,
          datePrecision: datePrecision,
          place: place,
          origin: origin,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<void> deleteMemory(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeleteHistoryMemory(variables: VariablesMutationDeleteHistoryMemory(id: id)),
    );

    validateResponse(response);
  }

  Future<void> insertImportantDate({
    required String id,
    required String title,
    required EnumImportantDateKind kind,
    required int month,
    required int day,
    required bool yearly,
    int? year,
    String? coupleId,
  }) async {
    final response = await _client.mutate(
      OptionsMutationInsertHistoryDate(
        variables: VariablesMutationInsertHistoryDate(
          id: id,
          coupleId: coupleId,
          title: title,
          kind: kind,
          month: month,
          day: day,
          year: year,
          yearly: yearly,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<void> updateImportantDate({
    required String id,
    required String title,
    required EnumImportantDateKind kind,
    required int month,
    required int day,
    required bool yearly,
    int? year,
    String? coupleId,
  }) async {
    final response = await _client.mutate(
      OptionsMutationUpdateHistoryDate(
        variables: VariablesMutationUpdateHistoryDate(
          id: id,
          coupleId: coupleId,
          title: title,
          kind: kind,
          month: month,
          day: day,
          year: year,
          yearly: yearly,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<void> deleteImportantDate(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeleteHistoryDate(variables: VariablesMutationDeleteHistoryDate(id: id)),
    );

    validateResponse(response);
  }

  Future<void> updateAvatarKind({
    required String profileId,
    required EnumAvatarKind avatarKind,
  }) async {
    final response = await _client.mutate(
      OptionsMutationUpdateAvatarKind(
        variables: VariablesMutationUpdateAvatarKind(profileId: profileId, avatarKind: avatarKind),
      ),
    );

    validateResponse(response);
  }

  Future<void> updateTogetherSince({required String profileId, DateTime? togetherSince}) async {
    final response = await _client.mutate(
      OptionsMutationUpdateHistoryTogetherSince(
        variables: VariablesMutationUpdateHistoryTogetherSince(
          profileId: profileId,
          togetherSince: togetherSince,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<void> updatePhase({
    required String profileId,
    required EnumRelationshipPhase phase,
  }) async {
    final response = await _client.mutate(
      OptionsMutationUpdateHistoryPhase(
        variables: VariablesMutationUpdateHistoryPhase(profileId: profileId, phase: phase),
      ),
    );

    validateResponse(response);
  }
}
