import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/questions/data/models/question_thread.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const QuestionsRevealView({required final QuestionThread thread, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.questions;
    final partnerName = thread.prompt.partnerName;
    final partnerLabel = partnerName == null || partnerName.isEmpty
        ? l10n.partnerFallback
        : partnerName;

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            header: true,
            child: AppHighlightedText(
              text: l10n.revealTitle,
              highlight: l10n.revealHighlight,
              style: context.text.question,
            ),
          ),
          const SizedBox(height: AppSpace.s8),
          Text(
            l10n.revealSubtitle,
            style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s20),
          _AnswerCard(label: l10n.you, body: thread.ownAnswer?.body ?? ''),
          const SizedBox(height: AppSpace.s12),
          _AnswerCard(label: partnerLabel, body: thread.partnerAnswer?.body ?? ''),
          const SizedBox(height: AppSpace.s16),
          Text(
            l10n.revealNote,
            style: context.text.caption.copyWith(color: context.colors.textSecondary),
          ),
        ],
      ),
      footer: BaseButton.primary(text: l10n.close, onPressed: () => context.router.maybePop()),
    );
  }
}

class const _AnswerCard({required final String label, required final String body})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseSurfaceCard(
      title: label,
      child: Text(body, style: context.text.body),
    );
  }
}
