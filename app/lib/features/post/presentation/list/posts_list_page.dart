import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/_shared/presentation/widgets/empty_indicator.dart';
import 'package:flutter_bloc_starter/features/_shared/presentation/widgets/error_indicator.dart';
import 'package:flutter_bloc_starter/features/_shared/presentation/widgets/skeletonizer_resource_widget.dart';
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
      title: l10n.title,
      actions: const [NotificationsBellButton()],
      body: SkeletonizerResourceWidget<List<Post>>(
        posts,
        fakeValue: _skeletonPosts,
        successBuilder: (posts) => _PostsListWidget(posts: posts),
        failureBuilder: (exception) => ErrorIndicator(
          title: context.l10n.common.genericError,
          buttonText: context.l10n.common.retry,
          message: l10n.textFailure,
          onButtonPressed: context.read<PostsListCubit>().getPosts,
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
      padding: const EdgeInsets.all(Spacings.large),
      itemCount: posts.length,
      emptyBuilder: (_) => EmptyIndicator(title: l10n.emptyIndicator.title),
      itemBuilder: (_, index) => PostCard(key: ValueKey(posts[index].id), post: posts[index]),
      separator: const Gap(Spacings.medium),
    );
  }
}
