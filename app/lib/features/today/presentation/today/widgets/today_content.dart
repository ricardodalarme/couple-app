import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/shared/widgets/received_card.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/shared/widgets/week_card.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_kind.dart';
import 'package:flutter_bloc_starter/features/mood/presentation/mood/mood_faces.dart';
import 'package:flutter_bloc_starter/features/mood/presentation/mood/widgets/mood_row.dart';
import 'package:flutter_bloc_starter/features/mood/presentation/mood/widgets/partner_mood_hint.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/off_banner/widgets/notifications_off_banner.dart';
import 'package:flutter_bloc_starter/features/today/data/models/today_home.dart';
import 'package:flutter_bloc_starter/features/today/presentation/today/cubit/today_cubit.dart';
import 'package:flutter_bloc_starter/features/today/presentation/today/widgets/today_header.dart';
import 'package:flutter_bloc_starter/features/today/presentation/today/widgets/today_pause.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The body of Hoje: banners, the main card, the mood, the week so far and today's idea.
///
/// The main card follows the person's state: the partner's question when connected, a private
/// prompt when on their own, and a welcome on the first day.
class const TodayContent({
  required final TodayHome home,
  final String? selfName,
  final String? partnerHint,
  final bool isFirstDay = false,
  final bool isDiscreet = false,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.today;
    final idea = home.idea;
    final isAlone = !home.isPaired;

    if (home.isPausedAt(DateTime.now())) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TodayHeader(home: home, selfName: selfName, isFirstDay: isFirstDay),
          const SizedBox(height: AppSpace.s20),
          TodayPause(home: home),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TodayHeader(home: home, selfName: selfName, isFirstDay: isFirstDay),
        const SizedBox(height: AppSpace.s20),
        const NotificationsOffBanner(),
        if (home.unopenedCards > 0) ...[
          ReceivedCard(
            title: home.partnerName == null
                ? l10n.cardReceived
                : l10n.cardReceivedNamed(name: home.partnerName!),
            actionText: l10n.cardReceivedAction,
            onAction: () async {
              await context.pushRoute(const CardsListRoute());
              if (context.mounted) await context.read<TodayCubit>().load();
            },
          ),
          const SizedBox(height: AppSpace.s12),
        ],
        if (home.unseenSignals > 0) ...[
          BaseBanner(
            text: l10n.signalReceived,
            icon: AppIcons.mail,
            actionLabel: l10n.signalReceivedAction,
            onAction: () async {
              await context.pushRoute(const ReceivedSignalsRoute());
              if (context.mounted) await context.read<TodayCubit>().load();
            },
          ),
          const SizedBox(height: AppSpace.s12),
        ],
        if (home.hasPendingInvite) ...[
          BaseListCard(
            category: AppCategory.invite,
            categoryLabel: l10n.pendingInviteTitle,
            title: l10n.pendingInviteText,
            supportText: l10n.pendingInviteAction,
            onTap: () => context.pushRoute(const InviteRoute()),
          ),
          const SizedBox(height: AppSpace.s12),
        ],
        _MainCard(home: home, isFirstDay: isFirstDay),
        if (!home.hasPendingInvite) ...[
          const SizedBox(height: AppSpace.s16),
          WeekCard(
            title: isAlone
                ? l10n.slipsThisWeekPrivate(count: home.slipsThisWeek)
                : l10n.slipsThisWeek(count: home.slipsThisWeek),
            supportText: home.slipsThisWeek == 0 ? l10n.weekHintEmpty : l10n.weekHint,
            filledCount: home.slipsThisWeek,
          ),
        ],
        if (home.isPaired && home.unopenedCards == 0 && home.slipsThisWeek > 0) ...[
          const SizedBox(height: AppSpace.s10),
          Center(
            child: Text(
              l10n.nothingReceived,
              style: context.text.caption.copyWith(color: context.colors.textSecondary),
            ),
          ),
        ],
        if (!isDiscreet && home.isPaired && home.partnerMood?.isVisible == true) ...[
          const SizedBox(height: AppSpace.s12),
          PartnerMoodHint(
            partnerMood: home.partnerMood!,
            partnerName: home.partnerName,
            isDiscreet: isDiscreet,
            onTap: () => context.pushRoute(const BadDayRoute()),
          ),
        ],
        if (!isFirstDay && !home.hasPendingInvite) ...[
          const SizedBox(height: AppSpace.s24),
          MoodRow(
            title: context.l10n.mood.entryTitle,
            supportText: context.l10n.mood.entryText,
            options: [
              for (final mood in MoodKind.values)
                MoodRowOption(
                  face: mood.face,
                  label: context.l10n.mood.moods.selectOrFallback(mood.value),
                ),
            ],
            onSelected: (index) async {
              await context.pushRoute(MoodRoute(initialMood: MoodKind.values[index].value));
              if (context.mounted) await context.read<TodayCubit>().load();
            },
          ),
        ],
        if (home.slipsThisWeek > 0) ...[
          const SizedBox(height: AppSpace.s12),
          BaseListCard(
            categoryLabel: l10n.sundayCardLabel,
            title: l10n.sundayCardTitle,
            supportText: context.l10n.sundayCard.openFromToday,
            onTap: () => context.pushRoute(const SundayCardRoute()),
          ),
        ],
        if (isAlone && !home.hasPendingInvite) ...[
          const SizedBox(height: AppSpace.s12),
          BaseListCard(
            categoryLabel: l10n.inviteCardLabel,
            category: AppCategory.invite,
            title: partnerHint == null
                ? l10n.inviteCardTitleNoName
                : l10n.inviteCardTitle(name: partnerHint!),
            supportText: l10n.inviteCardText,
            onTap: () => context.pushRoute(const InviteRoute()),
          ),
        ],
        if (idea != null) ...[
          const SizedBox(height: AppSpace.s24),
          BaseSectionHeader(title: l10n.forToday),
          const SizedBox(height: AppSpace.s10),
          BaseListCard(
            categoryLabel: l10n.ideaLabel,
            category: AppCategory.idea,
            title: idea.title,
            supportText: idea.body,
            face: FaceKind.smile,
            onTap: () => context.pushRoute(IdeaDetailRoute(slug: idea.slug)),
          ),
        ],
      ],
    );
  }
}

