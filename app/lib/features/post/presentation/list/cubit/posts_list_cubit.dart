import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/post/data/models/post.dart';
import 'package:flutter_bloc_starter/features/post/data/repositories/post_repository.dart';

part 'posts_list_state.dart';

class PostsListCubit({required final PostRepository _postRepository})
    extends Cubit<PostsListState> {
  this : super(const PostsListState());

  Future<void> getPosts() async {
    emit(state.copyWith(posts: const Loading()));

    try {
      final posts = await _postRepository.getPosts();
      emit(state.copyWith(posts: Success(posts)));
    } catch (exception) {
      emit(state.copyWith(posts: Failure.fromObject(exception)));
    }
  }
}
