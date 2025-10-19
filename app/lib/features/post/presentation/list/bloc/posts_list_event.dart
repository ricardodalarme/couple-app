part of 'posts_list_bloc.dart';

sealed class PostsListEvent {
  const PostsListEvent();
}

final class PostsListFetched extends PostsListEvent {
  const PostsListFetched();
}
