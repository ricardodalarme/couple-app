import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/post/data/data_sources/queries/generated/GetPosts.graphql.dart';

abstract interface class PostDataSource {
  Future<QueryGetPostsposts> getPosts({
    int? first,
    String? after,
  });
}

class PostDataSourceImpl implements PostDataSource {
  PostDataSourceImpl({
    required GQLClient graphlQLClient,
  }) : _client = graphlQLClient;

  final GQLClient _client;

  @override
  Future<QueryGetPostsposts> getPosts({
    int? first,
    String? after,
  }) async {
    final response = await _client.query(
      OptionsQueryGetPosts(
        variables: VariablesQueryGetPosts(
          first: first,
          after: after,
        ),
      ),
    );

    return validateResponseData(
      response,
      getData: (data) => data?.posts,
    );
  }
}
