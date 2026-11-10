import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/account/presentation/change_password/cubit/change_password_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const ChangePasswordPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
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
      body: BlocListener<ChangePasswordCubit, ChangePasswordState>(
        listenWhen: (previous, current) => previous.submission != current.submission,
        listener: _handleStatus,
        child: BaseFlowContent(
          heading: l10n.title,
          content: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _CurrentPasswordTextField(),
              SizedBox(height: AppSpace.s12),
              _NewPasswordTextField(),
              SizedBox(height: AppSpace.s12),
              _ConfirmPasswordTextField(),
            ],
          ),
          primaryAction: const _SubmitButton(),
        ),
      ),
    );
  }

  void _handleStatus(BuildContext context, ChangePasswordState state) {
    final l10n = context.l10n.account.changePassword;

    switch (state.submission) {
      case Success():
        context.router.maybePop();
        BaseToast.show(context, l10n.messageSuccess);
      case Failure(:final LocalizedException exception):
        BaseToast.show(context, l10n.errors.selectOrFallback(exception.l10nKey));
      default:
        break;
    }
  }
}

class const _CurrentPasswordTextField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.account.changePassword;
    final currentPassword = context.select(
      (ChangePasswordCubit cubit) => cubit.state.currentPassword,
    );

    return BaseTextField(
      type: BaseTextFieldType.password,
      text: currentPassword.value,
      errorText: l10n.currentPasswordErrors[currentPassword.displayError?.name],
      onChanged: context.read<ChangePasswordCubit>().onCurrentPasswordChanged,
      label: l10n.labelCurrentPassword,
      textInputAction: TextInputAction.next,
    );
  }
}

class const _NewPasswordTextField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.account.changePassword;
    final password = context.select((ChangePasswordCubit cubit) => cubit.state.password);

    return BaseTextField(
      type: BaseTextFieldType.password,
      text: password.value,
      errorText: l10n.newPasswordErrors[password.displayError?.name],
      onChanged: context.read<ChangePasswordCubit>().onNewPasswordChanged,
      label: l10n.labelNewPassword,
      textInputAction: TextInputAction.next,
    );
  }
}

class const _ConfirmPasswordTextField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.account.changePassword;
    final confirmPassword = context.select(
      (ChangePasswordCubit cubit) => cubit.state.confirmPassword,
    );

    return BaseTextField(
      type: BaseTextFieldType.password,
      text: confirmPassword.value,
      errorText: l10n.confirmPasswordErrors[confirmPassword.displayError?.name],
      onChanged: (password) =>
          context.read<ChangePasswordCubit>().onConfirmPasswordChanged(password),
      label: l10n.labelConfirmPassword,
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => context.read<ChangePasswordCubit>().onSubmit(),
    );
  }
}

class const _SubmitButton() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final submission = context.select((ChangePasswordCubit cubit) => cubit.state.submission);
    final isValid = context.select((ChangePasswordCubit cubit) => cubit.state.isValid);

    return BaseButton(
      text: context.l10n.common.save,
      isLoading: submission.isLoading,
      isEnabled: isValid,
      onPressed: context.read<ChangePasswordCubit>().onSubmit,
    );
  }
}
