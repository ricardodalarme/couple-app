import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/questions/data/models/question_thread.dart';
import 'package:flutter_bloc_starter/features/questions/presentation/questions/cubit/questions_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const QuestionsAnswerView({required final QuestionThread thread, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.questions;
    final draft = context.select((QuestionsCubit cubit) => cubit.state.draft);
    final isSaving = context.select((QuestionsCubit cubit) => cubit.state.isSaving);
    final isEditing = context.select((QuestionsCubit cubit) => cubit.state.isEditing);
    final canSave = context.select((QuestionsCubit cubit) => cubit.state.canSave);
    final cubit = context.read<QuestionsCubit>();

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.eyebrow,
            style: context.text.label.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s8),
          Semantics(header: true, child: Text(thread.prompt.title, style: context.text.question)),
          if (thread.prompt.body case final body? when body.trim().isNotEmpty) ...[
            const SizedBox(height: AppSpace.s10),
            Text(body, style: context.text.body.copyWith(color: context.colors.textSecondary)),
          ],
          const SizedBox(height: AppSpace.s22),
          BaseTextArea(
            text: draft,
            hint: l10n.answerHint,
            maxLength: 1000,
            isEnabled: !isSaving,
            onChanged: cubit.onDraftChanged,
          ),
          const SizedBox(height: AppSpace.s16),
          BaseNote(text: thread.partnerHasAnswered ? l10n.partnerAnsweredNote : l10n.privateNote),
          if (thread.isSolo) ...[
            const SizedBox(height: AppSpace.s10),
            BaseNote(text: l10n.soloNote),
          ],
          const SizedBox(height: AppSpace.s18),
          BaseButton.secondary(
            text: l10n.voiceSoon,
            onPressed: null,
            isEnabled: false,
            isFullWidth: true,
            icon: AppIcons.mic,
          ),
          const SizedBox(height: AppSpace.s8),
          Text(
            l10n.voiceSoonNote,
            textAlign: TextAlign.center,
            style: context.text.caption.copyWith(color: context.colors.textSecondary),
          ),
        ],
      ),
      footer: Column(
        children: [
          BaseButton.primary(
            text: l10n.save,
            isLoading: isSaving,
            isEnabled: canSave,
            onPressed: cubit.save,
          ),
          if (isEditing) ...[
            const SizedBox(height: AppSpace.s6),
            BaseButton.text(
              text: l10n.cancel,
              onPressed: isSaving ? null : cubit.cancelEditing,
              isFullWidth: true,
            ),
          ],
        ],
      ),
    );
  }
}
