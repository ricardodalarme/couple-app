import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/questions/data/models/question_thread.dart';
import 'package:flutter_bloc_starter/features/questions/presentation/questions/cubit/questions_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const QuestionsWaitingView({required final QuestionThread thread, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.questions;
    final cubit = context.read<QuestionsCubit>();
    final own = thread.ownAnswer;

    return BaseMomentContent(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BaseFace(kind: FaceKind.affectionate, size: FaceSize.showcase),
          const SizedBox(height: AppSpace.s20),
          Semantics(
            header: true,
            child: Text(
              l10n.waitingTitle,
              textAlign: TextAlign.center,
              style: context.text.titleMd,
            ),
          ),
          const SizedBox(height: AppSpace.s10),
          Text(
            thread.isSolo ? l10n.waitingSoloText : l10n.waitingText,
            textAlign: TextAlign.center,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s20),
          if (own != null)
            BaseSurfaceCard(
              title: l10n.you,
              child: Text(own.body, style: context.text.body),
            ),
          const SizedBox(height: AppSpace.s12),
          BaseTextLink(text: l10n.checkAgain, onPressed: cubit.load),
        ],
      ),
      footer: Column(
        children: [
          if (thread.canEdit)
            BaseButton.secondary(
              text: l10n.editCta,
              onPressed: cubit.startEditing,
              isFullWidth: true,
            ),
          if (thread.canEdit) const SizedBox(height: AppSpace.s6),
          BaseButton.text(
            text: l10n.close,
            onPressed: () => context.router.maybePop(),
            isFullWidth: true,
          ),
        ],
      ),
    );
  }
}
