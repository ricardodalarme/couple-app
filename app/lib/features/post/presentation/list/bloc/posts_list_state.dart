part of 'posts_list_bloc.dart';

final class PostsListState with EquatableMixin {
  const PostsListState({this.posts = const Loading()});

  final Resource<List<Post>> posts;

  PostsListState copyWith({Resource<List<Post>>? posts}) {
    return PostsListState(posts: posts ?? this.posts);
  }

  @override
  List<Object?> get props => [posts];
}
