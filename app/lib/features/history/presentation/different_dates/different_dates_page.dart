import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/presentation/different_dates/cubit/different_dates_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/different_dates/widgets/different_dates_options.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// "As datas diferem" (X-170) — shows each partner's start date without overwriting
/// the other's unless chosen.
@RoutePage()
class const DifferentDatesPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<DifferentDatesCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.history;
    final state = context.select((DifferentDatesCubit cubit) => cubit.state);
    final cubit = context.read<DifferentDatesCubit>();

    final partnerName = switch (state.overview) {
      Success(:final value) => value.partnerName ?? l10n.partnerFallback,
      _ => l10n.partnerFallback,
    };

    return BaseView(
      body: BlocListener<DifferentDatesCubit, DifferentDatesState>(
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
          heading: l10n.differentHeadline,
          highlightedWord: l10n.differentHighlight,
          subtitle: l10n.differentSubtitle(partner: partnerName),
          content: SkeletonizerResourceWidget<HistoryOverview>(
            state.overview,
            fakeValue: HistoryOverview.fake(),
            successBuilder: (overview) => DifferentDatesOptions(overview: overview),
            failureBuilder: (_) => BaseEmptyState(
              title: l10n.errorTitle,
              text: l10n.errorText,
              actionText: context.l10n.common.retry,
              onAction: cubit.load,
            ),
          ),
          primaryAction: BaseButton(
            text: l10n.differentContinue,
            isLoading: state.saveAction.isLoading,
            onPressed: cubit.confirm,
          ),
        ),
      ),
    );
  }
}
