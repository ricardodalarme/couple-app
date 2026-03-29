import 'package:flutter_bloc_starter/features/authentication/data/data_sources/mutations/generated/Login.graphql.dart';
import 'package:flutter_bloc_starter/features/authentication/data/models/token.dart';

extension LoginResponseMapper on MutationLoginlogin {
  Token toModel() {
    return Token(expires: accessToken.expires, token: accessToken.token);
  }
}
