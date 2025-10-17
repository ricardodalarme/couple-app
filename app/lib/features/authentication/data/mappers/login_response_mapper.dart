import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/mutations/generated/Login.graphql.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/models/token.dart';

extension LoginResponseMapper on MutationLoginlogin {
  Token toModel() {
    return Token(expires: accessToken.expires, token: accessToken.token);
  }
}
