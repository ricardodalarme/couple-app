import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/presentation/story_dates/cubit/story_dates_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/story_dates/widgets/story_dates_list.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// "Datas da nossa história" (X-142) — optional canonical relationship dates
/// (`met`, `dating`, `engaged`, `married`) that feed the counter.
@RoutePage()
class const StoryDatesPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<StoryDatesCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.history;
    final overviewResource = context.select((StoryDatesCubit cubit) => cubit.state.overview);
    final cubit = context.read<StoryDatesCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.storyDatesTitle),
      body: BlocListener<StoryDatesCubit, StoryDatesState>(
        listenWhen: (previous, current) => previous.saveAction != current.saveAction,
        listener: (context, state) {
          if (state.saveAction case Failure(:final exception)) {
            BaseToast.show(context, l10n.errors.selectOrFallback(exception.l10nKey));
          }
        },
        child: BaseStackedContent(
          body: SkeletonizerResourceWidget<HistoryOverview>(
            overviewResource,
            fakeValue: HistoryOverview.fake(),
            successBuilder: (overview) => StoryDatesList(overview: overview),
            failureBuilder: (_) => BaseEmptyState(
              title: l10n.errorTitle,
              text: l10n.errorText,
              actionText: context.l10n.common.retry,
              onAction: cubit.load,
            ),
          ),
        ),
      ),
    );
  }
}
