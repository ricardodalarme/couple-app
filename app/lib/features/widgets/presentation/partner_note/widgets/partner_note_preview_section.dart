import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/shared/widget_surface_preview.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

class const PartnerNotePreviewSection({
  required final WidgetPayload payload,
  required final bool isDarkPreview,
  required final ValueChanged<bool> onToggleAllowNotes,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;

    if (payload.discreet) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WidgetSurfacePreview(
            isDark: isDarkPreview,
            categoryLabel: l10n.discreetReminderLabel,
            title: l10n.discreetNeutralBody,
            subtitle: l10n.lockScreenPrivacyRule,
            onTapOverride: () => context.pushRoute(const DiscreetModeRoute()),
          ),
          const SizedBox(height: AppSpace.s12),
          BaseNote(text: l10n.discreetBanner, icon: AppIcons.eye_off),
        ],
      );
    }

    if (!payload.isPaired) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WidgetSurfacePreview(
            isDark: isDarkPreview,
            categoryLabel: l10n.partnerNoteLabel,
            title: l10n.unpairedBanner,
            subtitle: l10n.ownIdeaHint,
            onTapOverride: () => context.pushRoute(const InviteRoute()),
          ),
        ],
      );
    }

    final fromLabel = payload.showNames && (payload.partnerName?.isNotEmpty ?? false)
        ? l10n.partnerNoteFrom(name: payload.partnerName!)
        : l10n.partnerNoteFromDefault;
    final noteText = payload.allowPartnerNotes && (payload.partnerNote?.isNotEmpty ?? false)
        ? payload.partnerNote!
        : l10n.partnerNoteEmpty;
    final noteTime = _formatNoteTime(payload.partnerNoteAt);
    final mediumLabel = noteTime != null ? '$fromLabel · $noteTime' : fromLabel;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: WidgetSurfacePreview(
                isDark: isDarkPreview,
                categoryLabel: fromLabel,
                title: noteText,
                subtitle: l10n.ownIdeaHint,
                onTapOverride: () => context.pushRoute(const TodayRoute()),
              ),
            ),
            const SizedBox(width: AppSpace.s12),
            Expanded(
              child: WidgetSurfacePreview(
                isDark: isDarkPreview,
                categoryLabel: fromLabel,
                title: payload.partnerNoteMedia != null
                    ? l10n.partnerNoteDrawingPlaceholder
                    : noteText,
                subtitle: l10n.partnerNoteDrawingPlaceholder,
                onTapOverride: () => context.pushRoute(const TodayRoute()),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpace.s20),
        Text(
          l10n.partnerNoteMediumSection,
          style: context.text.caption.copyWith(color: context.colors.textSecondary),
        ),
        const SizedBox(height: AppSpace.s8),
        WidgetSurfacePreview(
          isDark: isDarkPreview,
          categoryLabel: mediumLabel,
          title: noteText,
          subtitle: payload.partnerNote != null ? l10n.partnerNoteReplyHint : l10n.ownIdeaHint,
          onTapOverride: () => context.pushRoute(const TodayRoute()),
        ),
        const SizedBox(height: AppSpace.s16),
        BaseListGroup(
          children: [
            BaseListTile(
              title: l10n.configureAllowPartnerNotes,
              control: BaseSwitch(
                value: payload.allowPartnerNotes,
                semanticLabel: l10n.configureAllowPartnerNotes,
                onChanged: onToggleAllowNotes,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpace.s12),
        BaseNote(
          text: payload.allowPartnerNotes ? l10n.partnerNoteSafeNote : l10n.partnerNoteDisabledNote,
          icon: AppIcons.heart,
        ),
      ],
    );
  }

  String? _formatNoteTime(String? rawIso) {
    if (rawIso == null || rawIso.isEmpty) return null;
    final parsed = DateTime.tryParse(rawIso)?.toLocal();
    if (parsed == null) return null;
    final hh = parsed.hour.toString().padLeft(2, '0');
    final mm = parsed.minute.toString().padLeft(2, '0');
    return '$hh:$mm';
  }
}
