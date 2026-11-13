import 'package:clock/clock.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/configure/cubit/widget_configure_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const ConfigureFormSection({
  required final WidgetPayload payload,
  final WidgetFamilyKind? initialFamily,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;
    final draft = context.select((WidgetConfigureCubit cubit) => cubit.state.draft);
    final cubit = context.read<WidgetConfigureCubit>();

    final previewPayload = payload
        .copyWith(
          showNames: draft.showNames,
          discreet: draft.hideInDiscreet && payload.discreet,
          allowPartnerNotes: draft.allowPartnerNotes,
          onLockScreen: draft.onLockScreen,
        )
        .sanitized();

    final daysCount = previewPayload.daysTogetherOn(clock.now());
    final previewTitle = switch ((previewPayload.discreet, initialFamily, daysCount)) {
      (true, _, _) => l10n.lockScreenDefault,
      (false, WidgetFamilyKind.partnerNote, _) =>
        previewPayload.partnerNote ?? l10n.partnerNoteEmpty,
      (false, _, final count?) => l10n.coupleCounterDays(count: count),
      (false, _, null) => l10n.couplePhotosPrompt,
    };

    final previewSubtitle = switch (previewPayload.partnerName) {
      final name? when name.isNotEmpty => l10n.partnerNoteFrom(name: name),
      _ => l10n.ownIdeaHint,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseListCard(
          categoryLabel: l10n.configurePreviewLabel,
          title: previewTitle,
          supportText: previewSubtitle,
        ),
        const SizedBox(height: AppSpace.s20),
        Text(l10n.configureContentSection, style: context.text.titleSm),
        const SizedBox(height: AppSpace.s8),
        BaseSegmented(
          segments: [
            l10n.configureContentFavorites,
            l10n.configureContentRecent,
            l10n.configureContentDailyIdea,
          ],
          selectedIndex: draft.contentSource.index,
          onSelectionChanged: (index) => cubit.setContentSource(WidgetContentSource.values[index]),
        ),
        const SizedBox(height: AppSpace.s16),
        Text(l10n.configureRotationSection, style: context.text.titleSm),
        const SizedBox(height: AppSpace.s8),
        BaseSegmented(
          segments: [
            l10n.configureRotationDaily,
            l10n.configureRotationSixHours,
            l10n.configureRotationManual,
          ],
          selectedIndex: draft.rotationCadence.index,
          onSelectionChanged: (index) =>
              cubit.setRotationCadence(WidgetRotationCadence.values[index]),
        ),
        const SizedBox(height: AppSpace.s20),
        Text(l10n.configurePrivacySection, style: context.text.titleSm),
        const SizedBox(height: AppSpace.s8),
        BaseListGroup(
          children: [
            BaseListTile(
              title: l10n.configureShowNames,
              control: BaseSwitch(
                value: draft.showNames,
                semanticLabel: l10n.configureShowNames,
                onChanged: (value) => cubit.setShowNames(value: value),
              ),
            ),
            BaseListTile(
              title: l10n.configureHideInDiscreet,
              control: BaseSwitch(
                value: draft.hideInDiscreet,
                semanticLabel: l10n.configureHideInDiscreet,
                onChanged: (value) => cubit.setHideInDiscreet(value: value),
              ),
            ),
            BaseListTile(
              title: l10n.configureAllowPartnerNotes,
              control: BaseSwitch(
                value: draft.allowPartnerNotes,
                semanticLabel: l10n.configureAllowPartnerNotes,
                onChanged: (value) => cubit.setAllowPartnerNotes(value: value),
              ),
            ),
            BaseListTile(
              title: l10n.configureOnLockScreen,
              control: BaseSwitch(
                value: draft.onLockScreen,
                semanticLabel: l10n.configureOnLockScreen,
                onChanged: (value) => cubit.setOnLockScreen(value: value),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
