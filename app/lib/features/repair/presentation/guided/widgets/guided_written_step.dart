import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/guided_session.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/guided/cubit/guided_repair_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const GuidedWrittenStep({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.repair.guided;
    final session = context.select((GuidedRepairCubit cubit) => cubit.state.current);
    if (session == null) return const SizedBox.shrink();

    final cubit = context.read<GuidedRepairCubit>();

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.stepOf(current: session.step + 1, total: guidedWrittenSteps + 1),
            style: context.text.label.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s8),
          Semantics(
            header: true,
            child: AppHighlightedText(
              text: l10n.stepTitles[session.step],
              highlight: l10n.stepHighlights[session.step],
              style: context.text.display,
            ),
          ),
          const SizedBox(height: AppSpace.s20),
          BaseTextArea(
            key: ValueKey('guided-${session.step}'),
            text: session.answers[session.step],
            hint: l10n.stepHints[session.step],
            maxLength: guidedAnswerMaxLength,
            onChanged: cubit.onAnswerChanged,
          ),
          const SizedBox(height: AppSpace.s16),
          BaseNote(text: l10n.private),
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseButton(text: l10n.next, onPressed: cubit.next),
          const SizedBox(height: AppSpace.s10),
          Row(
            children: [
              if (session.step > 0) ...[
                Expanded(
                  child: BaseButton(text: l10n.back, variant: .secondary, onPressed: cubit.back),
                ),
                const SizedBox(width: AppSpace.s10),
              ],
              Expanded(
                child: BaseButton(
                  text: l10n.later,
                  variant: .secondary,
                  onPressed: () async {
                    await cubit.saveForLater();
                    if (context.mounted) {
                      BaseToast.show(context, l10n.savedLater);
                      await context.router.maybePop();
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
