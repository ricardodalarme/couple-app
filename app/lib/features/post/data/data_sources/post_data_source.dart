import 'package:flutter_bloc_starter/features/post/data/data_sources/queries/generated/GetPosts.graphql.dart';
import 'package:network/network.dart';

class PostDataSource {
  PostDataSource({required GQLClient graphlQLClient}) : _client = graphlQLClient;

  final GQLClient _client;

  Future<QueryGetPostsposts> getPosts({int? first, String? after}) async {
    final QueryResult<QueryGetPosts> response = await _client.query(
      OptionsQueryGetPosts(
        variables: VariablesQueryGetPosts(first: first, after: after),
      ),
    );

    return validateResponseData(response, getData: (data) => data?.posts);
  }
}
