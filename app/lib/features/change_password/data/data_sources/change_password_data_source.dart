import 'package:common_data/common_data.dart';
import 'package:schemas/generated/schema.graphql.dart';
import 'package:schemas/mutations/generated/ChangePassword.graphql.dart';

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

    if (response.hasException) {
      throw response.exception!;
    }
  }
}
