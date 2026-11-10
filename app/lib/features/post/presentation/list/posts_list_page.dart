import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/badge/cubit/notifications_badge_cubit.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/badge/widgets/notifications_bell_button.dart';
import 'package:flutter_bloc_starter/features/post/data/models/post.dart';
import 'package:flutter_bloc_starter/features/post/presentation/list/cubit/posts_list_cubit.dart';
import 'package:flutter_bloc_starter/features/post/presentation/list/widgets/post_card.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const PostsListPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  static final List<Post> _skeletonPosts = List.filled(6, Post.fake);

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppInjector.instance.get<PostsListCubit>()..getPosts()),
        BlocProvider(
          create: (_) => AppInjector.instance.get<NotificationsBadgeCubit>()..getHasUnread(),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.post.list;
    final posts = context.select((PostsListCubit cubit) => cubit.state.posts);

    return BaseView(
      appBar: BaseAppBar(title: l10n.title, trailing: const NotificationsBellButton()),
      body: SkeletonizerResourceWidget<List<Post>>(
        posts,
        fakeValue: _skeletonPosts,
        successBuilder: (posts) => _PostsListWidget(posts: posts),
        failureBuilder: (_) => Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpace.screenMargin),
            child: BaseEmptyState(
              title: context.l10n.common.genericError,
              text: l10n.textFailure,
              actionText: context.l10n.common.retry,
              onAction: context.read<PostsListCubit>().getPosts,
              face: FaceKind.sad,
            ),
          ),
        ),
      ),
    );
  }
}

class const _PostsListWidget({required final List<Post> posts}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.post.list;

    return BaseListView(
      onRefresh: context.read<PostsListCubit>().getPosts,
      padding: const EdgeInsets.fromLTRB(
        AppSpace.screenMargin,
        AppSpace.s8,
        AppSpace.screenMargin,
        AppSpace.s8,
      ),
      itemCount: posts.length,
      emptyBuilder: (_) =>
          BaseEmptyState(title: l10n.emptyIndicator.title, text: l10n.emptyIndicator.text),
      itemBuilder: (_, index) => PostCard(key: ValueKey(posts[index].id), post: posts[index]),
      separator: const SizedBox(height: AppSpace.s12),
    );
  }
}
