import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notifications/data/models/notification_preferences.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/preferences/cubit/notification_preferences_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const NotificationPreferencesContent({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.notificationPreferences;
    final isSystemOff = context.select(
      (NotificationPreferencesCubit cubit) => cubit.state.isSystemOff,
    );

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(header: true, child: Text(l10n.title, style: context.text.titleXl)),
          const SizedBox(height: AppSpace.s8),
          Text(
            l10n.subtitle,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s20),
          if (isSystemOff) ...[const _SystemOffBanner(), const SizedBox(height: AppSpace.s16)],
          const _MasterSwitch(),
          const SizedBox(height: AppSpace.s20),
          const _Types(),
          const SizedBox(height: AppSpace.s20),
          const _SundayCard(),
          const SizedBox(height: AppSpace.s20),
          const _Preview(),
        ],
      ),
    );
  }
}

class const _SystemOffBanner() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.notificationPreferences;

    return BaseBanner(
      text: l10n.systemOff,
      icon: AppIcons.bell_off,
      actionLabel: l10n.openSystem,
      onAction: context.read<NotificationPreferencesCubit>().openSystemSettings,
    );
  }
}

class const _MasterSwitch() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.notificationPreferences;
    final isEnabled = context.select(
      (NotificationPreferencesCubit cubit) => cubit.state.current?.isEnabled ?? true,
    );

    return BaseListGroup(
      children: [
        BaseListTile(
          title: l10n.all,
          subtitle: l10n.allText,
          control: BaseSwitch(
            value: isEnabled,
            semanticLabel: l10n.all,
            onChanged: (value) =>
                context.read<NotificationPreferencesCubit>().setEnabled(value: value),
          ),
        ),
      ],
    );
  }
}

class const _Types() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.notificationPreferences;
    final preferences = context.select((NotificationPreferencesCubit cubit) => cubit.state.current);
    if (preferences == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseSectionHeader(title: l10n.typesTitle),
        const SizedBox(height: AppSpace.s8),
        BaseListGroup(
          children: [
            for (final type in notificationTypes)
              BaseListTile(
                title: l10n.types.selectOrFallback(type),
                isEnabled: preferences.isEnabled,
                control: BaseSwitch(
                  value: preferences.allows(type),
                  semanticLabel: l10n.types.selectOrFallback(type),
                  onChanged: (value) => context.read<NotificationPreferencesCubit>().setTypeEnabled(
                    type,
                    value: value,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

List<BaseSelectOption<int>> _hourOptions(String Function(int hour) format) => [
  for (var hour = 0; hour < 24; hour++) BaseSelectOption(value: hour, label: format(hour)),
];

class const _SundayCard() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.notificationPreferences;
    final preferences = context.select((NotificationPreferencesCubit cubit) => cubit.state.current);
    if (preferences == null) return const SizedBox.shrink();

    final cubit = context.read<NotificationPreferencesCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseSectionHeader(title: l10n.cardTitle),
        const SizedBox(height: AppSpace.s12),
        BaseSelect<int>(
          label: l10n.cardDay,
          options: [
            for (var day = 0; day < l10n.days.length; day++)
              BaseSelectOption(value: day, label: l10n.days[day]),
          ],
          value: preferences.cardDay,
          onChanged: cubit.setCardDay,
        ),
        const SizedBox(height: AppSpace.s12),
        BaseSelect<int>(
          label: l10n.cardHour,
          options: _hourOptions((hour) => l10n.hourFormat(hour: hour.toString().padLeft(2, '0'))),
          value: preferences.cardHour,
          onChanged: cubit.setCardHour,
        ),
      ],
    );
  }
}

class const _Preview() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.notificationPreferences;
    final reminders = context.l10n.reminders;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseSectionHeader(title: l10n.previewTitle),
        const SizedBox(height: AppSpace.s8),
        DecoratedBox(
          decoration: BoxDecoration(
            color: context.colors.bgSurface,
            borderRadius: BorderRadius.circular(AppRadius.card),
            boxShadow: AppShadows.ring,
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpace.s16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(reminders.title, style: context.text.label),
                const SizedBox(height: AppSpace.s4),
                Text(reminders.weeklyCard, style: context.text.body),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpace.s8),
        Text(
          l10n.previewText,
          style: context.text.caption.copyWith(color: context.colors.textSecondary),
        ),
      ],
    );
  }
}
