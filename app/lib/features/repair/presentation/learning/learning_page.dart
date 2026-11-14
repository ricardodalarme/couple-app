import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/guided_session.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/learning/cubit/learning_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Private learnings: write one after a repair and delete any time.
@RoutePage()
class const LearningPage({@QueryParam('sessionId') final String? sessionId, super.key})
    extends StatelessWidget
    implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<LearningCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.repair.learning;
    final learnings = context.select((LearningCubit cubit) => cubit.state.learnings);
    final kind = context.select((LearningCubit cubit) => cubit.state.kind);
    final note = context.select((LearningCubit cubit) => cubit.state.note);
    final isSaving = context.select((LearningCubit cubit) => cubit.state.saveAction.isLoading);
    final cubit = context.read<LearningCubit>();

    return BaseView(
      body: BlocListener<LearningCubit, LearningState>(
        listenWhen: (previous, current) => previous.saveAction != current.saveAction,
        listener: (context, state) {
          final action = state.saveAction;
          if (action is Failure) {
            BaseToast.show(context, l10n.errors.selectOrFallback(action.exception.l10nKey));
          }
        },
        child: BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Semantics(
                header: true,
                child: AppHighlightedText(
                  text: l10n.title,
                  highlight: l10n.titleHighlight,
                  style: context.text.display,
                ),
              ),
              const SizedBox(height: AppSpace.s8),
              Text(
                l10n.subtitle,
                style: context.text.body.copyWith(color: context.colors.textSecondary),
              ),
              const SizedBox(height: AppSpace.s20),
              Wrap(
                spacing: AppSpace.s8,
                runSpacing: AppSpace.s8,
                children: [
                  for (final key in RepairLearningKind.values)
                    BaseChoiceChip(
                      label: l10n.kinds.selectOrFallback(key.name),
                      isSelected: kind == key,
                      onTap: () => cubit.onKindChosen(key),
                    ),
                ],
              ),
              const SizedBox(height: AppSpace.s12),
              BaseTextArea(
                text: note.value,
                hint: l10n.hint,
                maxLength: learningMaxLength,
                errorText: l10n.noteErrors.selectOrNull(note.errorName),
                onChanged: cubit.onNoteChanged,
              ),
              const SizedBox(height: AppSpace.s12),
              const SizedBox(height: AppSpace.s24),
              BaseSectionHeader(title: l10n.listTitle),
              const SizedBox(height: AppSpace.s8),
              SkeletonizerResourceWidget<List<Learning>>(
                learnings,
                fakeValue: [Learning.fake()],
                successBuilder: (items) => items.isEmpty
                    ? BaseEmptyState(title: l10n.emptyTitle, text: l10n.emptyText)
                    : BaseListGroup(
                        children: [
                          for (final item in items)
                            BaseListTile(
                              title: item.note,
                              subtitle: l10n.kinds.selectOrFallback(item.kind.name),
                              trailing: BaseTextLink(
                                text: l10n.delete,
                                onPressed: () => cubit.delete(item.id),
                              ),
                            ),
                        ],
                      ),
                failureBuilder: (_) => BaseEmptyState(
                  title: l10n.errorTitle,
                  text: l10n.errorText,
                  actionText: context.l10n.common.retry,
                  onAction: cubit.load,
                ),
              ),
            ],
          ),
          footer: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BaseButton(
                text: l10n.save,
                isLoading: isSaving,
                onPressed: () => cubit.save(sessionId: sessionId),
              ),
              const SizedBox(height: AppSpace.s10),
              BaseButton(
                text: l10n.done,
                variant: .secondary,
                onPressed: () => context.router.maybePop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
