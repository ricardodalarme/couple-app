import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/post/data/data_sources/queries/generated/GetPosts.graphql.dart';

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
