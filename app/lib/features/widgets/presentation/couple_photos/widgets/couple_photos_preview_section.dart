import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/shared/widget_surface_preview.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

class const CouplePhotosPreviewSection({
  required final WidgetPayload payload,
  required final bool isDarkPreview,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;
    final now = DateTime.now();
    final breakdown = payload.durationBreakdownOn(now);

    final durationTitle = switch ((payload.discreet, breakdown)) {
      (true, _) => l10n.discreetReminderLabel,
      (false, final b?) when b.years > 0 => l10n.counterYearsMonthsTitle(
        years: b.years,
        months: b.months,
      ),
      (false, final b?) => l10n.coupleCounterDays(count: b.totalDays),
      (false, null) => l10n.couplePhotosNeutral,
    };

    final hasValidCachedPhoto =
        !payload.discreet &&
        payload.hasPlus &&
        payload.cachedPhotoPath != null &&
        File(payload.cachedPhotoPath!).existsSync();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (hasValidCachedPhoto) ...[
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(AppRadius.xxl)),
            child: Image.file(File(payload.cachedPhotoPath!), height: 180, fit: BoxFit.cover),
          ),
          const SizedBox(height: AppSpace.s12),
        ],
        WidgetSurfacePreview(
          categoryLabel: l10n.couplePhotosLabel,
          title: durationTitle,
          subtitle: payload.discreet ? l10n.discreetNeutralBody : l10n.ownIdeaHint,
          badgeText: l10n.photosPlusBadge,
          isDark: isDarkPreview,
          deepLinkUri: Uri.parse('repara://today'),
        ),
        const SizedBox(height: AppSpace.s12),
        BaseNote(text: l10n.photosNeutralFallbackNote, icon: AppIcons.info),
        if (!payload.hasPlus) ...[
          const SizedBox(height: AppSpace.s12),
          BaseButton(
            text: l10n.photosUnlockPlusAction,
            variant: BaseButtonVariant.secondary,
            onPressed: () => context.pushRoute(const PlansRoute()),
          ),
        ],
      ],
    );
  }
}
