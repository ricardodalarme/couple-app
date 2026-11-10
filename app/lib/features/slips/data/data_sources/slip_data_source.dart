import 'package:flutter_bloc_starter/features/slips/data/data_sources/mutations/generated/DeleteSlip.graphql.dart';
import 'package:flutter_bloc_starter/features/slips/data/data_sources/mutations/generated/SaveSlip.graphql.dart';
import 'package:flutter_bloc_starter/features/slips/data/data_sources/mutations/generated/SetSlipCategory.graphql.dart';
import 'package:network/network.dart';

class SlipDataSource({required final GQLClient _client}) {
  /// Upserts a slip; the same [id] can be sent again safely.
  Future<void> saveSlip({
    required String id,
    required String body,
    required DateTime createdAt,
  }) async {
    final response = await _client.mutate(
      OptionsMutationSaveSlip(
        variables: VariablesMutationSaveSlip(id: id, body: body, createdAt: createdAt),
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
