import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/story/data/models/story_card.dart';
import 'package:flutter_bloc_starter/features/story/presentation/story/cubit/story_cubit.dart';
import 'package:flutter_bloc_starter/features/story/presentation/story/widgets/story_painter.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// A picture of the couple's numbers to share; it holds no names or text unless the person adds them.
@RoutePage()
class const StoryPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<StoryCubit>()..load(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.story;
    final story = context.select((StoryCubit cubit) => cubit.state.story);
    final includeNames = context.select((StoryCubit cubit) => cubit.state.includeNames);
    final phrase = context.select((StoryCubit cubit) => cubit.state.phrase);
    final isSharing = context.select((StoryCubit cubit) => cubit.state.shareAction.isLoading);
    final card = context.select((StoryCubit cubit) => cubit.card);
    final cubit = context.read<StoryCubit>();
    final labels = StoryLabels(days: l10n.days, together: l10n.together);

    return BaseView(
      body: BlocListener<StoryCubit, StoryState>(
        listenWhen: (previous, current) => previous.shareAction != current.shareAction,
        listener: (context, state) {
          final action = state.shareAction;
          if (action is Failure) {
            BaseToast.show(context, l10n.errors.selectOrFallback(action.exception.l10nKey));
          }
        },
        child: SkeletonizerResourceWidget<StoryCard?>(
          story,
          fakeValue: StoryCard.fake(),
          successBuilder: (_) => card == null
              ? BaseEmptyState(title: l10n.emptyTitle, text: l10n.emptyText)
              : BaseStackedContent(
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Semantics(header: true, child: Text(l10n.title, style: context.text.titleXl)),
                      const SizedBox(height: AppSpace.s8),
                      BaseNote(text: l10n.privacyNote),
                      const SizedBox(height: AppSpace.s16),
                      Center(
                        child: SizedBox(
                          width: 200,
                          child: AspectRatio(
                            aspectRatio: 9 / 16,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(AppRadius.xl),
                              child: CustomPaint(
                                painter: StoryPainter(card: card, labels: labels),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpace.s16),
                      BaseListTile(
                        title: l10n.namesLabel,
                        subtitle: l10n.namesText,
                        control: BaseSwitch(
                          value: includeNames,
                          semanticLabel: l10n.namesLabel,
                          onChanged: (value) => cubit.onNamesToggled(value: value),
                        ),
                      ),
                      const SizedBox(height: AppSpace.s12),
                      BaseTextField(
                        text: phrase,
                        label: l10n.phraseLabel,
                        hint: l10n.phraseHint,
                        onChanged: cubit.onPhraseChanged,
                      ),
                    ],
                  ),
                  footer: BaseButton(
                    text: l10n.share,
                    isLoading: isSharing,
                    onPressed: () => cubit.share(labels),
                  ),
                ),
          failureBuilder: (_) => BaseEmptyState(
            title: l10n.errorTitle,
            text: l10n.errorText,
            actionText: context.l10n.common.retry,
            onAction: cubit.load,
          ),
        ),
      ),
    );
  }
}
