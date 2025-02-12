part of 'post_bloc.dart';

final class PostState with EquatableMixin {
  const PostState({this.posts = const Loading()});

  final Resource<List<PostModel>> posts;

  PostState copyWith({Resource<List<PostModel>>? posts}) {
    return PostState(posts: posts ?? this.posts);
  }

  @override
  List<Object?> get props => [posts];
}
