import 'package:auto_route/auto_route.dart';
import 'package:clock/clock.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/capsules/data/models/capsule.dart';
import 'package:flutter_bloc_starter/features/capsules/presentation/capsules/cubit/capsules_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Messages to the future that stay closed until their day, for one person or both.
@RoutePage()
class const CapsulesPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<CapsulesCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.capsules;
    final body = context.select((CapsulesCubit cubit) => cubit.state.body);
    final opensOn = context.select((CapsulesCubit cubit) => cubit.state.opensOn);
    final isShared = context.select((CapsulesCubit cubit) => cubit.state.isShared);
    final isSaving = context.select((CapsulesCubit cubit) => cubit.state.saveAction.isLoading);
    final cubit = context.read<CapsulesCubit>();
    final today = clock.now();
    final canSave = context.select((CapsulesCubit cubit) => cubit.state.canSave(clock.now()));

    return BaseView(
      body: BlocListener<CapsulesCubit, CapsulesState>(
        listenWhen: (previous, current) =>
            previous.saveAction != current.saveAction ||
            previous.deleteAction != current.deleteAction,
        listener: (context, state) {
          final action = state.saveAction;
          if (action is Failure) {
            BaseToast.show(context, l10n.errors.selectOrFallback(action.exception.l10nKey));
          } else if (action is Success) {
            BaseToast.show(context, l10n.saved);
          }

          final deleteAction = state.deleteAction;
          if (deleteAction is Failure) {
            BaseToast.show(
              context,
              l10n.deleteErrors.selectOrFallback(deleteAction.exception.l10nKey),
            );
          }
        },
        child: BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Semantics(header: true, child: Text(l10n.title, style: context.text.titleXl)),
              const SizedBox(height: AppSpace.s8),
              Text(
                l10n.text,
                style: context.text.body.copyWith(color: context.colors.textSecondary),
              ),
              const SizedBox(height: AppSpace.s16),
              BaseTextArea(
                text: body,
                hint: l10n.bodyHint,
                maxLength: capsuleBodyMaxLength,
                onChanged: cubit.onBodyChanged,
              ),
              const SizedBox(height: AppSpace.s12),
              BaseDateField(
                label: l10n.dateLabel,
                hint: l10n.dateHint,
                value: opensOn,
                minimum: capsuleEarliest(today),
                maximum: capsuleLatest(today),
                formatter: (value) => l10n.dateFormat(
                  day: value.day,
                  month: l10n.months[value.month - 1],
                  year: value.year,
                ),
                onChanged: cubit.onOpensOnChanged,
              ),
              const SizedBox(height: AppSpace.s12),
              BaseListTile(
                title: l10n.sharedLabel,
                subtitle: l10n.sharedText,
                control: BaseSwitch(
                  value: isShared,
                  semanticLabel: l10n.sharedLabel,
                  onChanged: cubit.onSharedChanged,
                ),
              ),
              const SizedBox(height: AppSpace.sectionGap),
              const _CapsuleList(),
            ],
          ),
          footer: BaseButton(
            text: l10n.save,
            isEnabled: canSave,
            isLoading: isSaving,
            onPressed: cubit.save,
          ),
        ),
      ),
    );
  }
}

class const _CapsuleList() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.capsules;
    final capsules = context.select((CapsulesCubit cubit) => cubit.state.capsules);
    final cubit = context.read<CapsulesCubit>();

    String format(DateTime value) =>
        l10n.dateFormat(day: value.day, month: l10n.months[value.month - 1], year: value.year);

    Future<void> confirmDelete(Capsule capsule) async {
      final confirmed = await BaseConfirmSheet.show(
        context: context,
        title: l10n.deleteTitle,
        text: l10n.deleteText,
        confirmText: l10n.deleteConfirm,
        isDestructive: true,
      );
      if (confirmed) await cubit.delete(capsule);
    }

    return SkeletonizerResourceWidget<List<Capsule>>(
      capsules,
      fakeValue: [Capsule.fake()],
      successBuilder: (list) => list.isEmpty
          ? BaseEmptyState(title: l10n.emptyTitle, text: l10n.emptyText)
          : BaseListGroup(
              children: [
                for (final capsule in list)
                  BaseListTile(
                    icon: capsule.isOpen ? AppIcons.check : AppIcons.lock,
                    title: capsule.isOpen
                        ? capsule.body ?? ''
                        : l10n.closedUntil(date: format(capsule.opensOn)),
                    subtitle: switch ((capsule.isMine, capsule.isShared)) {
                      (true, true) => l10n.ownerSharedBy,
                      (true, false) => l10n.ownerPrivate,
                      _ => l10n.fromPartner,
                    },
                    trailing: capsule.isMine
                        ? BaseTextLink(text: l10n.delete, onPressed: () => confirmDelete(capsule))
                        : null,
                  ),
              ],
            ),
      failureBuilder: (_) => BaseEmptyState(
        title: l10n.errorTitle,
        text: l10n.errorText,
        actionText: context.l10n.common.retry,
        onAction: cubit.load,
      ),
    );
  }
}
