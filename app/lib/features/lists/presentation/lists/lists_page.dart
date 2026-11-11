import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/_shared/presentation/errors/app_error_view.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_models.dart';
import 'package:flutter_bloc_starter/features/lists/presentation/lists/cubit/lists_cubit.dart';
import 'package:flutter_bloc_starter/features/lists/presentation/lists/widgets/create_list_sheet.dart';
import 'package:flutter_bloc_starter/features/lists/presentation/widgets/text_prompt_sheet.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The couple's shared and private lists.
@RoutePage()
class const ListsPage({super.key}) extends StatefulWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<ListsCubit>()..load(), child: this);
  }

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState() extends State<ListsPage> with WidgetsBindingObserver {
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
    if (state == AppLifecycleState.resumed) context.read<ListsCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.lists;
    final lists = context.select((ListsCubit cubit) => cubit.state.lists);
    final hasPartner = context.select((ListsCubit cubit) => cubit.state.coupleId != null);
    final canCreate = lists is Success<List<CoupleList>>;
    final cubit = context.read<ListsCubit>();

    return BaseView(
      body: BlocListener<ListsCubit, ListsState>(
        listenWhen: (previous, current) =>
            previous.createAction != current.createAction ||
            previous.changeAction != current.changeAction,
        listener: (context, state) {
          final failure = switch ((state.createAction, state.changeAction)) {
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
                Row(
                  children: [
                    Expanded(
                      child: Semantics(
                        header: true,
                        child: Text(l10n.title, style: context.text.titleXl),
                      ),
                    ),
                    BaseRoundButton(
                      icon: AppIcons.plus,
                      semanticLabel: l10n.newList,
                      onPressed: canCreate ? () => _create(context, hasPartner) : null,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpace.s8),
                Text(
                  l10n.subtitle,
                  style: context.text.body.copyWith(color: context.colors.textSecondary),
                ),
                const SizedBox(height: AppSpace.s20),
                SkeletonizerResourceWidget<List<CoupleList>>(
                  lists,
                  fakeValue: [CoupleList.fake(), CoupleList.fake()],
                  successBuilder: (values) => values.isEmpty
                      ? BaseEmptyState(
                          title: l10n.emptyTitle,
                          text: hasPartner ? l10n.emptyTextShared : l10n.emptyTextPrivate,
                          actionText: l10n.newList,
                          onAction: () => _create(context, hasPartner),
                        )
                      : BaseListGroup(children: [for (final list in values) _ListTile(list: list)]),
                  failureBuilder: (exception) =>
                      AppErrorView(exception: exception, onRetry: cubit.load),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class const _ListTile({required final CoupleList list}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.lists;
    final cubit = context.read<ListsCubit>();

    return BaseListTile(
      icon: _icon(list.kind),
      title: list.title,
      subtitle: list.isShared ? l10n.shared : l10n.private,
      showsChevron: true,
      trailing: BaseRoundButton(
        icon: AppIcons.more,
        semanticLabel: l10n.listOptions,
        onPressed: () => _showOptions(context, list),
      ),
      onTap: () async {
        await context.pushRoute(ListDetailRoute(listId: list.id));
        if (context.mounted) await cubit.load();
      },
    );
  }

  IconData _icon(String kind) => switch (kind) {
    'travel' => AppIcons.globe,
    'restaurants' => AppIcons.star,
    'movies' => AppIcons.camera,
    _ => AppIcons.note,
  };

  Future<void> _showOptions(BuildContext context, CoupleList list) async {
    final l10n = context.l10n.lists;
    final choice = await BaseSheet.show<_ListChoice>(
      context: context,
      title: l10n.listOptions,
      subtitle: list.title,
      child: Builder(
        builder: (sheetContext) {
          void pick(_ListChoice value) => Navigator.of(sheetContext).pop(value);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BaseButton(
                text: l10n.rename,
                variant: .secondary,
                onPressed: () => pick(_ListChoice.rename),
              ),
              const SizedBox(height: AppSpace.s10),
              BaseButton(
                text: l10n.delete,
                variant: .secondary,
                onPressed: () => pick(_ListChoice.delete),
              ),
            ],
          );
        },
      ),
    );
    if (choice == null || !context.mounted) return;

    switch (choice) {
      case _ListChoice.rename:
        await _rename(context, list);
      case _ListChoice.delete:
        await _delete(context, list);
    }
  }

  Future<void> _rename(BuildContext context, CoupleList list) async {
    final l10n = context.l10n.lists;
    final cubit = context.read<ListsCubit>();

    await BaseSheet.show<void>(
      context: context,
      title: l10n.renameTitle,
      child: TextPromptSheet(
        label: l10n.titleLabel,
        hint: l10n.titleHint,
        initialText: list.title,
        maxLength: listTitleMaxLength,
        confirmText: l10n.save,
        onConfirm: (title) => cubit.rename(list, title),
      ),
    );
  }

  Future<void> _delete(BuildContext context, CoupleList list) async {
    final l10n = context.l10n.lists;
    final cubit = context.read<ListsCubit>();
    final confirmed = await BaseConfirmSheet.show(
      context: context,
      title: l10n.deleteTitle,
      text: list.isShared ? l10n.deleteTextShared : l10n.deleteTextPrivate,
      confirmText: l10n.deleteConfirm,
      isDestructive: true,
    );
    if (confirmed && context.mounted) await cubit.delete(list);
  }
}

Future<void> _create(BuildContext context, bool hasPartner) async {
  final l10n = context.l10n.lists;
  final cubit = context.read<ListsCubit>();

  await BaseSheet.show<void>(
    context: context,
    title: l10n.createTitle,
    child: CreateListSheet(
      hasPartner: hasPartner,
      onCreate: (title, kind, isShared) =>
          cubit.create(title: title, kind: kind, isShared: isShared),
    ),
  );
}

/// What the person picked in the list options sheet.
enum _ListChoice() {
  rename,
  delete,
}
