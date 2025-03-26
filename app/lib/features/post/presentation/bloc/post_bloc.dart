import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/post/data/models/post.dart';
import 'package:quickstart_flutter_bloc/features/post/data/repositories/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required PostRepository postRepository})
    : _postRepository = postRepository,
      super(const PostState()) {
    on<PostFetched>(_onPostFetched);
  }

  final PostRepository _postRepository;

  Future<void> _onPostFetched(PostFetched event, Emitter<PostState> emit) async {
    emit(state.copyWith(posts: const Loading()));

    try {
      final List<Post> posts = await _postRepository.getPosts();
      emit(state.copyWith(posts: Success(posts)));
    } catch (exception) {
      emit(state.copyWith(posts: Failure.fromObject(exception)));
    }
  }
}