class const _MainCard({required final TodayHome home, required final bool isFirstDay})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.today;
    void openCapture() => context.router.root.push(const QuickSlipRoute());

    if (isFirstDay) {
      return BaseFeatureCard(
        tag: l10n.firstDayTag,
        question: l10n.firstDayTitle(count: home.slipsTotal),
        highlightedWord: l10n.firstDayHighlight(count: home.slipsTotal),
        supportText: l10n.firstDayText,
        actionText: l10n.firstDayAction,
        onAction: openCapture,
      );
    }
    if (!home.isPaired) {
      return BaseFeatureCard(
        tag: l10n.privateTag,
        question: l10n.privateQuestion,
        highlightedWord: l10n.privateHighlight,
        face: FaceKind.thinking,
        actionText: l10n.privateAction,
        onAction: openCapture,
      );
    }
    if (home.slipsThisWeek == 0) {
      return BaseFeatureCard(
        tag: l10n.emptyWeekTag,
        question: l10n.emptyWeekQuestion,
        highlightedWord: l10n.emptyWeekHighlight,
        face: FaceKind.thinking,
        actionText: l10n.emptyWeekAction,
        onAction: openCapture,
      );
    }
    final question = home.question;
    if (question == null) return const SizedBox.shrink();

    return BaseFeatureCard(
      tag: question.tags.isEmpty ? l10n.forToday : question.tags.first,
      question: question.title,
      highlightedWord: _longestWord(question.title),
      actionText: l10n.answer,
      onAction: openCapture,
    );
  }

  String _longestWord(String text) {
    final words = text.replaceAll(RegExp('[?.!,]'), '').split(' ');

    return words.reduce((a, b) => b.length > a.length ? b : a);
  }
}
