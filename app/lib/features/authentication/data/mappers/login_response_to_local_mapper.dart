import 'package:core/core.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/models/token_local.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/mutations/generated/Login.graphql.dart';

final class LoginResponseToLocalMapper implements Mapper<MutationLoginlogin, TokenLocal> {
  @override
  TokenLocal map(MutationLoginlogin input) {
    return TokenLocal(expires: input.accessToken.expires, token: input.accessToken.token);
  }
}
