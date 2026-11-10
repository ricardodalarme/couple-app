import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile_details.dart';
import 'package:flutter_bloc_starter/features/profile/presentation/profile/cubit/profile_settings_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/presentation/widgets/profile_theme_picker.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const ProfileSettingsPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<ProfileSettingsCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.profileDetails;
    final details = context.select((ProfileSettingsCubit cubit) => cubit.state.details);

    return BaseView(
      appBar: BaseAppBar(title: l10n.title),
      body: BlocListener<ProfileSettingsCubit, ProfileSettingsState>(
        listenWhen: (previous, current) => previous.details != current.details,
        listener: (context, state) {
          final details = state.current;
          if (details != null) AppThemeScope.set(context, details.theme);
        },
        child: BlocListener<ProfileSettingsCubit, ProfileSettingsState>(
          listenWhen: (previous, current) => previous.saveAction != current.saveAction,
          listener: _onSaveChanged,
          child: SkeletonizerResourceWidget<ProfileDetails>(
            details,
            fakeValue: const ProfileDetails.fake(),
            successBuilder: (_) => const _ProfileForm(),
            failureBuilder: (_) => BaseEmptyState(
              title: l10n.loadErrorTitle,
              text: l10n.loadErrorText,
              actionText: context.l10n.common.retry,
              onAction: context.read<ProfileSettingsCubit>().load,
            ),
          ),
        ),
      ),
    );
  }

  void _onSaveChanged(BuildContext context, ProfileSettingsState state) {
    final l10n = context.l10n.profileDetails;

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

class const _ProfileForm() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.profileDetails;
    final cubit = context.read<ProfileSettingsCubit>();
    final name = context.select(
      (ProfileSettingsCubit cubit) =>
          cubit.state.nameDraft ?? cubit.state.current?.displayName ?? '',
    );
    final pronouns = context.select(
      (ProfileSettingsCubit cubit) =>
          cubit.state.pronounsDraft ?? cubit.state.current?.pronouns ?? '',
    );
    final timeZone = context.select((ProfileSettingsCubit cubit) => cubit.state.current?.timeZone);
    final theme = context.select((ProfileSettingsCubit cubit) => cubit.state.current?.theme);
    final hasNameError = context.select((ProfileSettingsCubit cubit) => cubit.state.hasNameError);
    final hasPronounsError = context.select(
      (ProfileSettingsCubit cubit) => cubit.state.hasPronounsError,
    );
    final loginProvider = context.select((ProfileSettingsCubit cubit) => cubit.state.loginProvider);

    final zones = [...l10n.timeZones.keys];
    if (timeZone != null && !zones.contains(timeZone)) zones.add(timeZone);

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseTextField(
            label: l10n.nameLabel,
            hint: l10n.nameHint,
            text: name,
            errorText: hasNameError ? l10n.nameError : null,
            onChanged: cubit.onNameChanged,
            onSubmitted: (_) => cubit.saveName(),
          ),
          const SizedBox(height: AppSpace.s14),
          BaseTextField(
            label: l10n.pronounsLabel,
            hint: l10n.pronounsHint,
            text: pronouns,
            errorText: hasPronounsError ? l10n.pronounsError : null,
            onChanged: cubit.onPronounsChanged,
            onSubmitted: (_) => cubit.savePronouns(),
          ),
          const SizedBox(height: AppSpace.s14),
          BaseSelect<String>(
            label: l10n.timeZoneLabel,
            placeholder: l10n.timeZonePlaceholder,
            value: timeZone,
            options: [
              for (final zone in zones)
                BaseSelectOption(value: zone, label: l10n.timeZones[zone] ?? zone),
            ],
            onChanged: cubit.onTimeZoneChanged,
          ),
          const SizedBox(height: AppSpace.s18),
          ProfileThemePicker(
            selected: theme ?? AppThemeVariant.rose,
            onChanged: (variant) {
              AppThemeScope.set(context, variant);
              cubit.onThemeChanged(variant);
            },
          ),
          const SizedBox(height: AppSpace.s18),
          BaseListGroup(
            children: [
              BaseListTile(
                title: l10n.loginLabel,
                value: _loginLabel(context, loginProvider),
                icon: AppIcons.lock,
              ),
            ],
          ),
          const SizedBox(height: AppSpace.s14),
          BaseNote(text: l10n.photoNote, icon: AppIcons.image),
        ],
      ),
    );
  }

  String _loginLabel(BuildContext context, String? provider) {
    final l10n = context.l10n.profileDetails;

    return switch (provider) {
      'apple' => l10n.loginApple,
      'google' => l10n.loginGoogle,
      'email' => l10n.loginEmail,
      _ => l10n.loginAccount,
    };
  }
}
