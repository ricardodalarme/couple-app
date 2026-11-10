import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/relationship/cubit/relationship_settings_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_details.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class const RelationshipPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<RelationshipSettingsCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.relationshipSettings;
    final details = context.select((RelationshipSettingsCubit cubit) => cubit.state.details);

    return BaseView(
      appBar: BaseAppBar(title: l10n.title),
      body: BlocListener<RelationshipSettingsCubit, RelationshipSettingsState>(
        listenWhen: (previous, current) => previous.saveAction != current.saveAction,
        listener: _onSaveChanged,
        child: SkeletonizerResourceWidget<RelationshipDetails>(
          details,
          fakeValue: RelationshipDetails.fake(),
          successBuilder: (_) => const _RelationshipForm(),
          failureBuilder: (_) => BaseEmptyState(
            title: l10n.loadErrorTitle,
            text: l10n.loadErrorText,
            actionText: context.l10n.common.retry,
            onAction: context.read<RelationshipSettingsCubit>().load,
          ),
        ),
      ),
    );
  }

  void _onSaveChanged(BuildContext context, RelationshipSettingsState state) {
    final l10n = context.l10n.relationshipSettings;

    switch (state.saveAction) {
      case Success():
        BaseToast.show(context, l10n.saved);
      case Failure(:final exception):
        BaseToast.show(context, l10n.errors.selectOrFallback(exception.l10nKey));
      default:
        break;
    }
  }
}

class const _RelationshipForm() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.relationshipSettings;
    final unpairL10n = context.l10n.unpair;
    final cubit = context.read<RelationshipSettingsCubit>();
    final phase = context.select((RelationshipSettingsCubit cubit) => cubit.state.current?.phase);
    final togetherSince = context.select(
      (RelationshipSettingsCubit cubit) => cubit.state.current?.togetherSince,
    );
    final partnerName = context.select(
      (RelationshipSettingsCubit cubit) => cubit.state.current?.partnerName,
    );
    final hasPartner = context.select((RelationshipSettingsCubit cubit) => cubit.state.hasPartner);
    final partnerLoadFailed = context.select(
      (RelationshipSettingsCubit cubit) => cubit.state.partnerLoadFailed,
    );
    final partnerDisplayName = partnerName == null || partnerName.isEmpty
        ? unpairL10n.unnamedPartner
        : partnerName;

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (partnerLoadFailed) ...[
            BaseBanner(
              text: l10n.partnerError,
              actionLabel: l10n.partnerRetry,
              variant: BaseBannerVariant.warning,
              onAction: cubit.loadPartner,
            ),
            const SizedBox(height: AppSpace.s16),
          ],
          BaseSelect<RelationshipPhase>(
            label: l10n.phaseLabel,
            placeholder: l10n.phasePlaceholder,
            value: phase,
            options: [
              for (final value in RelationshipPhase.values)
                BaseSelectOption(
                  value: value,
                  label: l10n.phases[value.serverValue] ?? value.serverValue,
                ),
            ],
            onChanged: cubit.onPhaseChanged,
          ),
          const SizedBox(height: AppSpace.s14),
          BaseDateField(
            label: l10n.dateLabel,
            hint: l10n.dateHint,
            value: togetherSince,
            formatter: (value) => l10n.dateFormat(
              day: value.day,
              month: l10n.months[value.month - 1],
              year: value.year,
            ),
            onChanged: cubit.onDateChanged,
          ),
          if (togetherSince != null && togetherSince.isAfter(DateTime.now())) ...[
            const SizedBox(height: AppSpace.s8),
            BaseNote(text: l10n.futureDateNote, icon: AppIcons.calendar),
          ],
          const SizedBox(height: AppSpace.s18),
          if (hasPartner != null)
            BaseListGroup(
              children: [
                BaseListTile(
                  title: l10n.partnerLabel,
                  value: hasPartner ? partnerDisplayName : l10n.invitePartner,
                  icon: AppIcons.user,
                  showsChevron: !hasPartner,
                  onTap: hasPartner ? null : () => context.pushRoute(const InviteRoute()),
                ),
              ],
            ),
          const SizedBox(height: AppSpace.s14),
          BaseNote(text: l10n.phaseNote, icon: AppIcons.heart),
          const SizedBox(height: AppSpace.s20),
          BaseListGroup(
            children: [
              BaseListTile(
                title: l10n.changedPrompt,
                subtitle: l10n.changedSubtitle,
                icon: AppIcons.heart,
                showsChevron: true,
                onTap: () => context.pushRoute(const RelationshipChangedRoute()),
              ),
            ],
          ),
          if (hasPartner ?? false) ...[
            const SizedBox(height: AppSpace.s20),
            BaseListGroup(
              children: [
                BaseListTile(
                  title: unpairL10n.relationship.unpair(name: partnerDisplayName),
                  isDestructive: true,
                  showsChevron: true,
                  onTap: () => context.pushRoute(const UnpairRoute()),
                ),
                BaseListTile(
                  title: unpairL10n.relationship.ended,
                  showsChevron: true,
                  onTap: () => context.pushRoute(const BreakupRoute()),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
