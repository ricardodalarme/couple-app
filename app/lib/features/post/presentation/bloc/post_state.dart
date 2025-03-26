part of 'post_bloc.dart';

final class PostState with EquatableMixin {
  const PostState({this.posts = const Loading()});

  final Resource<List<Post>> posts;

  PostState copyWith({Resource<List<Post>>? posts}) {
    return PostState(posts: posts ?? this.posts);
  }

  @override
  List<Object?> get props => [posts];
}
