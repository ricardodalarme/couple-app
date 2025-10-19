import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/_shared/data/data_sources/generated/schema.graphql.dart';
import 'package:quickstart_flutter_bloc/features/account/data/data_sources/mutations/generated/ChangePassword.graphql.dart';
import 'package:quickstart_flutter_bloc/features/account/data/data_sources/mutations/generated/UpdateUser.graphql.dart';

class AccountDataSource {
  const AccountDataSource({required GQLClient graphlQLClient}) : _client = graphlQLClient;

  final GQLClient _client;

  Future<void> updateUser({
    required String? email,
    required String? firstName,
    required String? lastName,
  }) async {
    final input = InputUpdateUserInput(email: email, firstName: firstName, lastName: lastName);
    final QueryResult<MutationUpdateUser> response = await _client.mutate(
      OptionsMutationUpdateUser(variables: VariablesMutationUpdateUser(input: input)),
    );

    return validateResponse(response);
  }

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
