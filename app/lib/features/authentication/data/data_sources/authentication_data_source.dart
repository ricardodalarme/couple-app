import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/_shared/data/data_sources/generated/schema.graphql.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/mutations/generated/CreateUser.graphql.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/mutations/generated/Login.graphql.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/mutations/generated/ResetPassword.graphql.dart';

class AuthenticationDataSource {
  const AuthenticationDataSource({required GQLClient graphlQLClient}) : _client = graphlQLClient;

  final GQLClient _client;

  Future<MutationLoginlogin> logInWithUsernameAndPassword({
    required String username,
    required String password,
  }) async {
    final input = InputLoginInput(username: username, password: password);
    final QueryResult<MutationLogin> response = await _client.mutate(
      OptionsMutationLogin(variables: VariablesMutationLogin(credentials: input)),
    );

    return validateResponseData(response, getData: (data) => data?.login);
  }

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

  Future<void> resetPassword({required String email}) async {
    final input = InputResetPasswordInput(email: email);
    final QueryResult<MutationResetPassword> response = await _client.mutate(
      OptionsMutationResetPassword(variables: VariablesMutationResetPassword(input: input)),
    );

    return validateResponse(response);
  }
}
