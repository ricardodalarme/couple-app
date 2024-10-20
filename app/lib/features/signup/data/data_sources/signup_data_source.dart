import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/_shared/data/data_sources/generated/schema.graphql.dart';
import 'package:quickstart_flutter_bloc/features/signup/data/data_sources/mutations/generated/CreateUser.graphql.dart';

abstract interface class SignupDataSource {
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

    return validateResponse(response);
  }
}
