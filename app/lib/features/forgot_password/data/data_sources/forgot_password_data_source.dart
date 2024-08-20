import 'package:common_data/common_data.dart';
import 'package:schemas/generated/schema.graphql.dart';
import 'package:schemas/mutations/generated/ResetPassword.graphql.dart';

abstract class ForgotPasswordDataSource {
  Future<void> forgotPassword({
    required String email,
  });
}

class ForgotPasswordDataSourceImpl implements ForgotPasswordDataSource {
  const ForgotPasswordDataSourceImpl({
    required GQLClient graphlQLClient,
  }) : _client = graphlQLClient;

  final GQLClient _client;

  @override
  Future<void> forgotPassword({
    required String email,
  }) async {
    final input = InputResetPasswordInput(
      email: email,
    );
    final response = await _client.mutate(
      OptionsMutationResetPassword(
        variables: VariablesMutationResetPassword(input: input),
      ),
    );

    if (response.hasException) {
      throw response.exception!;
    }
  }
}
