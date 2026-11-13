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
    final view = context.select((MemoriesCubit cubit) => cubit.state.view);
    final showsFooter = context.select(
      (MemoriesCubit cubit) => cubit.state.showsForm && cubit.state.view == MemoriesView.timeline,
    );
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
                BaseSegmented(
                  segments: [l10n.segmentTimeline, l10n.segmentJar],
                  selectedIndex: view.index,
                  onSelectionChanged: (index) => cubit.onViewChanged(MemoriesView.values[index]),
                ),
                const SizedBox(height: AppSpace.s16),
                if (view == MemoriesView.jar) const _JarResult() else const _MemoriesTimeline(),
              ],
            ),
            footer: showsFooter ? const _SaveButton() : null,
          ),
        ),
      ),
    );
  }
}

class const _MemoriesTimeline() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.memories;
    final memories = context.select((MemoriesCubit cubit) => cubit.state.memories);
    final cubit = context.read<MemoriesCubit>();

    return SkeletonizerResourceWidget<List<Memory>>(
      memories,
      fakeValue: [Memory.fake()],
      successBuilder: (list) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (list.isEmpty)
            BaseEmptyState(title: l10n.emptyTitle, text: l10n.emptyText)
          else
            BaseListGroup(
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
                      if (memory.place != null) memory.place!,
                    ].join(' · '),
                    trailing: BaseTextLink(
                      text: l10n.delete,
                      onPressed: () => cubit.delete(memory),
                    ),
                  ),
              ],
            ),
          const SizedBox(height: AppSpace.s16),
          const _MemoryComposer(),
          const SizedBox(height: AppSpace.s24),
          BaseSectionHeader(title: l10n.moreTitle),
          const SizedBox(height: AppSpace.s8),
          BaseListGroup(
            children: [
              BaseListTile(
                icon: AppIcons.book,
                title: l10n.historyTitle,
                showsChevron: true,
                titleMaxLines: 1,
                onTap: () => context.pushRoute(const HistoryRoute()),
              ),
              BaseListTile(
                icon: AppIcons.map_pin,
                title: l10n.placesTitle,
                showsChevron: true,
                titleMaxLines: 1,
                onTap: () => context.pushRoute(const PlacesRoute()),
              ),
              BaseListTile(
                icon: AppIcons.share,
                title: l10n.storyTitle,
                showsChevron: true,
                titleMaxLines: 1,
                onTap: () => context.pushRoute(const StoryRoute()),
              ),
            ],
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

class const _MemoryComposer() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.memories;
    final showsForm = context.select((MemoriesCubit cubit) => cubit.state.showsForm);
    final cubit = context.read<MemoriesCubit>();

    if (!showsForm) {
      return BaseListGroup(
        children: [BaseListTile(icon: AppIcons.plus, title: l10n.add, onTap: cubit.openForm)],
      );
    }

    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _MemoryTitleField(),
        SizedBox(height: AppSpace.s12),
        _MemoryPlaceField(),
        SizedBox(height: AppSpace.s12),
        _MemoryBodyField(),
      ],
    );
  }
}

class const _MemoryTitleField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.memories;
    final title = context.select((MemoriesCubit cubit) => cubit.state.title);
    final cubit = context.read<MemoriesCubit>();

    return BaseTextField(
      text: title.value,
      label: l10n.titleLabel,
      hint: l10n.titleHint,
      errorText: l10n.titleErrors.selectOrNull(title.errorName),
      onChanged: cubit.onTitleChanged,
    );
  }
}

class const _MemoryPlaceField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.memories;
    final place = context.select((MemoriesCubit cubit) => cubit.state.place);
    final looksLikeAddress = context.select(
      (MemoriesCubit cubit) => cubit.state.placeLooksLikeAddress,
    );
    final cubit = context.read<MemoriesCubit>();

    return BaseTextField(
      text: place.value,
      label: l10n.placeLabel,
      hint: l10n.placeHint,
      helpText: looksLikeAddress ? l10n.placeAddressNote : null,
      errorText: l10n.placeErrors.selectOrNull(place.errorName),
      onChanged: cubit.onPlaceChanged,
    );
  }
}

class const _MemoryBodyField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.memories;
    final body = context.select((MemoriesCubit cubit) => cubit.state.body);
    final cubit = context.read<MemoriesCubit>();

    return BaseTextArea(
      text: body.value,
      hint: l10n.bodyHint,
      maxLength: memoryBodyMaxLength,
      maxLines: 3,
      errorText: l10n.bodyErrors.selectOrNull(body.errorName),
      onChanged: cubit.onBodyChanged,
    );
  }
}

class const _SaveButton() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isSaving = context.select((MemoriesCubit cubit) => cubit.state.saveAction.isLoading);
    final cubit = context.read<MemoriesCubit>();

    return BaseButton(text: context.l10n.memories.save, isLoading: isSaving, onPressed: cubit.save);
  }
}

class const _JarResult() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.memories;
    final jar = context.select((MemoriesCubit cubit) => cubit.state.jarAction);
    final cubit = context.read<MemoriesCubit>();

    if (jar is Success<String?>) {
      final text = jar.value;

      if (text == null) {
        return BaseEmptyState(
          title: l10n.jarEmptyTitle,
          text: l10n.jarEmpty,
          textMaxLines: null,
          actionText: l10n.jarEmptyAction,
          onAction: cubit.closeJar,
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: AppSpace.s12),
          BaseSurfaceCard(
            style: .ring,
            padding: const EdgeInsets.all(AppSpace.s20),
            child: Semantics(liveRegion: true, child: Text(text, style: context.text.titleLg)),
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

    if (jar is Failure) {
      return BaseEmptyState(
        title: l10n.errorTitle,
        text: l10n.errorText,
        actionText: context.l10n.common.retry,
        onAction: cubit.drawFromJar,
      );
    }

    return const Padding(
      padding: EdgeInsets.only(top: AppSpace.s24),
      child: Center(child: BaseLoadingDots()),
    );
  }
}
