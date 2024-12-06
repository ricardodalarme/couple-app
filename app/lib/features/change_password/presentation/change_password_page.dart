import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/change_password/presentation/bloc/change_password_bloc.dart';
import 'package:quickstart_flutter_bloc/l10n/l10n_map_extension.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

@RoutePage()
class ChangePasswordPage extends StatelessWidget implements AutoRouteWrapper {
  const ChangePasswordPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<ChangePasswordBloc>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: context.l10n.changePassword.title,
      body: BlocListener<ChangePasswordBloc, ChangePasswordState>(
        listenWhen: (previous, current) =>
            previous.submission != current.submission,
        listener: _handleStatus,
        child: const Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(Spacings.large),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _CurrentPasswordTextField(),
                Gap(Spacings.medium),
                _NewPasswordTextField(),
                Gap(Spacings.medium),
                _ConfirmPasswordTextField(),
                Gap(Spacings.large),
                _SubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleStatus(BuildContext context, ChangePasswordState state) {
    switch (state.submission) {
      case Success():
        context.router.maybePop();
        context.showSnackBar(
          message: context.l10n.changePassword.messageSuccess,
          type: SnackBarType.success,
        );
      case Failure(:final LocalizedException exception):
        context.showSnackBar(
          message: context.l10n.changePassword.errors
              .selectOrFallback(exception.l10nKey),
          type: SnackBarType.error,
        );
      default:
        break;
    }
  }
}

class _CurrentPasswordTextField extends StatelessWidget {
  const _CurrentPasswordTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      buildWhen: (previous, current) =>
          previous.currentPassword != current.currentPassword,
      builder: (context, state) => PasswordTextField(
        text: state.currentPassword.value,
        errorText: context.l10n.changePassword
            .currentPasswordErrors[state.currentPassword.displayError?.name],
        onChanged: (password) => context
            .read<ChangePasswordBloc>()
            .add(ChangePasswordCurrentPasswordChanged(password)),
        label: context.l10n.changePassword.labelCurrentPassword,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class _NewPasswordTextField extends StatelessWidget {
  const _NewPasswordTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) => PasswordTextField(
        text: state.password.value,
        errorText: context.l10n.changePassword
            .newPasswordErrors[state.password.displayError?.name],
        onChanged: (password) => context
            .read<ChangePasswordBloc>()
            .add(ChangePasswordNewPasswordChanged(password)),
        label: context.l10n.changePassword.labelNewPassword,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class _ConfirmPasswordTextField extends StatelessWidget {
  const _ConfirmPasswordTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      buildWhen: (previous, current) =>
          previous.confirmPassword != current.confirmPassword,
      builder: (context, state) => PasswordTextField(
        text: state.confirmPassword.value,
        errorText: context.l10n.changePassword
            .confirmPasswordErrors[state.confirmPassword.displayError?.name],
        onChanged: (password) => context
            .read<ChangePasswordBloc>()
            .add(ChangePasswordConfirmPasswordChanged(password)),
        label: context.l10n.changePassword.labelConfirmPassword,
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => context
            .read<ChangePasswordBloc>()
            .add(const ChangePasswordSubmitted()),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      builder: (context, state) => BaseButton(
        text: context.l10n.common.save,
        isLoading: state.submission.isLoading,
        isEnabled: state.isValid,
        onPressed: () => context
            .read<ChangePasswordBloc>()
            .add(const ChangePasswordSubmitted()),
      ),
    );
  }
}
