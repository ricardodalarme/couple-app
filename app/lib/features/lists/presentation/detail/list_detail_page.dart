import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/_shared/presentation/errors/app_error_view.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_item_status.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_models.dart';
import 'package:flutter_bloc_starter/features/lists/presentation/detail/cubit/list_detail_cubit.dart';
import 'package:flutter_bloc_starter/features/lists/presentation/text_prompt/text_prompt_sheet.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// One list with the things both people add, check and reorder.
@RoutePage()
class const ListDetailPage({@PathParam('id') required final String listId, super.key})
    extends StatefulWidget
    implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<ListDetailCubit>()..load(listId),
      child: this,
    );
  }

  @override
  State<ListDetailPage> createState() => _ListDetailPageState();
}

class _ListDetailPageState() extends State<ListDetailPage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) context.read<ListDetailCubit>().refresh();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.lists;
    final detail = context.select((ListDetailCubit cubit) => cubit.state.detail);
    final title = context.select((ListDetailCubit cubit) => cubit.state.title);
    final cubit = context.read<ListDetailCubit>();
    final loaded = detail is Success<ListDetail>;

    return BaseView(
      appBar: BaseAppBar(title: title ?? l10n.title),
      body: BlocListener<ListDetailCubit, ListDetailState>(
        listenWhen: (previous, current) => previous.changeAction != current.changeAction,
        listener: (context, state) {
          final action = state.changeAction;
          if (action is Failure) {
            BaseToast.show(context, l10n.errors.selectOrFallback(action.exception.l10nKey));
          }
        },
        child: BaseRefreshable(
          onRefresh: cubit.refresh,
          child: BaseStackedContent(
            body: SkeletonizerResourceWidget<ListDetail>(
              detail,
              fakeValue: ListDetail(list: CoupleList.fake(), items: [ListItem.fake()]),
              successBuilder: (value) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BaseNote(
                    text: value.list.isShared ? l10n.shared : l10n.private,
                    icon: value.list.isShared ? AppIcons.users : AppIcons.lock,
                  ),
                  if (value.list.isMine) ...[
                    const SizedBox(height: AppSpace.s8),
                    if (value.list.isShared)
                      BaseButton(
                        text: l10n.makePrivate,
                        variant: .secondary,
                        onPressed: () => cubit.setVisibility(isShared: false),
                      )
                    else if (value.currentCoupleId != null)
                      BaseButton(
                        text: l10n.shareWithPartner,
                        variant: .secondary,
                        onPressed: () => cubit.setVisibility(isShared: true),
                      ),
                  ],
                  const SizedBox(height: AppSpace.s16),
                  if (value.items.isEmpty)
                    BaseEmptyState(
                      title: l10n.itemEmptyTitle,
                      text: value.list.isShared
                          ? l10n.itemEmptyTextShared
                          : l10n.itemEmptyTextPrivate,
                    )
                  else
                    BaseListGroup(
                      children: [
                        for (final item in value.items)
                          _ItemTile(item: item, isShared: value.list.isShared),
                      ],
                    ),
                ],
              ),
              failureBuilder: (exception) =>
                  AppErrorView(exception: exception, onRetry: cubit.refresh),
            ),
            footer: loaded
                ? BaseButton(
                    text: l10n.add,
                    icon: AppIcons.plus,
                    onPressed: () => _addItem(context),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

class const _ItemTile({required final ListItem item, required final bool isShared})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.lists;
    final cubit = context.read<ListDetailCubit>();

    return BaseListTile(
      title: item.title,
      subtitle: l10n.statuses.selectOrFallback(item.status.name),
      leading: BaseCheckbox(
        value: item.isDone,
        semanticLabel: item.title,
        onChanged: (_) => cubit.toggleDone(item),
      ),
      trailing: AppPressable(
        onTap: () => _showOptions(context, item),
        semanticLabel: l10n.itemOptions,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        enforceMinTapTarget: true,
        child: AppIcon(icon: AppIcons.more, color: context.colors.iconMuted),
      ),
      onTap: () => cubit.toggleDone(item),
    );
  }

  Future<void> _showOptions(BuildContext context, ListItem item) async {
    final l10n = context.l10n.lists;
    final cubit = context.read<ListDetailCubit>();
    final choice = await BaseSheet.show<_ItemChoice>(
      context: context,
      title: l10n.itemOptions,
      subtitle: item.title,
      child: Builder(
        builder: (sheetContext) {
          void pick(_ItemChoice value) => Navigator.of(sheetContext).pop(value);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BaseButton(
                text: l10n.markDream,
                variant: .secondary,
                isEnabled: item.status != ListItemStatus.dream,
                onPressed: () => pick(_ItemChoice.dream),
              ),
              const SizedBox(height: AppSpace.s10),
              BaseButton(
                text: l10n.markPlanned,
                variant: .secondary,
                isEnabled: item.status != ListItemStatus.planned,
                onPressed: () => pick(_ItemChoice.planned),
              ),
              const SizedBox(height: AppSpace.s10),
              BaseButton(
                text: l10n.markDone,
                variant: .secondary,
                isEnabled: item.status != ListItemStatus.done,
                onPressed: () => pick(_ItemChoice.done),
              ),
              const SizedBox(height: AppSpace.s10),
              BaseButton(
                text: l10n.moveUp,
                variant: .secondary,
                onPressed: () => pick(_ItemChoice.up),
              ),
              const SizedBox(height: AppSpace.s10),
              BaseButton(
                text: l10n.moveDown,
                variant: .secondary,
                onPressed: () => pick(_ItemChoice.down),
              ),
              const SizedBox(height: AppSpace.s10),
              BaseButton(
                text: l10n.delete,
                variant: .secondary,
                onPressed: () => pick(_ItemChoice.delete),
              ),
            ],
          );
        },
      ),
    );
    if (choice == null || !context.mounted) return;

    switch (choice) {
      case _ItemChoice.dream:
        await cubit.setStatus(item, ListItemStatus.dream);
      case _ItemChoice.planned:
        await cubit.setStatus(item, ListItemStatus.planned);
      case _ItemChoice.done:
        await cubit.setStatus(item, ListItemStatus.done);
      case _ItemChoice.up:
        await cubit.move(item, up: true);
      case _ItemChoice.down:
        await cubit.move(item, up: false);
      case _ItemChoice.delete:
        await _delete(context, item);
    }
  }

  Future<void> _delete(BuildContext context, ListItem item) async {
    final l10n = context.l10n.lists;
    final cubit = context.read<ListDetailCubit>();
    final confirmed = await BaseConfirmSheet.show(
      context: context,
      title: l10n.itemDeleteTitle,
      text: isShared ? l10n.itemDeleteTextShared : l10n.itemDeleteTextPrivate,
      confirmText: l10n.itemDeleteConfirm,
      isDestructive: true,
    );
    if (confirmed && context.mounted) await cubit.deleteItem(item);
  }
}

Future<void> _addItem(BuildContext context) async {
  final l10n = context.l10n.lists;
  final cubit = context.read<ListDetailCubit>();

  await BaseSheet.show<void>(
    context: context,
    title: l10n.addItem,
    child: TextPromptSheet(
      label: l10n.titleLabel,
      hint: l10n.itemHint,
      maxLength: listItemTitleMaxLength,
      confirmText: l10n.add,
      errors: l10n.itemTitleErrors,
      onConfirm: cubit.addItem,
    ),
  );
}

/// What the person picked in the item options sheet.
enum _ItemChoice() {
  dream,
  planned,
  done,
  up,
  down,
  delete,
}
