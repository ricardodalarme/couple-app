import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/profile/presentation/setup/cubit/profile_setup_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class const ProfileSetupPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          AppInjector.instance.get<ProfileSetupCubit>()..onThemeChanged(AppThemeScope.of(context)),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.profileSetup;

    return BaseView(
      appBar: null,
      body: BlocListener<ProfileSetupCubit, ProfileSetupState>(
        listenWhen: (previous, current) => previous.saveAction != current.saveAction,
        listener: _onSaveChanged,
        child: BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppSpace.s24),
              Semantics(
                header: true,
                child: AppHighlightedText(
                  text: l10n.title,
                  highlight: l10n.titleHighlight,
                  style: context.text.display,
                ),
              ),
              const SizedBox(height: AppSpace.s8),
              Text(
                l10n.subtitle,
                style: context.text.body.copyWith(color: context.colors.textSecondary),
              ),
              const SizedBox(height: AppSpace.s28),
              const _NameField(),
              const SizedBox(height: AppSpace.s14),
              const _PartnerNameField(),
              const SizedBox(height: AppSpace.s14),
              const _ThemePicker(),
              const SizedBox(height: AppSpace.s14),
              const _DateField(),
              const SizedBox(height: AppSpace.s14),
              BaseNote(text: l10n.partnerNameNote),
            ],
          ),
          footer: const _ContinueButton(),
        ),
      ),
    );
  }

  void _onSaveChanged(BuildContext context, ProfileSetupState state) {
    switch (state.saveAction) {
      case Success():
        context.pushRoute(const PartnerStepRoute());
      case Failure(:final exception):
        BaseToast.show(
          context,
          context.l10n.profileSetup.errors.selectOrFallback(exception.l10nKey),
        );
      default:
        break;
    }
  }
}

class const _NameField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.profileSetup;

    return BaseTextField(
      label: l10n.nameLabel,
      hint: l10n.nameHint,
      onChanged: context.read<ProfileSetupCubit>().onNameChanged,
    );
  }
}

class const _PartnerNameField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.profileSetup;

    return BaseTextField(
      label: l10n.partnerNameLabel,
      hint: l10n.partnerNameHint,
      onChanged: context.read<ProfileSetupCubit>().onPartnerNameChanged,
    );
  }
}

class const _ThemePicker() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.profileSetup;
    final selected = context.select((ProfileSetupCubit cubit) => cubit.state.theme);

    void choose(AppThemeVariant variant) {
      context.read<ProfileSetupCubit>().onThemeChanged(variant);
      AppThemeScope.set(context, variant);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.themeLabel,
          style: context.text.label.copyWith(color: context.colors.textSecondary),
        ),
        const SizedBox(height: AppSpace.s8),
        Wrap(
          spacing: AppSpace.s8,
          runSpacing: AppSpace.s8,
          children: [
            BaseChoiceChip(
              label: l10n.themeRose,
              isSelected: selected == AppThemeVariant.rose,
              onTap: () => choose(AppThemeVariant.rose),
            ),
            BaseChoiceChip(
              label: l10n.themeBlue,
              isSelected: selected == AppThemeVariant.blue,
              onTap: () => choose(AppThemeVariant.blue),
            ),
            BaseChoiceChip(
              label: l10n.themeNeutral,
              isSelected: selected == AppThemeVariant.neutral,
              onTap: () => choose(AppThemeVariant.neutral),
            ),
          ],
        ),
      ],
    );
  }
}

class const _DateField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.profileSetup;
    final date = context.select((ProfileSetupCubit cubit) => cubit.state.togetherSince);

    return BaseDateField(
      label: l10n.dateLabel,
      hint: l10n.dateHint,
      value: date,
      minimum: earliestTogetherSince,
      maximum: DateTime.now(),
      formatter: (value) =>
          l10n.dateFormat(day: value.day, month: l10n.months[value.month - 1], year: value.year),
      onChanged: context.read<ProfileSetupCubit>().onDateChanged,
    );
  }
}

class const _ContinueButton() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.profileSetup;
    final canSave = context.select((ProfileSetupCubit cubit) => cubit.state.canSave);
    final isLoading = context.select((ProfileSetupCubit cubit) => cubit.state.saveAction.isLoading);

    return BaseButton(
      text: l10n.continueButton,
      isEnabled: canSave,
      isLoading: isLoading,
      onPressed: context.read<ProfileSetupCubit>().save,
    );
  }
}
