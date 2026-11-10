import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/together/data/models/date_idea.dart';
import 'package:flutter_bloc_starter/features/together/presentation/date_night/cubit/date_night_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Where the couple keeps date ideas, picks one together and plans it.
@RoutePage()
class const DateNightPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<DateNightCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.dateNight;
    final ideas = context.select((DateNightCubit cubit) => cubit.state.ideas);
    final suggestions = context.select((DateNightCubit cubit) => cubit.state.suggestions);
    final title = context.select((DateNightCubit cubit) => cubit.state.title);
    final canAdd = context.select((DateNightCubit cubit) => cubit.state.canAdd);
    final cubit = context.read<DateNightCubit>();

    return BaseView(
      body: BlocListener<DateNightCubit, DateNightState>(
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
                    onPressed: canAdd ? cubit.add : null,
                  ),
                ),
                const SizedBox(height: AppSpace.s20),
                SkeletonizerResourceWidget<List<DateIdea>>(
                  ideas,
                  fakeValue: [DateIdea.fake()],
                  successBuilder: (list) =>
                      list.isEmpty ? _Suggestions(suggestions: suggestions) : _Ideas(ideas: list),
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

class const _Suggestions({required final List<DateIdeaSuggestion> suggestions})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.dateNight;
    final cubit = context.read<DateNightCubit>();
    if (suggestions.isEmpty) {
      return BaseEmptyState(title: l10n.emptyTitle, text: l10n.emptyText);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseSectionHeader(title: l10n.suggestionsTitle),
        const SizedBox(height: AppSpace.s8),
        BaseListGroup(
          children: [
            for (final suggestion in suggestions)
              BaseListTile(
                title: suggestion.title,
                trailing: BaseTextLink(
                  text: l10n.save,
                  onPressed: () => cubit.add(suggestion: suggestion),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class const _Ideas({required final List<DateIdea> ideas}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.dateNight;
    final today = DateTime.now();
    final upcoming =
        ideas
            .where(
              (idea) =>
                  idea.isPlanned &&
                  idea.plannedFor != null &&
                  !idea.plannedFor!.isBefore(DateTime(today.year, today.month, today.day)),
            )
            .toList()
          ..sort((a, b) => a.plannedFor!.compareTo(b.plannedFor!));
    final planned = {for (final idea in upcoming) idea.id};
    final rest = [
      for (final idea in ideas)
        if (!planned.contains(idea.id)) idea,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (upcoming.isNotEmpty) ...[
          BaseSectionHeader(title: l10n.nextTitle),
          const SizedBox(height: AppSpace.s8),
          BaseListGroup(children: [for (final idea in upcoming) _IdeaTile(idea: idea)]),
          const SizedBox(height: AppSpace.s20),
        ],
        if (rest.isNotEmpty) ...[
          BaseSectionHeader(title: l10n.ideasTitle),
          const SizedBox(height: AppSpace.s8),
          BaseListGroup(children: [for (final idea in rest) _IdeaTile(idea: idea)]),
        ],
      ],
    );
  }
}

class const _IdeaTile({required final DateIdea idea}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.dateNight;
    final planned = idea.plannedFor;
    final subtitle = idea.isDone
        ? l10n.done
        : planned == null
        ? null
        : l10n.plannedFor(day: planned.day, month: l10n.monthsShort[planned.month - 1]);

    return BaseListTile(title: idea.title, subtitle: subtitle, onTap: () => _showOptions(context));
  }

  Future<void> _showOptions(BuildContext context) async {
    final l10n = context.l10n.dateNight;
    final cubit = context.read<DateNightCubit>();
    final action = await BaseSheet.show<Object>(
      context: context,
      title: idea.title,
      child: Builder(
        builder: (sheetContext) {
          void pick(Object value) => Navigator.of(sheetContext).pop(value);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!idea.isDone)
                for (final choice in PlanChoice.values) ...[
                  BaseButton(
                    text: l10n.planChoices.selectOrFallback(choice.name),
                    variant: .secondary,
                    onPressed: () => pick(choice),
                  ),
                  const SizedBox(height: AppSpace.s10),
                ],
              BaseButton(
                text: idea.isDone ? l10n.reopen : l10n.markDone,
                variant: .secondary,
                onPressed: () => pick('done'),
              ),
              const SizedBox(height: AppSpace.s10),
              BaseButton(text: l10n.delete, variant: .secondary, onPressed: () => pick('delete')),
            ],
          );
        },
      ),
    );
    switch (action) {
      case PlanChoice():
        await cubit.plan(idea, action);
      case 'done':
        await cubit.toggleDone(idea);
      case 'delete':
        await cubit.delete(idea);
    }
  }
}
