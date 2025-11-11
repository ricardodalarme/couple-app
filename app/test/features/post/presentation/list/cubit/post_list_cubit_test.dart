import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/post/data/repositories/post_repository.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/list/cubit/posts_list_cubit.dart';

class MockPostRepository extends Mock implements PostRepository {}

void main() {
  group('PostsListCubit', () {
    late PostRepository postRepository;
    late PostsListCubit postsListCubit;

    setUp(() {
      postRepository = MockPostRepository();
      postsListCubit = PostsListCubit(postRepository: postRepository);
    });

    tearDown(() {
      postsListCubit.close();
    });

    test('initial state is correct', () {
      expect(postsListCubit.state, const PostsListState(posts: Loading()));
    });
  });
}
