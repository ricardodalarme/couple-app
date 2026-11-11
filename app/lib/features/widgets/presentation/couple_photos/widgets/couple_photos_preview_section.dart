import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/shared/widget_surface_preview.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

class const CouplePhotosPreviewSection({
  required final WidgetPayload payload,
  required final bool isDarkPreview,
  final Uint8List? localPreview,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;
    if (!payload.isSignedIn) {
      return WidgetSurfacePreview(
        categoryLabel: l10n.signedOutLabel,
        title: l10n.signedOutBody,
        subtitle: l10n.ownIdeaHint,
        isDark: isDarkPreview,
        deepLinkUri: Uri.parse('repara://sign-in'),
      );
    }

    if (payload.discreet) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WidgetSurfacePreview(
            categoryLabel: l10n.couplePhotosLabel,
            title: l10n.discreetReminderLabel,
            subtitle: l10n.discreetNeutralBody,
            isDark: isDarkPreview,
            deepLinkUri: Uri.parse('repara://settings/discreet'),
          ),
          const SizedBox(height: AppSpace.s12),
          BaseNote(text: l10n.photosNeutralFallbackNote, icon: AppIcons.info),
        ],
      );
    }

    if (!payload.isPaired) {
      return WidgetSurfacePreview(
        categoryLabel: l10n.couplePhotosLabel,
        title: l10n.statesUnpairedTitle,
        subtitle: l10n.unpairedBanner,
        badgeText: l10n.statesUnpairedAction,
        isDark: isDarkPreview,
        onTapOverride: () => context.pushRoute(const InviteRoute()),
      );
    }

    final now = DateTime.now();
    final breakdown = payload.durationBreakdownOn(now);

    final durationTitle = switch ((payload.discreet, breakdown)) {
      (true, _) => l10n.discreetReminderLabel,
      (false, final b?) when b.years > 0 => l10n.counterYearsMonthsTitle(
        years: b.years,
        months: b.months,
      ),
      (false, final b?) => l10n.coupleCounterDays(count: b.totalDays),
      (false, null) => l10n.couplePhotosPrompt,
    };

    final hasValidCachedPhoto =
        !payload.discreet &&
        payload.hasPlus &&
        payload.cachedPhotoPath != null &&
        File(payload.cachedPhotoPath!).existsSync();
    final previewPhoto = switch ((localPreview, hasValidCachedPhoto)) {
      (final Uint8List bytes, _) => Image.memory(bytes, height: 180, fit: BoxFit.cover),
      (null, true) => Image.file(File(payload.cachedPhotoPath!), height: 180, fit: BoxFit.cover),
      _ => null,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (previewPhoto != null) ...[
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(AppRadius.xxl)),
            child: previewPhoto,
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
