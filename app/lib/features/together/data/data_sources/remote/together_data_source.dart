import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/mutations/generated/AddDateIdea.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/mutations/generated/AddLogisticItem.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/mutations/generated/AddRitual.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/mutations/generated/AddSharedDate.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/mutations/generated/ArchiveRitual.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/mutations/generated/CompleteRitual.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/mutations/generated/DeleteDateIdea.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/mutations/generated/DeleteLogisticItem.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/mutations/generated/PlanDateIdea.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/mutations/generated/SetDateIdeaStatus.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/mutations/generated/SetLogisticItemAssignee.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/mutations/generated/SetLogisticItemDone.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/mutations/generated/UpdateRitual.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/queries/generated/DateIdeaSuggestions.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/queries/generated/DateIdeas.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/queries/generated/HelpContent.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/queries/generated/LogisticItems.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/queries/generated/MyCouple.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/queries/generated/Rituals.graphql.dart';
import 'package:network/network.dart';

class TogetherDataSource({required final GQLClient _client}) {
  /// The id of the couple the person is in, or null when they are on their own.
  Future<String?> getCoupleId() async {
    final response = await _client.query(
      OptionsQueryMyCouple(fetchPolicy: FetchPolicy.networkOnly),
    );

    validateResponse(response);

    return response.parsedData?.myCouple?.id;
  }

  Future<List<QueryLogisticItemslogisticItemsCollectionedgesnode>> getLogisticItems() async {
    final response = await _client.query(
      OptionsQueryLogisticItems(fetchPolicy: FetchPolicy.networkOnly),
    );
    final edges = validateResponseData(
      response,
      getData: (data) => data.logisticItemsCollection.edges,
    );

    return [for (final edge in edges) edge.node];
  }

  Future<void> addLogisticItem({
    required String id,
    required String title,
    String? assigneeId,
    String? coupleId,
  }) async {
    final response = await _client.mutate(
      OptionsMutationAddLogisticItem(
        variables: VariablesMutationAddLogisticItem(
          id: id,
          title: title,
          assigneeId: assigneeId,
          coupleId: coupleId,
        ),
      ),
    );

    validateResponse(response);
  }

  /// Marks the item done at [doneAt], or open again when it is null.
  Future<void> setLogisticItemDone({required String id, required DateTime? doneAt}) async {
    final response = await _client.mutate(
      OptionsMutationSetLogisticItemDone(
        // fromJson keeps a null in the payload; the generated constructor drops it.
        variables: VariablesMutationSetLogisticItemDone.fromJson({
          'id': id,
          'doneAt': doneAt?.toUtc().toIso8601String(),
        }),
      ),
    );

    validateResponse(response);
  }

  /// Gives the item to one person, or to both when [assigneeId] is null.
  Future<void> setLogisticItemAssignee({required String id, String? assigneeId}) async {
    final response = await _client.mutate(
      OptionsMutationSetLogisticItemAssignee(
        variables: VariablesMutationSetLogisticItemAssignee.fromJson({
          'id': id,
          'assigneeId': assigneeId,
        }),
      ),
    );

    validateResponse(response);
  }

  Future<List<QueryRitualsritualsCollectionedgesnode>> getRituals() async {
    final response = await _client.query(OptionsQueryRituals(fetchPolicy: FetchPolicy.networkOnly));
    final edges = validateResponseData(response, getData: (data) => data.ritualsCollection.edges);

    return [for (final edge in edges) edge.node];
  }

