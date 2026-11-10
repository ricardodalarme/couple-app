import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/dev_menu_page.dart';
import 'package:flutter_bloc_starter/features/today/data/models/today_home.dart';
import 'package:flutter_bloc_starter/infrastructure/config/env_variables.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

const double _chipHeight = 40;
const double _chipDot = 30;

/// Avatars or the invite chip, the time-together chip, then the greeting and the date.
class const TodayHeader({required final TodayHome home, final String? selfName, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.today;
    final now = DateTime.now();
    final name = selfName;
    final greeting = name == null
        ? l10n.greetingNoName
        : switch (now.hour) {
            < 12 => l10n.greetingMorning(name: name),
            < 18 => l10n.greetingAfternoon(name: name),
            _ => l10n.greetingEvening(name: name),
          };
    final dateLine = l10n.dateLine(
      weekday: l10n.weekdays[now.weekday - 1],
      day: now.day,
      month: l10n.months[now.month - 1],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (home.isPaired) BaseAvatarPair(
                    selfInitials: _initial(name),
                    partnerInitials: _initial(home.partnerName),
                  ) else BaseAvatarPair(
                    selfInitials: _initial(name),
                    onTap: () => context.pushRoute(const InviteRoute()),
                    semanticLabel: l10n.invitePerson,
                  ),
            if (home.togetherSince != null) _TogetherChip(since: home.togetherSince!),
          ],
        ),
        const SizedBox(height: AppSpace.s24),
        GestureDetector(
          onLongPress: EnvVariables.debugSignIn
              ? () => context.router.pushWidget(const DevMenuPage())
              : null,
          child: Semantics(header: true, child: Text(greeting, style: context.text.titleXl)),
        ),
        const SizedBox(height: AppSpace.s4),
        Text(dateLine, style: context.text.body.copyWith(color: context.colors.textSecondary)),
      ],
    );
  }

  String _initial(String? name) =>
      name == null || name.isEmpty ? '' : name.substring(0, 1).toUpperCase();
}

class const _TogetherChip({required final DateTime since}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n.today;

    return Container(
      height: _chipHeight,
      padding: const EdgeInsets.only(left: AppSpace.s4, right: AppSpace.s14),
      decoration: BoxDecoration(
        color: colors.bgSurface,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: colors.borderDefault),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: _chipDot,
            height: _chipDot,
            decoration: BoxDecoration(color: colors.accentSoft, shape: BoxShape.circle),
            child: Icon(AppIcons.heart_filled, size: AppIconSize.xs, color: colors.accentHighlight),
          ),
          const SizedBox(width: AppSpace.s8),
          Text(_label(l10n, since), style: context.text.label.copyWith(color: colors.textPrimary)),
        ],
      ),
    );
  }

  String _label(Translations$today$pt l10n, DateTime since) {
    final now = DateTime.now();
    final months =
        (now.year - since.year) * 12 + now.month - since.month - (now.day < since.day ? 1 : 0);
    if (months < 1) return l10n.togetherDays(count: now.difference(since).inDays.clamp(0, 31));

    final years = months ~/ 12;
    final rest = months % 12;
    if (years == 0) return l10n.togetherMonths(count: rest);
    if (rest == 0) return l10n.togetherYears(count: years);

    return l10n.togetherJoin(
      first: l10n.togetherYears(count: years),
      second: l10n.togetherMonths(count: rest),
    );
  }
}
