import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/presentation/bloc/edit_profile_bloc.dart';
import 'package:quickstart_flutter_bloc/l10n/l10n_map_extension.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

@RoutePage()
class EditProfilePage extends StatelessWidget implements AutoRouteWrapper {
  const EditProfilePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<EditProfileBloc>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: context.l10n.editProfile.title,
      body: BlocListener<EditProfileBloc, EditProfileState>(
        listenWhen: (previous, current) =>
            previous.submission != current.submission,
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
    switch (state.submission) {
      case Success():
        context.router.maybePop();
        context.showSnackBar(
          message: context.l10n.editProfile.messageSuccess,
          type: SnackBarType.success,
        );
      case Failure(:final LocalizedException exception):
        context.showSnackBar(
          message: context.l10n.editProfile.errors
              .selectOrFallback(exception.l10nKey),
          type: SnackBarType.error,
        );
      default:
        break;
    }
  }
}

class _FirstNameTextField extends StatelessWidget {
  const _FirstNameTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      buildWhen: (previous, current) => previous.firstName != current.firstName,
      builder: (context, state) => BaseTextField(
        text: state.firstName.value,
        label: context.l10n.common.firstName,
        errorText: context.l10n.editProfile
            .firstNameErrors[state.firstName.displayError?.name],
        textInputAction: TextInputAction.next,
        onChanged: (value) => context
            .read<EditProfileBloc>()
            .add(EditProfileFirstNameChanged(value)),
      ),
    );
  }
}

class _LastNameTextField extends StatelessWidget {
  const _LastNameTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      buildWhen: (previous, current) => previous.lastName != current.lastName,
      builder: (context, state) => BaseTextField(
        text: state.lastName.value,
        label: context.l10n.common.lastName,
        errorText: context
            .l10n.editProfile.lastNameErrors[state.lastName.displayError?.name],
        textInputAction: TextInputAction.next,
        onChanged: (value) => context
            .read<EditProfileBloc>()
            .add(EditProfileLastNameChanged(value)),
      ),
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) => BaseTextField(
        text: state.email.value,
        label: context.l10n.common.email,
        errorText: context
            .l10n.editProfile.emailErrors[state.email.displayError?.name],
        textInputAction: TextInputAction.done,
        onSubmitted: (_) =>
            context.read<EditProfileBloc>().add(const EditProfileSubmitted()),
        onChanged: (value) =>
            context.read<EditProfileBloc>().add(EditProfileEmailChanged(value)),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      builder: (context, state) => BaseButton(
        text: context.l10n.common.save,
        isLoading: state.submission.isLoading,
        isEnabled: state.isValid,
        onPressed: () =>
            context.read<EditProfileBloc>().add(const EditProfileSubmitted()),
      ),
    );
  }
}
