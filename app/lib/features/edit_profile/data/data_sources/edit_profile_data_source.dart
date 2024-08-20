import 'package:common_data/common_data.dart';
import 'package:schemas/generated/schema.graphql.dart';
import 'package:schemas/mutations/generated/UpdateUser.graphql.dart';

abstract class EditProfileDataSource {
  Future<void> updateUser({
    required String? email,
    required String? firstName,
    required String? lastName,
  });
}

class EditProfileDataSourceImpl implements EditProfileDataSource {
  const EditProfileDataSourceImpl({
    required GQLClient graphlQLClient,
  }) : _client = graphlQLClient;

  final GQLClient _client;

  @override
  Future<void> updateUser({
    required String? email,
    required String? firstName,
    required String? lastName,
  }) async {
    final input = InputUpdateUserInput(
      email: email,
      firstName: firstName,
      lastName: lastName,
    );
    final response = await _client.mutate(
      OptionsMutationUpdateUser(
        variables: VariablesMutationUpdateUser(input: input),
      ),
    );

    if (response.hasException) {
      throw response.exception!;
    }
  }
}
