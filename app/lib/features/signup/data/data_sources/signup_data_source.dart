import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/_shared/data/data_sources/generated/schema.graphql.dart';
import 'package:quickstart_flutter_bloc/features/signup/data/data_sources/mutations/generated/CreateUser.graphql.dart';

class SignupDataSource {
  const SignupDataSource({required GQLClient graphlQLClient}) : _client = graphlQLClient;

  final GQLClient _client;

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
    final QueryResult<MutationCreateUser> response = await _client.mutate(
      OptionsMutationCreateUser(variables: VariablesMutationCreateUser(input: input)),
    );

    return validateResponse(response);
  }
}
