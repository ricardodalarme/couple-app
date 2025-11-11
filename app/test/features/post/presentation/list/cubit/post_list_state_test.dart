import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/post/data/models/post.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/list/cubit/posts_list_cubit.dart';

void main() {
  const posts = [Post(id: '1', title: 'title', body: 'body')];

  group('PostState', () {
    test('returns same object when no properties are passed', () {
      expect(const PostsListState().copyWith(), const PostsListState());
    });

    test('returns object with updated posts when posts is passed', () {
      expect(
        const PostsListState().copyWith(posts: const Success(posts)),
        const PostsListState(posts: Success(posts)),
      );
    });
  });
}
