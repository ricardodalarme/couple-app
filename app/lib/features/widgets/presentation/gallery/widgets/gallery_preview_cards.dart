import 'dart:io';

import 'package:clock/clock.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Live preview cards shown inside the widgets gallery (`X-145`).
class const GalleryPreviewSection({
  required final WidgetGallerySegment segment,
  required final WidgetPayload payload,
  required final ValueChanged<WidgetFamilyKind> onSelectFamily,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;
    final now = clock.now();

    if (segment == WidgetGallerySegment.own) {
      final ideaTitle = payload.discreet
          ? l10n.lockScreenDefault
          : (payload.dailyIdeaTitle ?? l10n.ownIdeaDefault);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseListCard(
            categoryLabel: l10n.ownSlipLabel,
            title: l10n.ownSlipTitle,
            supportText: l10n.ownSlipSubtitle,
            onTap: () => onSelectFamily(WidgetFamilyKind.ownSmall),
          ),
          const SizedBox(height: AppSpace.s12),
          BaseListCard(
            categoryLabel: l10n.ownIdeaLabel,
            title: ideaTitle,
            supportText: l10n.ownIdeaHint,
            onTap: () => onSelectFamily(WidgetFamilyKind.ownMedium),
          ),
          const SizedBox(height: AppSpace.s12),
          BaseListCard(
            categoryLabel: l10n.ownJarLabel,
            title: l10n.ownJarTitle,
            supportText: l10n.ownJarPrivacy,
            onTap: () => onSelectFamily(WidgetFamilyKind.ownMedium),
          ),
          if (!Platform.isAndroid) ...[
            const SizedBox(height: AppSpace.s12),
            BaseListCard(
              categoryLabel: l10n.lockScreenLabel,
              title: l10n.lockScreenDefault,
              supportText: payload.onLockScreen ? l10n.ownIdeaHint : l10n.lockScreenDisabledNote,
              onTap: () => onSelectFamily(WidgetFamilyKind.lockScreen),
            ),
          ],
        ],
      );
    }

    final daysTogether = payload.daysTogetherOn(now);
    final counterTitle = switch ((payload.discreet, payload.isPaired, daysTogether)) {
      (true, _, _) => l10n.lockScreenDefault,
      (false, false, _) => l10n.statesUnpairedTitle,
      (false, true, final count?) => l10n.coupleCounterDays(count: count),
      (false, true, null) => l10n.coupleCounterUnset,
    };
    final photosTitle = switch ((payload.discreet, payload.isPaired, daysTogether)) {
      (true, _, _) => l10n.lockScreenDefault,
      (false, false, _) => l10n.statesUnpairedTitle,
      (false, true, final count?) => l10n.coupleCounterDays(count: count),
      (false, true, null) => l10n.couplePhotosPrompt,
    };

    final noteFrom = switch ((payload.showNames, payload.partnerName)) {
      (true, final name?) when name.isNotEmpty => l10n.partnerNoteFrom(name: name),
      _ => l10n.partnerNoteFromDefault,
    };
    final noteTitle = switch ((payload.discreet, payload.isPaired, payload.allowPartnerNotes)) {
      (true, _, _) => l10n.lockScreenDefault,
      (false, false, _) => l10n.statesUnpairedTitle,
      (false, true, true) => payload.partnerNote ?? l10n.partnerNoteEmpty,
      (false, true, false) => l10n.partnerNoteEmpty,
    };

    final cardText = switch ((payload.discreet, payload.isPaired, payload.cardState)) {
      (true, _, _) => l10n.lockScreenDefault,
      (false, false, _) => l10n.statesUnpairedTitle,
      (false, true, 'pause') => l10n.cardStatePause,
      (false, true, 'ready') => l10n.cardStateReady,
      (false, true, 'sent') => l10n.cardStateSent,
      _ => l10n.cardStateNone,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseListCard(
          categoryLabel: l10n.coupleCounterLabel,
          title: counterTitle,
          supportText: l10n.ownIdeaHint,
          onTap: () => onSelectFamily(WidgetFamilyKind.coupleCounter),
        ),
        const SizedBox(height: AppSpace.s12),
        BaseListCard(
          categoryLabel: l10n.couplePhotosLabel,
          title: photosTitle,
          supportText: payload.hasPlus ? l10n.ownIdeaHint : l10n.couplePhotosPlusHint,
          onTap: () => onSelectFamily(WidgetFamilyKind.couplePhotos),
        ),
        const SizedBox(height: AppSpace.s12),
        BaseListCard(
          categoryLabel: l10n.partnerNoteLabel,
          title: noteTitle,
          supportText: (!payload.discreet && payload.isPaired && payload.partnerNote != null)
              ? noteFrom
              : l10n.ownIdeaHint,
          onTap: () => onSelectFamily(WidgetFamilyKind.partnerNote),
        ),
        const SizedBox(height: AppSpace.s12),
        BaseListCard(
          categoryLabel: l10n.cardEncounterLabel,
          title: cardText,
          supportText: (!payload.discreet && payload.isPaired && payload.nextDateTitle != null)
              ? payload.nextDateTitle!
              : l10n.ownIdeaHint,
          onTap: () => onSelectFamily(WidgetFamilyKind.cardEncounter),
        ),
      ],
    );
  }
}
