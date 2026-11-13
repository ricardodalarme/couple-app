import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/presentation/milestone/cubit/milestone_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/milestone/widgets/milestone_form_card.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// "Detalhe do marco" (X-141) — view, add, edit, or delete a milestone,
/// supporting day/month/year precision as well as unknown dates.
@RoutePage()
class const MilestonePage({
  final HistoryMilestone? initialMilestone,
  final String? initialTitle,
  final MilestoneKind? initialKind,
  super.key,
}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<MilestoneCubit>()
        ..initialize(
          initialMilestone: initialMilestone,
          initialTitle: initialTitle,
          initialKind: initialKind,
        ),
      child: this,
    );
  }

  Future<void> _confirmDelete(BuildContext context, MilestoneCubit cubit) async {
    final l10n = context.l10n.history;
    final confirmed = await BaseConfirmSheet.show(
      context: context,
      title: l10n.deleteMilestoneTitle,
      text: cubit.state.isShared ? l10n.deleteMilestoneTextShared : l10n.deleteMilestoneTextPrivate,
      confirmText: l10n.deleteMilestoneConfirm,
      isDestructive: true,
    );
    if (confirmed) await cubit.delete();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.history;
    final state = context.select((MilestoneCubit cubit) => cubit.state);
    final cubit = context.read<MilestoneCubit>();

    return BaseView(
      body: BlocListener<MilestoneCubit, MilestoneState>(
        listenWhen: (previous, current) =>
            previous.saveAction != current.saveAction ||
            previous.deleteAction != current.deleteAction,
        listener: (context, state) {
          if (state.saveAction is Success || state.deleteAction is Success) {
            Navigator.of(context).maybePop(true);
            return;
          }
          final failure = switch ((state.saveAction, state.deleteAction)) {
            (Failure(:final exception), _) || (_, Failure(:final exception)) => exception,
            _ => null,
          };
          if (failure != null) {
            BaseToast.show(context, l10n.errors.selectOrFallback(failure.l10nKey));
          }
        },
        child: BaseStackedContent(
          body: state.canEdit ? const MilestoneFormCard() : _ReadOnlyMilestone(state: state),
          footer: state.canEdit
              ? state.isEditing
                    ? Row(
                        spacing: AppSpace.s10,
                        children: [
                          BaseButton.secondary(
                            text: l10n.deleteMilestone,
                            isLoading: state.deleteAction.isLoading,
                            onPressed: () => _confirmDelete(context, cubit),
                          ),
                          Expanded(
                            child: BaseButton(
                              text: l10n.saveMilestone,
                              isLoading: state.saveAction.isLoading,
                              onPressed: cubit.save,
                            ),
                          ),
                        ],
                      )
                    : BaseButton(
                        text: l10n.saveMilestone,
                        isLoading: state.saveAction.isLoading,
                        onPressed: cubit.save,
                      )
              : null,
        ),
      ),
    );
  }
}

class const _ReadOnlyMilestone({required final MilestoneState state}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.history;
    final existing = state.existing;
    if (existing == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: AppSpace.s16),
        Text(existing.title, style: context.text.titleXl),
        const SizedBox(height: AppSpace.s8),
        BaseNote(
          text: existing.authorName == null
              ? l10n.readOnlyMilestone
              : l10n.readOnlyMilestoneBy(name: existing.authorName!),
        ),
        if (existing.place case final place?) ...[
          const SizedBox(height: AppSpace.s16),
          Text(place, style: context.text.body),
        ],
        if (existing.body case final body?) ...[
          const SizedBox(height: AppSpace.s8),
          Text(body, style: context.text.body),
        ],
      ],
    );
  }
}
