import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/together/data/models/ritual.dart';
import 'package:flutter_bloc_starter/features/together/presentation/ritual_edit/cubit/ritual_edit_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const RitualEditPage({@QueryParam('id') final String? id, super.key})
    extends StatelessWidget
    implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<RitualEditCubit>()..start(id),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.rituals;
    final state = context.select((RitualEditCubit cubit) => cubit.state);
    final cubit = context.read<RitualEditCubit>();
    final ritual = state.ritual;

    return BaseView(
      appBar: BaseAppBar(onClose: () => context.router.maybePop()),
      body: BlocListener<RitualEditCubit, RitualEditState>(
        listenWhen: (previous, current) => previous.saveAction != current.saveAction,
        listener: (context, state) {
          final action = state.saveAction;
          if (action is Success) context.router.maybePop();
          if (action is Failure) {
            BaseToast.show(context, l10n.errors.selectOrFallback(action.exception.l10nKey));
          }
        },
        child: state.load is Failure
            ? BaseEmptyState(title: l10n.errorTitle, text: l10n.errorText)
            : BaseStackedContent(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Semantics(
                      header: true,
                      child: Text(
                        state.isNew ? l10n.createTitle : l10n.editTitle,
                        style: context.text.titleXl,
                      ),
                    ),
                    const SizedBox(height: AppSpace.s16),
                    BaseTextField(
                      key: ValueKey('title-${ritual.id}'),
                      text: ritual.title,
                      label: l10n.nameLabel,
                      hint: l10n.nameHint,
                      onChanged: cubit.onTitleChanged,
                    ),
                    const SizedBox(height: AppSpace.s16),
                    Text(l10n.cadenceLabel, style: context.text.label),
                    const SizedBox(height: AppSpace.s8),
                    Wrap(
                      spacing: AppSpace.s8,
                      runSpacing: AppSpace.s8,
                      children: [
                        for (final cadence in ritualCadences)
                          BaseChoiceChip(
                            label: l10n.cadences.selectOrFallback(cadence),
                            isSelected: ritual.cadence == cadence,
                            onTap: () => cubit.onCadenceChosen(cadence),
                          ),
                      ],
                    ),
                    if (ritual.needsWeekday) ...[
                      const SizedBox(height: AppSpace.s16),
                      Text(l10n.weekdayLabel, style: context.text.label),
                      const SizedBox(height: AppSpace.s8),
                      Wrap(
                        spacing: AppSpace.s8,
                        runSpacing: AppSpace.s8,
                        children: [
                          for (var day = 0; day < l10n.weekdays.length; day++)
                            BaseChoiceChip(
                              label: l10n.weekdays[day],
                              isSelected: ritual.weekday == day,
                              onTap: () => cubit.onWeekdayChosen(day),
                            ),
                        ],
                      ),
                    ],
                    const SizedBox(height: AppSpace.s16),
                    BaseSelect<int>(
                      label: l10n.hourLabel,
                      options: [
                        for (var hour = 0; hour < 24; hour++)
                          BaseSelectOption(
                            value: hour,
                            label: l10n.hourFormat(hour: hour.toString().padLeft(2, '0')),
                          ),
                      ],
                      value: ritual.hour,
                      onChanged: cubit.onHourChosen,
                    ),
                    const SizedBox(height: AppSpace.s16),
                    BaseListGroup(
                      children: [
                        BaseListTile(
                          title: l10n.reminderTitle,
                          subtitle: l10n.reminderText,
                          control: BaseSwitch(
                            value: ritual.hasReminder,
                            semanticLabel: l10n.reminderTitle,
                            onChanged: (value) => cubit.onReminderChanged(value: value),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                footer: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BaseButton(
                      text: l10n.save,
                      isEnabled: state.canSave,
                      isLoading: state.saveAction.isLoading,
                      onPressed: cubit.save,
                    ),
                    if (!state.isNew) ...[
                      const SizedBox(height: AppSpace.s10),
                      BaseButton(
                        text: l10n.archive,
                        variant: .secondary,
                        onPressed: () => _confirmArchive(context),
                      ),
                    ],
                  ],
                ),
              ),
      ),
    );
  }

  Future<void> _confirmArchive(BuildContext context) async {
    final l10n = context.l10n.rituals;
    final cubit = context.read<RitualEditCubit>();
    final confirmed = await BaseConfirmSheet.show(
      context: context,
      title: l10n.archiveTitle,
      text: l10n.archiveText,
      confirmText: l10n.archive,
      isDestructive: true,
    );
    if (confirmed) await cubit.archive();
  }
}
