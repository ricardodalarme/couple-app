import 'package:auto_route/auto_route.dart';
import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/profile/presentation/setup/cubit/profile_setup_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/presentation/widgets/profile_theme_picker.dart';
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
              const _ThemePickerField(),
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
    final name = context.select((ProfileSetupCubit cubit) => cubit.state.name);

    return BaseTextField(
      text: name.value,
      label: l10n.nameLabel,
      hint: l10n.nameHint,
      errorText: l10n.nameErrors.selectOrNull(name.errorName),
      onChanged: context.read<ProfileSetupCubit>().onNameChanged,
    );
  }
}

class const _PartnerNameField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.profileSetup;
    final partnerName = context.select((ProfileSetupCubit cubit) => cubit.state.partnerName);

    return BaseTextField(
      text: partnerName.value,
      label: l10n.partnerNameLabel,
      hint: l10n.partnerNameHint,
      errorText: l10n.partnerNameErrors.selectOrNull(partnerName.errorName),
      onChanged: context.read<ProfileSetupCubit>().onPartnerNameChanged,
    );
  }
}

class const _ThemePickerField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = context.select((ProfileSetupCubit cubit) => cubit.state.theme);

    void choose(AppThemeVariant variant) {
      context.read<ProfileSetupCubit>().onThemeChanged(variant);
      AppThemeScope.set(context, variant);
    }

    return ProfileThemePicker(selected: selected, onChanged: choose);
  }
}

class const _DateField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.profileSetup;
    final date = context.select((ProfileSetupCubit cubit) => cubit.state.togetherSince);
    final showsError = context.select((ProfileSetupCubit cubit) => cubit.state.showsDateError);

    return BaseDateField(
      label: l10n.dateLabel,
      hint: l10n.dateHint,
      value: date,
      minimum: earliestTogetherSince,
      maximum: clock.now(),
      errorText: l10n.dateErrors.selectOrNull(showsError ? 'empty' : null),
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
    final isLoading = context.select((ProfileSetupCubit cubit) => cubit.state.saveAction.isLoading);

    return BaseButton(
      text: l10n.continueButton,
      isLoading: isLoading,
      onPressed: context.read<ProfileSetupCubit>().save,
    );
  }
}
