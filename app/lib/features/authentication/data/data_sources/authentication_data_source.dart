import 'package:common/common.dart';
import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/_shared/data/data_sources/generated/schema.graphql.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/mutations/generated/Login.graphql.dart';

abstract interface class AuthenticationDataSource {
  Future<MutationLoginlogin> logInWithUsernameAndPassword({
    required String username,
    required String password,
  });
}

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  const AuthenticationDataSourceImpl({
    required GQLClient graphlQLClient,
  }) : _client = graphlQLClient;

  final GQLClient _client;

  @override
  Future<MutationLoginlogin> logInWithUsernameAndPassword({
    required String username,
    required String password,
  }) async {
    final input = InputLoginInput(
      username: username,
      password: password,
    );
    final response = await _client.mutate(
      OptionsMutationLogin(
        variables: VariablesMutationLogin(
          credentials: input,
        ),
      ),
    );

    final data = response.parsedData?.login;

    if (response.hasException) {
      throw response.exception!;
    }
    if (data == null) {
      throw const NoDataException();
    }

    return data;
  }
}
