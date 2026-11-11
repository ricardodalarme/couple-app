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
    final now = DateTime.now();

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
          const SizedBox(height: AppSpace.s12),
          BaseListCard(
            categoryLabel: l10n.lockScreenLabel,
            title: payload.isPauseActiveOn(now) ? l10n.cardStatePause : l10n.lockScreenDefault,
            supportText: l10n.ownIdeaHint,
            onTap: () => onSelectFamily(WidgetFamilyKind.lockScreen),
          ),
        ],
      );
    }

    final daysTogether = payload.daysTogetherOn(now);
    final counterTitle = switch ((payload.discreet, daysTogether)) {
      (true, _) => l10n.lockScreenDefault,
      (false, final count?) => l10n.coupleCounterDays(count: count),
      (false, null) => l10n.coupleCounterUnset,
    };

    final noteFrom = switch (payload.partnerName) {
      final name? when name.isNotEmpty => l10n.partnerNoteFrom(name: name),
      _ => l10n.partnerNoteFromDefault,
    };
    final noteTitle = payload.discreet
        ? l10n.lockScreenDefault
        : (payload.partnerNote ?? l10n.partnerNoteEmpty);

    final cardText = switch (payload.cardState) {
      'pause' => l10n.cardStatePause,
      'ready' => l10n.cardStateReady,
      'sent' => l10n.cardStateSent,
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
          title: payload.discreet ? l10n.lockScreenDefault : l10n.couplePhotosNeutral,
          supportText: payload.hasPlus ? l10n.ownIdeaHint : l10n.couplePhotosPlusHint,
          onTap: () => onSelectFamily(WidgetFamilyKind.couplePhotos),
        ),
        const SizedBox(height: AppSpace.s12),
        BaseListCard(
          categoryLabel: l10n.partnerNoteLabel,
          title: noteTitle,
          supportText: payload.partnerNote != null ? noteFrom : l10n.ownIdeaHint,
          onTap: () => onSelectFamily(WidgetFamilyKind.partnerNote),
        ),
        const SizedBox(height: AppSpace.s12),
        BaseListCard(
          categoryLabel: l10n.cardEncounterLabel,
          title: payload.discreet ? l10n.lockScreenDefault : cardText,
          supportText: payload.nextDateTitle ?? l10n.ownIdeaHint,
          onTap: () => onSelectFamily(WidgetFamilyKind.cardEncounter),
        ),
      ],
    );
  }
}
