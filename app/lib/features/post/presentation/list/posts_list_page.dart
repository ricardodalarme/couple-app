import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/_shared/presentation/widgets/error_indicator.dart';
import 'package:quickstart_flutter_bloc/features/post/data/models/post.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/list/cubit/posts_list_cubit.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/list/widgets/post_card.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

@RoutePage()
class PostsListPage extends StatelessWidget implements AutoRouteWrapper {
  const PostsListPage({super.key});

  static final List<Post> _skeletonPosts = List.filled(6, Post.fake);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<PostsListCubit>()..getPosts(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final TranslationsPostListEn l10n = context.l10n.post.list;

    return BaseView(
      title: l10n.title,
      body: BlocBuilder<PostsListCubit, PostsListState>(
        builder: (context, state) => switch (state.posts) {
          Initial() => const SizedBox.shrink(),
          Success(:final List<Post> value) => _PostsListWidget(posts: value),
          Loading() => Skeletonizer(child: _PostsListWidget(posts: _skeletonPosts)),
          Failure() => ErrorIndicator(
            title: context.l10n.common.genericError,
            buttonText: context.l10n.common.retry,
            message: l10n.textFailure,
            onButtonPressed: context.read<PostsListCubit>().getPosts,
          ),
        },
      ),
    );
  }
}

class _PostsListWidget extends StatelessWidget {
  const _PostsListWidget({required this.posts});

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return BaseListView(
      onRefresh: context.read<PostsListCubit>().getPosts,
      padding: const EdgeInsets.all(Spacings.large),
      itemCount: posts.length,
      itemBuilder: (_, index) => PostCard(key: ValueKey(posts[index].id), post: posts[index]),
      separator: const Gap(Spacings.medium),
    );
  }
}
