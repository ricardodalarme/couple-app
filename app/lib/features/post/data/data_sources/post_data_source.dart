import 'package:flutter_bloc_starter/features/post/data/data_sources/queries/generated/GetPosts.graphql.dart';
import 'package:network/network.dart';

class PostDataSource({required GQLClient graphlQLClient}) {
  final GQLClient _client = graphlQLClient;

  Future<QueryGetPostspostsCollection> getPosts({int? first, String? after}) async {
    final response = await _client.query(
      OptionsQueryGetPosts(
        variables: VariablesQueryGetPosts(first: first, after: after),
      ),
    );

    return validateResponseData(response, getData: (data) => data.postsCollection);
  }
}
