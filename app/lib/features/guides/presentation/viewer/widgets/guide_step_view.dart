import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/guides/data/repositories/guides_repository.dart';
import 'package:flutter_bloc_starter/features/guides/presentation/viewer/cubit/guide_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const GuideStepView({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.guides.viewer;
    final guide = context.select((GuideCubit cubit) => cubit.state.currentGuide);
    final stepIndex = context.select((GuideCubit cubit) => cubit.state.stepIndex);
    final answer = context.select((GuideCubit cubit) => cubit.state.currentAnswer);
    final isLastStep = context.select((GuideCubit cubit) => cubit.state.isLastStep);
    final canGoBack = context.select((GuideCubit cubit) => cubit.state.canGoBack);
    final isSaving = context.select((GuideCubit cubit) => cubit.state.isSaving);
    final cubit = context.read<GuideCubit>();
    if (guide == null) return const SizedBox.shrink();

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppHighlightedText(
            text: guide.title,
            highlight: guide.title,
            style: context.text.display,
          ),
          const SizedBox(height: AppSpace.s8),
          Text(
            guide.description,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s20),
          BaseStepper(count: guide.stepCount, currentIndex: stepIndex),
          const SizedBox(height: AppSpace.s22),
          Text(
            l10n.stepOf(current: stepIndex + 1, total: guide.stepCount),
            style: context.text.label.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s8),
          Text(guide.prompts[stepIndex], style: context.text.question),
          const SizedBox(height: AppSpace.s20),
          BaseTextArea(
            text: answer,
            hint: l10n.answerHint,
            maxLength: guideAnswerMaxLength,
            onChanged: cubit.onAnswerChanged,
          ),
          const SizedBox(height: AppSpace.s16),
          BaseNote(text: l10n.stepNote),
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseButton(
            text: isLastStep ? l10n.finish : l10n.next,
            isLoading: isSaving,
            onPressed: cubit.next,
          ),
          const SizedBox(height: AppSpace.s6),
          BaseButton.text(
            text: l10n.back,
            onPressed: canGoBack && !isSaving ? cubit.back : null,
            isFullWidth: true,
          ),
        ],
      ),
    );
  }
}
