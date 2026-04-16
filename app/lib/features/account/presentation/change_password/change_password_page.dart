import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/account/presentation/change_password/cubit/change_password_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class ChangePasswordPage extends StatelessWidget implements AutoRouteWrapper {
  const ChangePasswordPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<ChangePasswordCubit>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.account.changePassword;

    return BaseView(
      title: l10n.title,
      body: BlocListener<ChangePasswordCubit, ChangePasswordState>(
        listenWhen: (previous, current) => previous.submission != current.submission,
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
    final l10n = context.l10n.account.changePassword;

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

class _CurrentPasswordTextField extends StatelessWidget {
  const _CurrentPasswordTextField();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.account.changePassword;

    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
      buildWhen: (previous, current) => previous.currentPassword != current.currentPassword,
      builder: (context, state) => BaseTextField(
        type: BaseTextFieldType.password,
        text: state.currentPassword.value,
        errorText: l10n.currentPasswordErrors[state.currentPassword.displayError?.name],
        onChanged: context.read<ChangePasswordCubit>().onCurrentPasswordChanged,
        label: l10n.labelCurrentPassword,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class _NewPasswordTextField extends StatelessWidget {
  const _NewPasswordTextField();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.account.changePassword;

    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) => BaseTextField(
        type: BaseTextFieldType.password,
        text: state.password.value,
        errorText: l10n.newPasswordErrors[state.password.displayError?.name],
        onChanged: context.read<ChangePasswordCubit>().onNewPasswordChanged,
        label: l10n.labelNewPassword,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class _ConfirmPasswordTextField extends StatelessWidget {
  const _ConfirmPasswordTextField();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.account.changePassword;

    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
      buildWhen: (previous, current) => previous.confirmPassword != current.confirmPassword,
      builder: (context, state) => BaseTextField(
        type: BaseTextFieldType.password,
        text: state.confirmPassword.value,
        errorText: l10n.confirmPasswordErrors[state.confirmPassword.displayError?.name],
        onChanged: (password) =>
            context.read<ChangePasswordCubit>().onConfirmPasswordChanged(password),
        label: l10n.labelConfirmPassword,
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => context.read<ChangePasswordCubit>().onSubmit(),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
      builder: (context, state) => BaseButton(
        text: context.l10n.common.save,
        isLoading: state.submission.isLoading,
        isEnabled: state.isValid,
        onPressed: context.read<ChangePasswordCubit>().onSubmit,
      ),
    );
  }
}
