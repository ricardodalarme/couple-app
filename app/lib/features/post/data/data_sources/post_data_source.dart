import 'package:common/common.dart';
import 'package:common_data/common_data.dart';
import 'package:schemas/queries/generated/GetPosts.graphql.dart';

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
    final data = response.parsedData?.posts;

    if (data == null) {
      throw const NoDataException();
    }
    return data;
  }
}
