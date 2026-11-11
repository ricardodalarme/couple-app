import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/presentation/avatar/cubit/history_avatar_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/avatar/widgets/avatar_picker_body.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// "Seu avatar" (X-144) — lets each person choose their own avatar representation.
@RoutePage()
class const HistoryAvatarPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<HistoryAvatarCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.history;
    final state = context.select((HistoryAvatarCubit cubit) => cubit.state);
    final cubit = context.read<HistoryAvatarCubit>();

    return BaseView(
      body: BlocListener<HistoryAvatarCubit, HistoryAvatarState>(
        listenWhen: (previous, current) => previous.saveAction != current.saveAction,
        listener: (context, state) {
          if (state.saveAction is Success) {
            Navigator.of(context).maybePop(true);
            return;
          }
          if (state.saveAction case Failure(:final exception)) {
            BaseToast.show(context, l10n.errors.selectOrFallback(exception.l10nKey));
          }
        },
        child: BaseFlowContent(
          heading: l10n.avatarHeadline,
          highlightedWord: l10n.avatarHighlight,
          content: SkeletonizerResourceWidget<HistoryOverview>(
            state.overview,
            fakeValue: HistoryOverview.fake(),
            successBuilder: (overview) => AvatarPickerBody(overview: overview),
            failureBuilder: (_) => BaseEmptyState(
              title: l10n.errorTitle,
              text: l10n.errorText,
              actionText: context.l10n.common.retry,
              onAction: cubit.load,
            ),
          ),
          primaryAction: BaseButton(
            text: l10n.avatarContinue,
            isLoading: state.saveAction.isLoading,
            onPressed: cubit.save,
          ),
        ),
      ),
    );
  }
}
