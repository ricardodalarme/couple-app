import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/off_banner/widgets/notifications_off_banner.dart';
import 'package:flutter_bloc_starter/features/today/data/models/today_home.dart';
import 'package:flutter_bloc_starter/features/today/presentation/today/widgets/today_header.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The body of Hoje: banners, the question, the week so far and today's idea.
class const TodayContent({
  required final TodayHome home,
  required final bool isOffline,
  final String? selfName,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.today;
    final question = home.question;
    final idea = home.idea;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TodayHeader(home: home, selfName: selfName),
        const SizedBox(height: AppSpace.s20),
        if (isOffline) ...[
          BaseBanner(text: l10n.offline, icon: AppIcons.wifi_off),
          const SizedBox(height: AppSpace.s12),
        ],
        const NotificationsOffBanner(),
        if (home.hasPendingInvite) ...[
          BaseBanner(
            title: l10n.pendingInviteTitle,
            text: l10n.pendingInviteText,
            actionLabel: l10n.pendingInviteAction,
            onAction: () => context.pushRoute(const InviteRoute()),
          ),
          const SizedBox(height: AppSpace.s12),
        ],
        if (question != null) ...[
          BaseFeatureCard(
            tag: question.tags.isEmpty ? l10n.forToday : question.tags.first,
            question: question.title,
            highlightedWord: _longestWord(question.title),
            actionText: l10n.answer,
            onAction: () => context.router.root.push(const QuickSlipRoute()),
          ),
          const SizedBox(height: AppSpace.s16),
        ],
        BaseSurfaceCard(
          title: l10n.slipsThisWeek(count: home.slipsThisWeek),
          supportText: home.slipsThisWeek == 0 ? l10n.weekHintEmpty : l10n.weekHint,
        ),
        if (idea != null) ...[
          const SizedBox(height: AppSpace.s24),
          BaseSectionHeader(title: l10n.forToday),
          const SizedBox(height: AppSpace.s10),
          BaseListCard(
            categoryLabel: l10n.ideaLabel,
            title: idea.title,
            supportText: idea.body,
            face: FaceKind.smile,
          ),
        ],
      ],
    );
  }

  String _longestWord(String text) {
    final words = text.replaceAll(RegExp('[?.!,]'), '').split(' ');

    return words.reduce((a, b) => b.length > a.length ? b : a);
  }
}
