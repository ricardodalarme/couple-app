import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/_shared/data/data_sources/generated/schema.graphql.dart';
import 'package:quickstart_flutter_bloc/features/change_password/data/data_sources/mutations/generated/ChangePassword.graphql.dart';

abstract interface class ChangePasswordDataSource {
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}

class ChangePasswordDataSourceImpl implements ChangePasswordDataSource {
  const ChangePasswordDataSourceImpl({
    required GQLClient graphlQLClient,
  }) : _client = graphlQLClient;

  final GQLClient _client;

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final input = InputChangePasswordInput(
      oldPassword: currentPassword,
      newPassword: newPassword,
    );
    final response = await _client.mutate(
      OptionsMutationChangePassword(
        variables: VariablesMutationChangePassword(input: input),
      ),
    );

    return validateResponse(response);
  }
}
