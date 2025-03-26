import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/_shared/data/data_sources/generated/schema.graphql.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/mutations/generated/Login.graphql.dart';

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
}
