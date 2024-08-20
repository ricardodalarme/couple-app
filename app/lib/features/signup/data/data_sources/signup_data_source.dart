import 'package:common_data/common_data.dart';
import 'package:schemas/generated/schema.graphql.dart';
import 'package:schemas/mutations/generated/CreateUser.graphql.dart';

abstract class SignupDataSource {
  Future<void> signup({
    required String username,
    required String email,
    required String password,
    String? firstName,
    String? lastName,
  });
}

class SignupDataSourceImpl implements SignupDataSource {
  const SignupDataSourceImpl({
    required GQLClient graphlQLClient,
  }) : _client = graphlQLClient;

  final GQLClient _client;

  @override
  Future<void> signup({
    required String username,
    required String email,
    required String password,
    String? firstName,
    String? lastName,
  }) async {
    final input = InputCreateUserInput(
      username: username,
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
    final response = await _client.mutate(
      OptionsMutationCreateUser(
        variables: VariablesMutationCreateUser(input: input),
      ),
    );

    if (response.hasException) {
      throw response.exception!;
    }
  }
}
