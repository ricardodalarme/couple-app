import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/memories/data/models/memory.dart';
import 'package:flutter_bloc_starter/features/memories/presentation/memories/cubit/memories_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The couple's memories and the jar of good slips to open on a bad day.
@RoutePage()
class const MemoriesPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<MemoriesCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.memories;
    final state = context.select((MemoriesCubit cubit) => cubit.state);
    final cubit = context.read<MemoriesCubit>();

    return BaseView(
      appBar: null,
      body: BlocListener<MemoriesCubit, MemoriesState>(
        listenWhen: (previous, current) =>
            previous.saveAction != current.saveAction || previous.jarAction != current.jarAction,
        listener: (context, state) {
          final failure = switch ((state.saveAction, state.jarAction)) {
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
                const SizedBox(height: AppSpace.s16),
                BaseListCard(
                  categoryLabel: l10n.historyLabel,
                  title: l10n.historyTitle,
                  supportText: l10n.historyText,
                  onTap: () => context.pushRoute(const HistoryRoute()),
                ),
                const SizedBox(height: AppSpace.s12),
                const _Jar(),
                const SizedBox(height: AppSpace.s20),
                BaseTextField(
                  text: state.title,
                  label: l10n.titleLabel,
                  hint: l10n.titleHint,
                  onChanged: cubit.onTitleChanged,
                ),
                const SizedBox(height: AppSpace.s12),
                BaseTextArea(
                  text: state.body,
                  hint: l10n.bodyHint,
                  maxLength: memoryBodyMaxLength,
                  maxLines: 3,
                  onChanged: cubit.onBodyChanged,
                ),
                const SizedBox(height: AppSpace.s24),
                SkeletonizerResourceWidget<List<Memory>>(
                  state.memories,
                  fakeValue: [Memory.fake()],
                  successBuilder: (list) => list.isEmpty
                      ? BaseEmptyState(title: l10n.emptyTitle, text: l10n.emptyText)
                      : BaseListGroup(
                          children: [
                            for (final memory in list)
                              BaseListTile(
                                title: memory.title,
                                subtitle: [
                                  l10n.dateLine(
                                    day: memory.happenedOn.day,
                                    month: l10n.monthsShort[memory.happenedOn.month - 1],
                                    year: memory.happenedOn.year,
                                  ),
                                  if (memory.body != null) memory.body!,
                                ].join(' · '),
                                trailing: BaseTextLink(
                                  text: l10n.delete,
                                  onPressed: () => cubit.delete(memory),
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
            footer: BaseButton(
              text: l10n.save,
              isEnabled: state.canSave,
              isLoading: state.saveAction.isLoading,
              onPressed: cubit.save,
            ),
          ),
        ),
      ),
    );
  }
}

class const _Jar() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.memories;
    final jar = context.select((MemoriesCubit cubit) => cubit.state.jarAction);
    final cubit = context.read<MemoriesCubit>();

    if (jar is Success<String?>) {
      final text = jar.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: context.colors.bgSurface,
              borderRadius: BorderRadius.circular(AppRadius.card),
              boxShadow: AppShadows.ring,
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSpace.s20),
              child: Semantics(
                liveRegion: true,
                child: Text(
                  text ?? l10n.jarEmpty,
                  style: text == null ? context.text.body : context.text.titleLg,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpace.s8),
          Row(
            children: [
              BaseTextLink(text: l10n.jarAnother, onPressed: cubit.drawFromJar),
              const Spacer(),
              BaseTextLink(text: l10n.jarClose, onPressed: cubit.closeJar),
            ],
          ),
        ],
      );
    }

    return BaseListCard(
      categoryLabel: l10n.jarLabel,
      title: l10n.jarTitle,
      supportText: l10n.jarText,
      onTap: cubit.drawFromJar,
    );
  }
}
