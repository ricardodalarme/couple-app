import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/post/data/repositories/post_repository.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/list/bloc/posts_list_bloc.dart';

class MockPostRepository extends Mock implements PostRepository {}

void main() {
  group('PostsListBloc', () {
    late PostRepository postRepository;
    late PostsListBloc postsListBloc;

    setUp(() {
      postRepository = MockPostRepository();
      postsListBloc = PostsListBloc(postRepository: postRepository);
    });

    tearDown(() {
      postsListBloc.close();
    });

    test('initial state is correct', () {
      expect(postsListBloc.state, const PostsListState(posts: Loading()));
    });
  });
}
