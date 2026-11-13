import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/slips/data/data_sources/remote/mutations/generated/ArchiveSlip.graphql.dart';
import 'package:flutter_bloc_starter/features/slips/data/data_sources/remote/mutations/generated/DeleteSlip.graphql.dart';
import 'package:flutter_bloc_starter/features/slips/data/data_sources/remote/mutations/generated/SaveSlip.graphql.dart';
import 'package:flutter_bloc_starter/features/slips/data/data_sources/remote/mutations/generated/SendSignal.graphql.dart';
import 'package:flutter_bloc_starter/features/slips/data/data_sources/remote/mutations/generated/SetSlipCategory.graphql.dart';
import 'package:flutter_bloc_starter/features/slips/data/data_sources/remote/mutations/generated/SetSlipInJar.graphql.dart';
import 'package:flutter_bloc_starter/features/slips/data/data_sources/remote/mutations/generated/SetSlipWorkArea.graphql.dart';
import 'package:flutter_bloc_starter/features/slips/data/data_sources/remote/queries/generated/MySlips.graphql.dart';
import 'package:flutter_bloc_starter/features/slips/data/data_sources/remote/queries/generated/SlipDetail.graphql.dart';
import 'package:network/network.dart';

class SlipDataSource({required final GQLClient _client}) {
  /// Upserts a slip; the same [id] can be sent again safely.
  Future<void> saveSlip({
    required String id,
    required String body,
    required DateTime createdAt,
    String kind = 'quick',
    String? feeling,
    String? planNote,
    bool? forCard,
  }) async {
    final response = await _client.mutate(
      OptionsMutationSaveSlip(
        variables: VariablesMutationSaveSlip(
          id: id,
          body: body,
          createdAt: createdAt,
          kind: kind,
          feeling: feeling,
          planNote: planNote,
          forCard: forCard,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<void> setWorkArea({required String id, required String workArea}) async {
    final response = await _client.mutate(
      OptionsMutationSetSlipWorkArea(
        variables: VariablesMutationSetSlipWorkArea(id: id, workArea: workArea),
      ),
    );

    validateResponse(response);
  }

  /// Sends a gentle signal to the partner; fails with `NOT_PAIRED` when there is none.
  Future<void> sendSignal({required String kind, String? value, String? body}) async {
    final response = await _client.mutate(
      OptionsMutationSendSignal(
        variables: VariablesMutationSendSignal(kind: kind, value: value, body: body),
      ),
    );

    validateResponse(response);
  }

  /// Reads one page of the person's own slips, newest first, without deleted ones.
  ///
  /// When [archived] is true it reads only the slips taken out of the timeline.
  Future<QueryMySlipsslipsCollection> getSlips({
    required int first,
    String? after,
    DateTime? since,
    bool archived = false,
  }) async {
    final response = await _client.query(
      OptionsQueryMySlips(
        fetchPolicy: FetchPolicy.networkOnly,
        variables: VariablesQueryMySlips(
          first: first,
          after: after,
          filter: InputSlipsFilter(
            deletedAt: InputDatetimeFilter($is: EnumFilterIs.NULL),
            archivedAt: InputDatetimeFilter(
              $is: archived ? EnumFilterIs.NOT_NULL : EnumFilterIs.NULL,
            ),
            createdAt: since == null || archived ? null : InputDatetimeFilter(gte: since),
          ),
        ),
      ),
    );

    return validateResponseData(response, getData: (data) => data.slipsCollection);
  }

  /// Reads one slip of the person, or null when it is gone or not theirs.
  Future<QuerySlipDetailslipsCollectionedgesnode?> getSlip(String id) async {
    final response = await _client.query(
      OptionsQuerySlipDetail(
        fetchPolicy: FetchPolicy.networkOnly,
        variables: VariablesQuerySlipDetail(id: id),
      ),
    );
    final edges = validateResponseData(response, getData: (data) => data.slipsCollection.edges);

    return edges.isEmpty ? null : edges.first.node;
  }

  Future<void> setInJar({required String id, required bool inJar}) async {
    final response = await _client.mutate(
      OptionsMutationSetSlipInJar(
        variables: VariablesMutationSetSlipInJar(id: id, inJar: inJar),
      ),
    );

    validateResponse(response);
  }

  Future<void> archiveSlip({required String id, required bool archived}) async {
    final response = await _client.mutate(
      OptionsMutationArchiveSlip(
        variables: VariablesMutationArchiveSlip(id: id, archived: archived),
      ),
    );

    validateResponse(response);
  }

  Future<void> setCategory({required String id, String? category}) async {
    final response = await _client.mutate(
      OptionsMutationSetSlipCategory(
        variables: VariablesMutationSetSlipCategory(id: id, category: category),
      ),
    );

    validateResponse(response);
  }

  Future<void> deleteSlip(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeleteSlip(variables: VariablesMutationDeleteSlip(id: id)),
    );

    validateResponse(response);
  }
}
