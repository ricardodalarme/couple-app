import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/_shared/presentation/widgets/error_indicator.dart';
import 'package:quickstart_flutter_bloc/features/post/data/models/post.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/list/bloc/posts_list_bloc.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/list/widgets/post_card.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

@RoutePage()
class PostsListPage extends StatelessWidget implements AutoRouteWrapper {
  const PostsListPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<PostsListBloc>()..add(const PostsListFetched()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final TranslationsPostListEn l10n = context.l10n.post.list;

    return BaseView(
      title: l10n.title,
      body: BlocBuilder<PostsListBloc, PostsListState>(
        builder: (context, state) => switch (state.posts) {
          Initial() => const SizedBox.shrink(),
          Success(:final List<Post> value) => _PostsListWidget(posts: value),
          Loading() => const BaseLoadingIndicator(),
          Failure() => ErrorIndicator(
            title: context.l10n.common.genericError,
            buttonText: context.l10n.common.retry,
            message: l10n.textFailure,
            onButtonPressed: () => context.read<PostsListBloc>().add(const PostsListFetched()),
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
      onRefresh: () async => context.read<PostsListBloc>().add(const PostsListFetched()),
      padding: const EdgeInsets.all(Spacings.large),
      itemCount: posts.length,
      itemBuilder: (_, index) => PostCard(key: ValueKey(posts[index].id), post: posts[index]),
      separator: const Gap(Spacings.medium),
    );
  }
}
