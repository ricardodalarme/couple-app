import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/presentation/history/widgets/history_date_formatter.dart';
import 'package:flutter_bloc_starter/features/history/presentation/variations/cubit/counter_variations_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/variations/widgets/counter_variation_card.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// "Como o contador aparece" (X-143) — shows the 5 relationship-kind counter variants.
@RoutePage()
class const CounterVariationsPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<CounterVariationsCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.history;
    final state = context.select((CounterVariationsCubit cubit) => cubit.state);
    final cubit = context.read<CounterVariationsCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.variationsTitle),
      body: BlocListener<CounterVariationsCubit, CounterVariationsState>(
        listenWhen: (previous, current) => previous.saveAction != current.saveAction,
        listener: (context, state) {
          if (state.saveAction case Failure(:final exception)) {
            BaseToast.show(context, l10n.errors.selectOrFallback(exception.l10nKey));
          }
        },
        child: BaseStackedContent(
          body: SkeletonizerResourceWidget<HistoryOverview>(
            state.overview,
            fakeValue: HistoryOverview.fake(),
            successBuilder: (overview) {
              final reunionDays = overview.isOngoing
                  ? overview.daysUntilReunion(DateTime.now())
                  : null;
              final partnerInitials = overview.partnerInitials;
              final duration = HistoryDateFormatter.formatDurationHeadline(
                l10n,
                overview.numbers,
                inline: true,
              );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    duration,
                    textAlign: TextAlign.center,
                    style: context.text.titleXl.copyWith(color: context.colors.textPrimary),
                  ),
                  const SizedBox(height: AppSpace.s8),
                  BaseNote(text: l10n.variationsPreviewNote),
                  const SizedBox(height: AppSpace.s16),
                  CounterVariationCard(
                    selfInitials: overview.selfInitials,
                    partnerInitials: partnerInitials,
                    label: l10n.variationDating,
                    isSelected:
                        state.selectedPhase == RelationshipPhase.dating ||
                        state.selectedPhase == RelationshipPhase.livingTogether,
                    onTap: () => cubit.selectPhase(RelationshipPhase.dating),
                  ),
                  const SizedBox(height: AppSpace.s12),
                  CounterVariationCard(
                    selfInitials: overview.selfInitials,
                    partnerInitials: partnerInitials,
                    label: l10n.variationEngaged,
                    isSelected: state.selectedPhase == RelationshipPhase.engaged,
                    onTap: () => cubit.selectPhase(RelationshipPhase.engaged),
                  ),
                  const SizedBox(height: AppSpace.s12),
                  CounterVariationCard(
                    selfInitials: overview.selfInitials,
                    partnerInitials: partnerInitials,
                    label: l10n.variationMarried,
                    isSelected:
                        state.selectedPhase == RelationshipPhase.married ||
                        state.selectedPhase == RelationshipPhase.withKids,
                    onTap: () => cubit.selectPhase(RelationshipPhase.married),
                  ),
                  const SizedBox(height: AppSpace.s12),
                  CounterVariationCard(
                    selfInitials: overview.selfInitials,
                    label: l10n.variationBeginning,
                    isSelected:
                        state.selectedPhase == RelationshipPhase.beginning ||
                        state.selectedPhase == RelationshipPhase.restarting,
                    onTap: () => cubit.selectPhase(RelationshipPhase.beginning),
                  ),
                  const SizedBox(height: AppSpace.s12),
                  CounterVariationCard(
                    selfInitials: overview.selfInitials,
                    partnerInitials: partnerInitials,
                    label: reunionDays != null
                        ? l10n.reunionCountdown(days: reunionDays)
                        : l10n.variationLongDistance,
                    isSelected: state.selectedPhase == RelationshipPhase.longDistance,
                    onTap: () => cubit.selectPhase(RelationshipPhase.longDistance),
                  ),
                ],
              );
            },
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
