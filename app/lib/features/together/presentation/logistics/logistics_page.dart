import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/together/data/models/logistic_item.dart';
import 'package:flutter_bloc_starter/features/together/presentation/logistics/cubit/logistics_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// The couple's shared list of practical things; nobody is counted or ranked.
@RoutePage()
class const LogisticsPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<LogisticsCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.logistics;
    final items = context.select((LogisticsCubit cubit) => cubit.state.items);
    final title = context.select((LogisticsCubit cubit) => cubit.state.title);
    final canAdd = context.select((LogisticsCubit cubit) => cubit.state.canAdd);
    final isAdding = context.select((LogisticsCubit cubit) => cubit.state.addAction.isLoading);
    final cubit = context.read<LogisticsCubit>();

    return BaseView(
      body: BlocListener<LogisticsCubit, LogisticsState>(
        listenWhen: (previous, current) =>
            previous.addAction != current.addAction ||
            previous.changeAction != current.changeAction,
        listener: (context, state) {
          final failure = switch ((state.addAction, state.changeAction)) {
            (Failure(:final exception), _) || (_, Failure(:final exception)) => exception,
            _ => null,
          };
          if (failure != null) {
            BaseToast.show(context, l10n.errors.selectOrFallback(failure.l10nKey));
          }
        },
        child: BaseRefreshable(
          onRefresh: cubit.load,
          child: BaseStackedContent(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Semantics(header: true, child: Text(l10n.title, style: context.text.titleXl)),
                const SizedBox(height: AppSpace.s8),
                Text(
                  l10n.subtitle,
                  style: context.text.body.copyWith(color: context.colors.textSecondary),
                ),
                const SizedBox(height: AppSpace.s16),
                BaseTextField(
                  text: title,
                  hint: l10n.hint,
                  onChanged: cubit.onTitleChanged,
                  onSubmitted: (_) => cubit.add(),
                  trailingAction: BaseTextLink(
                    text: l10n.add,
                    onPressed: canAdd && !isAdding ? cubit.add : null,
                  ),
                ),
                const SizedBox(height: AppSpace.s20),
                SkeletonizerResourceWidget<List<LogisticItem>>(
                  items,
                  fakeValue: [LogisticItem.fake(), LogisticItem.fake()],
                  successBuilder: (list) => list.isEmpty
                      ? BaseEmptyState(title: l10n.emptyTitle, text: l10n.emptyText)
                      : _Items(items: list),
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
      ),
    );
  }
}

class const _Items({required final List<LogisticItem> items}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.logistics;
    final open = [
      for (final item in items)
        if (!item.isDone) item,
    ];
    final done = [
      for (final item in items)
        if (item.isDone) item,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (open.isNotEmpty)
          BaseListGroup(children: [for (final item in open) _ItemTile(item: item)]),
        if (done.isNotEmpty) ...[
          const SizedBox(height: AppSpace.s20),
          BaseSectionHeader(title: l10n.doneTitle),
          const SizedBox(height: AppSpace.s8),
          BaseListGroup(children: [for (final item in done) _ItemTile(item: item)]),
        ],
      ],
    );
  }
}

class const _ItemTile({required final LogisticItem item}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.logistics;
    final state = context.select((LogisticsCubit cubit) => cubit.state);
    final cubit = context.read<LogisticsCubit>();
    final who = switch (item.assigneeId) {
      null => l10n.both,
      final id when id == state.meId => l10n.me,
      _ => state.partnerName ?? l10n.partner,
    };

    return BaseListTile(
      title: item.title,
      subtitle: state.hasPartner || item.assigneeId != null ? who : null,
      leading: BaseCheckbox(
        value: item.isDone,
        semanticLabel: item.title,
        onChanged: (_) => cubit.toggleDone(item),
      ),
      onTap: () => _showOptions(context, item),
    );
  }

  Future<void> _showOptions(BuildContext context, LogisticItem item) async {
    final l10n = context.l10n.logistics;
    final cubit = context.read<LogisticsCubit>();
    final state = cubit.state;
    final choice = await BaseSheet.show<_Choice>(
      context: context,
      title: item.title,
      child: Builder(
        builder: (sheetContext) {
          void pick(_Choice value) => Navigator.of(sheetContext).pop(value);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BaseButton(
                text: l10n.assignMe,
                variant: .secondary,
                onPressed: () => pick(_Choice.me),
              ),
              if (state.hasPartner) ...[
                const SizedBox(height: AppSpace.s10),
                BaseButton(
                  text: state.partnerName ?? l10n.partner,
                  variant: .secondary,
                  onPressed: () => pick(_Choice.partner),
                ),
                const SizedBox(height: AppSpace.s10),
                BaseButton(
                  text: l10n.both,
                  variant: .secondary,
                  onPressed: () => pick(_Choice.both),
                ),
              ],
              const SizedBox(height: AppSpace.s10),
              BaseButton(
                text: l10n.delete,
                variant: .secondary,
                onPressed: () => pick(_Choice.delete),
              ),
            ],
          );
        },
      ),
    );
    if (choice == null) return;

    switch (choice) {
      case _Choice.delete:
        await cubit.delete(item);
      case _Choice.me:
        await cubit.assign(item, assigneeId: state.meId);
      case _Choice.partner:
        await cubit.assign(item, assigneeId: state.partnerId);
      case _Choice.both:
        await cubit.assign(item);
    }
  }
}

/// What the person picked in the item sheet.
enum _Choice() {
  me,
  partner,
  both,
  delete,
}