  Future<void> addRitual({
    required String id,
    required String title,
    required EnumRitualCadence cadence,
    required bool reminder,
    int? weekday,
    String? atTime,
    String? coupleId,
  }) async {
    final response = await _client.mutate(
      OptionsMutationAddRitual(
        variables: VariablesMutationAddRitual(
          id: id,
          title: title,
          cadence: cadence,
          weekday: weekday,
          atTime: atTime,
          reminder: reminder,
          coupleId: coupleId,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<void> updateRitual({
    required String id,
    required String title,
    required EnumRitualCadence cadence,
    required bool reminder,
    int? weekday,
    String? atTime,
  }) async {
    final response = await _client.mutate(
      OptionsMutationUpdateRitual(
        variables: VariablesMutationUpdateRitual(
          id: id,
          title: title,
          cadence: cadence,
          weekday: weekday,
          atTime: atTime,
          reminder: reminder,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<void> archiveRitual({required String id, required DateTime at}) async {
    final response = await _client.mutate(
      OptionsMutationArchiveRitual(
        variables: VariablesMutationArchiveRitual(id: id, archivedAt: at),
      ),
    );

    validateResponse(response);
  }

  /// Records that the ritual happened on [day]; a second record for the same day fails.
  Future<void> completeRitual({required String id, required DateTime day}) async {
    final response = await _client.mutate(
      OptionsMutationCompleteRitual(
        variables: VariablesMutationCompleteRitual(ritualId: id, doneOn: day),
      ),
    );

    validateResponse(response);
  }

  Future<List<QueryDateIdeassavedDateIdeasCollectionedgesnode>> getDateIdeas() async {
    final response = await _client.query(
      OptionsQueryDateIdeas(fetchPolicy: FetchPolicy.networkOnly),
    );
    final edges = validateResponseData(
      response,
      getData: (data) => data.savedDateIdeasCollection.edges,
    );

    return [for (final edge in edges) edge.node];
  }

  Future<List<QueryDateIdeaSuggestionscontentItemsCollectionedgesnode>> getDateIdeaSuggestions(
    String locale,
  ) async {
    final response = await _client.query(
      OptionsQueryDateIdeaSuggestions(variables: VariablesQueryDateIdeaSuggestions(locale: locale)),
    );
    final edges = validateResponseData(
      response,
      getData: (data) => data.contentItemsCollection.edges,
    );

    return [for (final edge in edges) edge.node];
  }

  Future<void> addDateIdea({
    required String id,
    required String title,
    String? slug,
    String? coupleId,
  }) async {
    final response = await _client.mutate(
      OptionsMutationAddDateIdea(
        variables: VariablesMutationAddDateIdea(
          id: id,
          title: title,
          slug: slug,
          coupleId: coupleId,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<void> planDateIdea({required String id, required DateTime day}) async {
    final response = await _client.mutate(
      OptionsMutationPlanDateIdea(
        variables: VariablesMutationPlanDateIdea(id: id, day: day),
      ),
    );

    validateResponse(response);
  }

  Future<void> setDateIdeaStatus({required String id, required EnumDateIdeaStatus status}) async {
    final response = await _client.mutate(
      OptionsMutationSetDateIdeaStatus(
        variables: VariablesMutationSetDateIdeaStatus(id: id, status: status),
      ),
    );

    validateResponse(response);
  }

  Future<void> deleteDateIdea(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeleteDateIdea(variables: VariablesMutationDeleteDateIdea(id: id)),
    );

    validateResponse(response);
  }

  /// Adds a one-off date everyone in the couple sees, reminded a day before.
  Future<void> addSharedDate({
    required String title,
    required DateTime day,
    String? coupleId,
  }) async {
    final response = await _client.mutate(
      OptionsMutationAddSharedDate(
        variables: VariablesMutationAddSharedDate(
          title: title,
          month: day.month,
          day: day.day,
          year: day.year,
          coupleId: coupleId,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<List<QueryHelpContentcontentItemsCollectionedgesnode>> getHelpContent({
    required String kind,
    required String locale,
  }) async {
    final response = await _client.query(
      OptionsQueryHelpContent(
        variables: VariablesQueryHelpContent(kind: kind, locale: locale),
      ),
    );
    final edges = validateResponseData(
      response,
      getData: (data) => data.contentItemsCollection.edges,
    );

    return [for (final edge in edges) edge.node];
  }

  Future<void> deleteLogisticItem(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeleteLogisticItem(variables: VariablesMutationDeleteLogisticItem(id: id)),
    );

    validateResponse(response);
  }
}
