import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/_shared/data/data_sources/generated/schema.graphql.dart';
import 'package:quickstart_flutter_bloc/features/change_password/data/data_sources/mutations/generated/ChangePassword.graphql.dart';

class ChangePasswordDataSource {
  const ChangePasswordDataSource({required GQLClient graphlQLClient}) : _client = graphlQLClient;

  final GQLClient _client;

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final input = InputChangePasswordInput(oldPassword: currentPassword, newPassword: newPassword);
    final QueryResult<MutationChangePassword> response = await _client.mutate(
      OptionsMutationChangePassword(variables: VariablesMutationChangePassword(input: input)),
    );

    return validateResponse(response);
  }
}
