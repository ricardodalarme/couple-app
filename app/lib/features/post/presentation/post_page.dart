import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/post/data/models/post.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/bloc/post_bloc.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/widgets/post_card.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

@RoutePage()
class PostPage extends StatelessWidget implements AutoRouteWrapper {
  const PostPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<PostBloc>()..add(const PostFetched()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: context.l10n.post.title,
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) => switch (state.posts) {
          Initial() => const SizedBox.shrink(),
          Success(:final List<Post> value) => _PostSuccess(posts: value),
          Loading() => const LoadingIndicator(),
          Failure() => ErrorIndicator(
            title: context.l10n.common.genericError,
            buttonText: context.l10n.common.retry,
            message: context.l10n.post.textFailure,
            onButtonPressed: () => context.read<PostBloc>().add(const PostFetched()),
          ),
        },
      ),
    );
  }
}

class _PostSuccess extends StatelessWidget {
  const _PostSuccess({required this.posts});

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return PullToRefresh(
      onRefresh: () => context.read<PostBloc>().add(const PostFetched()),
      child: ListView.builder(
        padding: const EdgeInsets.all(Spacings.large),
        itemCount: posts.length,
        itemBuilder: (context, index) =>
            PostCard(key: ValueKey(posts[index].id), post: posts[index]),
      ),
    );
  }
}
