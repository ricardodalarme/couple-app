import 'package:core/core.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/mutations/generated/Login.graphql.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/models/token.dart';

final class LoginResponseToTokenMapper implements Mapper<MutationLoginlogin, Token> {
  @override
  Token map(MutationLoginlogin input) {
    return Token(expires: input.accessToken.expires, token: input.accessToken.token);
  }
}
