import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/post/domain/repositories/post_repository.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/bloc/post_bloc.dart';

class MockPostRepository extends Mock implements PostRepository {}

void main() {
  group('PostBloc', () {
    late PostRepository postRepository;
    late PostBloc postBloc;

    setUp(() {
      postRepository = MockPostRepository();
      postBloc = PostBloc(postRepository: postRepository);
    });

    tearDown(() {
      postBloc.close();
    });

    test('initial state is correct', () {
      expect(
        postBloc.state,
        const PostState(
          posts: Loading(),
        ),
      );
    });
  });
}
