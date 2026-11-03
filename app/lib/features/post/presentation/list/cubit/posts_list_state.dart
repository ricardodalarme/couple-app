part of 'posts_list_cubit.dart';

final class const PostsListState({final Resource<List<Post>> posts = const Loading()})
    with Equatable {
  PostsListState copyWith({Resource<List<Post>>? posts}) {
    return PostsListState(posts: posts ?? this.posts);
  }

  @override
  List<Object?> get props => [posts];
}
