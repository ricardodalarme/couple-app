import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/post/domain/models/post_model.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/bloc/post_bloc.dart';

void main() {
  const posts = [
    PostModel(
      id: '1',
      title: 'title',
      body: 'body',
    ),
  ];

  group('PostState', () {
    test('returns same object when no properties are passed', () {
      expect(const PostState().copyWith(), const PostState());
    });

    test('returns object with updated posts when posts is passed', () {
      expect(
        const PostState().copyWith(posts: const Success(posts)),
        const PostState(posts: Success(posts)),
      );
    });
  });
}
