import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/checkin/data/models/checkin_week.dart';
import 'package:flutter_bloc_starter/features/checkin/presentation/checkin/cubit/checkin_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const CheckinQuestionView({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.checkin;
    final index = context.select((CheckinCubit cubit) => cubit.state.questionIndex);
    final draft = context.select((CheckinCubit cubit) => cubit.state.draft);
    final isSaving = context.select((CheckinCubit cubit) => cubit.state.isSaving);
    final isLast = context.select((CheckinCubit cubit) => cubit.state.isLastQuestion);
    final cubit = context.read<CheckinCubit>();
    final questions = l10n.questions;
    final question = index < questions.length ? questions[index] : '';

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseStepper(count: checkinQuestionCount, currentIndex: index),
          const SizedBox(height: AppSpace.s22),
          Text(
            l10n.questionOf(current: index + 1, total: checkinQuestionCount),
            style: context.text.label.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s8),
          Semantics(header: true, child: Text(question, style: context.text.question)),
          const SizedBox(height: AppSpace.s20),
          BaseTextArea(
            // Each question gets its own controller, so its saved draft is the only text shown.
            key: ValueKey(index),
            text: draft,
            hint: l10n.answerHint,
            maxLength: 1000,
            isEnabled: !isSaving,
            onChanged: cubit.onDraftChanged,
          ),
          const SizedBox(height: AppSpace.s16),
          BaseNote(text: l10n.privateNote),
        ],
      ),
      footer: Column(
        children: [
          BaseButton.primary(
            text: isLast ? l10n.finish : l10n.next,
            isLoading: isSaving,
            onPressed: cubit.next,
          ),
          const SizedBox(height: AppSpace.s6),
          BaseButton.text(
            text: l10n.skip,
            onPressed: isSaving ? null : cubit.skip,
            isFullWidth: true,
          ),
          const SizedBox(height: AppSpace.s6),
          Text(
            l10n.skipNote,
            textAlign: TextAlign.center,
            style: context.text.caption.copyWith(color: context.colors.textSecondary),
          ),
        ],
      ),
    );
  }
}
