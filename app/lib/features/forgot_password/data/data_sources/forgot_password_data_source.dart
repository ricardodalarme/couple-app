import 'package:common_data/common_data.dart';
import 'package:quickstart_flutter_bloc/features/_shared/data/data_sources/generated/schema.graphql.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/data/data_sources/mutations/generated/ResetPassword.graphql.dart';

abstract interface class ForgotPasswordDataSource {
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
