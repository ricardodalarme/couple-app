import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/account/presentation/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const EditProfilePage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<EditProfileCubit>()..loadCurrentUser(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.account.editProfile;

    return BaseView(
      title: l10n.title,
      body: BlocListener<EditProfileCubit, EditProfileState>(
        listenWhen: (previous, current) => previous.submission != current.submission,
        listener: _handleStatus,
        child: const Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(Spacings.large),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _FirstNameTextField(),
                Gap(Spacings.medium),
                _LastNameTextField(),
                Gap(Spacings.medium),
                _EmailTextField(),
                Gap(Spacings.large),
                _SubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleStatus(BuildContext context, EditProfileState state) {
    final l10n = context.l10n.account.editProfile;

    switch (state.submission) {
      case Success():
        context.router.maybePop();
        context.showSnackBar(l10n.messageSuccess, type: SnackBarType.success);
      case Failure(:final LocalizedException exception):
        context.showSnackBar(
          l10n.errors.selectOrFallback(exception.l10nKey),
          type: SnackBarType.error,
        );
      default:
        break;
    }
  }
}

class const _FirstNameTextField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.account.editProfile;
    final firstName = context.select((EditProfileCubit cubit) => cubit.state.firstName);

    return BaseTextField(
      text: firstName.value,
      label: context.l10n.common.firstName,
      errorText: l10n.firstNameErrors[firstName.displayError?.name],
      textInputAction: TextInputAction.next,
      onChanged: context.read<EditProfileCubit>().onFirstNameChanged,
    );
  }
}

class const _LastNameTextField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.account.editProfile;
    final lastName = context.select((EditProfileCubit cubit) => cubit.state.lastName);

    return BaseTextField(
      text: lastName.value,
      label: context.l10n.common.lastName,
      errorText: l10n.lastNameErrors[lastName.displayError?.name],
      textInputAction: TextInputAction.next,
      onChanged: context.read<EditProfileCubit>().onLastNameChanged,
    );
  }
}

class const _EmailTextField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.account.editProfile;
    final email = context.select((EditProfileCubit cubit) => cubit.state.email);

    return BaseTextField(
      text: email.value,
      label: context.l10n.common.email,
      errorText: l10n.emailErrors[email.displayError?.name],
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => context.read<EditProfileCubit>().onSubmit(),
      onChanged: context.read<EditProfileCubit>().onEmailChanged,
    );
  }
}

class const _SubmitButton() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final submission = context.select((EditProfileCubit cubit) => cubit.state.submission);
    final isValid = context.select((EditProfileCubit cubit) => cubit.state.isValid);

    return BaseButton(
      text: context.l10n.common.save,
      isLoading: submission.isLoading,
      isEnabled: isValid,
      onPressed: context.read<EditProfileCubit>().onSubmit,
    );
  }
}
