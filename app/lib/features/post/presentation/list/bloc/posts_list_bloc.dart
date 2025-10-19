import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/post/data/models/post.dart';
import 'package:quickstart_flutter_bloc/features/post/data/repositories/post_repository.dart';

part 'posts_list_event.dart';
part 'posts_list_state.dart';

class PostsListBloc extends Bloc<PostsListEvent, PostsListState> {
  PostsListBloc({required PostRepository postRepository})
    : _postRepository = postRepository,
      super(const PostsListState()) {
    on<PostsListFetched>(_onPostsListFetched);
  }

  final PostRepository _postRepository;

  Future<void> _onPostsListFetched(PostsListFetched event, Emitter<PostsListState> emit) async {
    emit(state.copyWith(posts: const Loading()));

    try {
      final List<Post> posts = await _postRepository.getPosts();
      emit(state.copyWith(posts: Success(posts)));
    } catch (exception) {
      emit(state.copyWith(posts: Failure.fromObject(exception)));
    }
  }
}
