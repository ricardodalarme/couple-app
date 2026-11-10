import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/checkin/data/models/checkin_week.dart';
import 'package:flutter_bloc_starter/features/checkin/presentation/checkin/cubit/checkin_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const CheckinRevealView({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.checkin;
    final week = context.select((CheckinCubit cubit) => cubit.state.current);
    if (week == null) return const SizedBox.shrink();

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
          for (var question = 1; question <= checkinQuestionCount; question++) ...[
            if (question > 1) const SizedBox(height: AppSpace.s12),
            _AnswerCard(week: week, question: question),
          ],
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

class const _AnswerCard({required final CheckinWeek week, required final int question})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.checkin;
    final questions = l10n.questions;
    final own = week.answerFor(question);
    final partner = week.partnerAnswerFor(question);
    final partnerName = week.partnerName;

    return BaseSurfaceCard(
      title: question <= questions.length ? questions[question - 1] : '',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Answer(label: l10n.you, body: own?.body ?? l10n.skippedAnswer),
          const SizedBox(height: AppSpace.s12),
          _Answer(
            label: partnerName == null || partnerName.isEmpty ? l10n.partnerFallback : partnerName,
            body: partner?.body ?? l10n.skippedAnswer,
          ),
        ],
      ),
    );
  }
}

class const _Answer({required final String label, required final String body})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.text.label.copyWith(color: context.colors.textSecondary)),
        const SizedBox(height: AppSpace.s4),
        Text(body, style: context.text.body),
      ],
    );
  }
}
