import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/learned/cubit/learned_items_cubit.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/learned/widgets/learned_item_card.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/learned/widgets/learned_item_edit_sheet.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// What the person chose to keep from conversations; only they see it.
@RoutePage()
class const LearnedItemsPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<LearnedItemsCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.learned;
    final state = context.select((LearnedItemsCubit cubit) => cubit.state);
    final cubit = context.read<LearnedItemsCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.title),
      body: BlocListener<LearnedItemsCubit, LearnedItemsState>(
        listenWhen: (previous, current) => previous.action != current.action,
        listener: (context, state) {
          final action = state.action;
          if (action is Failure) {
            BaseToast.show(context, l10n.errors.selectOrFallback(action.exception.l10nKey));
          } else if (action is Success) {
            BaseToast.show(context, l10n.updated);
          }
        },
        child: BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.intro,
                style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
              ),
              const SizedBox(height: AppSpace.s16),
              SkeletonizerResourceWidget<List<LearnedItem>>(
                state.items,
                fakeValue: [LearnedItem.fake()],
                successBuilder: (items) {
                  final pending = [
                    for (final item in items)
                      if (item.status == LearnedStatus.pending) item,
                  ];
                  final confirmed = [
                    for (final item in items)
                      if (item.status == LearnedStatus.confirmed) item,
                  ];
                  if (pending.isEmpty && confirmed.isEmpty) {
                    return BaseEmptyState(title: l10n.emptyTitle, text: l10n.emptyText);
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (pending.isNotEmpty) ...[
                        _SectionTitle(text: l10n.pendingTitle),
                        const SizedBox(height: AppSpace.s8),
                        for (final item in pending) ...[
                          LearnedItemCard(
                            item: item,
                            onConfirm: () => _confirm(context, cubit, item),
                            onEdit: () => _edit(context, cubit, item),
                            onDiscard: () => _discard(context, cubit, item),
                          ),
                          const SizedBox(height: AppSpace.s10),
                        ],
                      ],
                      if (confirmed.isNotEmpty) ...[
                        if (pending.isNotEmpty) const SizedBox(height: AppSpace.s14),
                        _SectionTitle(text: l10n.confirmedTitle),
                        const SizedBox(height: AppSpace.s8),
                        for (final item in confirmed) ...[
                          LearnedItemCard(item: item),
                          const SizedBox(height: AppSpace.s10),
                        ],
                      ],
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
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _confirm(BuildContext context, LearnedItemsCubit cubit, LearnedItem item) async {
  final l10n = context.l10n.learned;
  final confirmed = await BaseConfirmSheet.show(
    context: context,
    title: l10n.confirmTitle,
    text: l10n.confirmText,
    confirmText: l10n.confirm,
  );
  if (!confirmed || !context.mounted) return;

  await cubit.confirm(item, partnerFactLabel: l10n.partnerFactLabel);
}

Future<void> _edit(BuildContext context, LearnedItemsCubit cubit, LearnedItem item) async {
  final l10n = context.l10n.learned;

  await BaseSheet.show<void>(
    context: context,
    title: l10n.editTitle,
    child: LearnedItemEditSheet(item: item, onSave: (text) => cubit.edit(item, text)),
  );
}

Future<void> _discard(BuildContext context, LearnedItemsCubit cubit, LearnedItem item) async {
  final l10n = context.l10n.learned;
  final discard = await BaseConfirmSheet.show(
    context: context,
    title: l10n.discardTitle,
    text: l10n.discardText,
    confirmText: l10n.discardConfirm,
    isDestructive: true,
  );
  if (!discard || !context.mounted) return;

  await cubit.discard(item);
}

class const _SectionTitle({required final String text}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Semantics(header: true, child: Text(text, style: context.text.titleXs));
}
