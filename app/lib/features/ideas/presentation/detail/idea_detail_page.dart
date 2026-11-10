import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/ideas/data/models/idea.dart';
import 'package:flutter_bloc_starter/features/ideas/presentation/detail/cubit/idea_detail_cubit.dart';
import 'package:flutter_bloc_starter/features/ideas/presentation/detail/widgets/idea_content.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const IdeaDetailPage({@QueryParam('slug') final String? slug, super.key})
    extends StatelessWidget
    implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<IdeaDetailCubit>()..load(slug),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.ideaDetail;
    final ideas = context.select((IdeaDetailCubit cubit) => cubit.state.ideas);

    return BaseView(
      body: BlocListener<IdeaDetailCubit, IdeaDetailState>(
        listenWhen: (previous, current) => previous.reminderAction != current.reminderAction,
        listener: _onReminderChanged,
        child: SkeletonizerResourceWidget<List<Idea>>(
          ideas,
          fakeValue: const [Idea.fake()],
          successBuilder: (list) => list.isEmpty
              ? BaseEmptyState(title: l10n.emptyTitle, text: l10n.emptyText)
              : const IdeaContent(),
          failureBuilder: (_) => BaseEmptyState(
            title: l10n.errorTitle,
            text: l10n.errorText,
            actionText: context.l10n.common.retry,
            onAction: () => context.read<IdeaDetailCubit>().load(slug),
          ),
        ),
      ),
    );
  }

  Future<void> _onReminderChanged(BuildContext context, IdeaDetailState state) async {
    final l10n = context.l10n.ideaDetail;
    switch (state.reminderAction) {
      case Success<ReminderChoice>():
        final canNotify = await context.read<IdeaDetailCubit>().canNotify();
        if (context.mounted) {
          BaseToast.show(context, canNotify ? l10n.reminderSet : l10n.reminderSetNotificationsOff);
        }
      case Failure():
        BaseToast.show(context, l10n.reminderError);
      default:
        break;
    }
  }
}
