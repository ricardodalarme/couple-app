import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/shared/widgets/social_button.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/signup/cubit/signup_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class const SignUpPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<SignupCubit>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.authentication.signup;
    final loginL10n = context.l10n.authentication.login;

    return BaseView(
      title: l10n.title,
      body: BlocListener<SignupCubit, SignupState>(
        listenWhen: (previous, current) => previous.submission != current.submission,
        listener: _handleStatus,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Spacings.large),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _EmailTextField(),
                const Gap(Spacings.medium),
                const _PasswordTextField(),
                const Gap(Spacings.medium),
                const _ConfirmPasswordTextField(),
                const Gap(Spacings.large),
                const _SubmitButton(),
                BaseDivider.text(
                  text: loginL10n.dividerOr,
                  startMargin: Spacings.large,
                  endMargin: Spacings.large,
                ),
                const _SignInWithThirdPartyButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleStatus(BuildContext context, SignupState state) {
    final l10n = context.l10n.authentication.signup;

    switch (state.submission) {
      case Success():
        context.router.replaceAll([const HomeRoute()]);
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

class const _EmailTextField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.authentication.signup;
    final email = context.select((SignupCubit cubit) => cubit.state.email);

    return BaseTextField(
      text: email.value,
      label: context.l10n.common.email,
      errorText: l10n.emailErrors[email.displayError?.name],
      onChanged: context.read<SignupCubit>().onEmailChanged,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }
}

class const _PasswordTextField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.authentication.signup;
    final password = context.select((SignupCubit cubit) => cubit.state.password);

    return BaseTextField(
      type: BaseTextFieldType.password,
      text: password.value,
      label: context.l10n.common.password,
      errorText: l10n.passwordErrors[password.displayError?.name],
      onChanged: context.read<SignupCubit>().onPasswordChanged,
      textInputAction: TextInputAction.next,
    );
  }
}

class const _ConfirmPasswordTextField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.authentication.signup;
    final confirmPassword = context.select((SignupCubit cubit) => cubit.state.confirmPassword);

    return BaseTextField(
      type: BaseTextFieldType.password,
      text: confirmPassword.value,
      label: l10n.labelConfirmPassword,
      errorText: l10n.confirmPasswordErrors[confirmPassword.displayError?.name],
      onChanged: context.read<SignupCubit>().onConfirmPasswordChanged,
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => context.read<SignupCubit>().onSubmit(),
    );
  }
}

class const _SubmitButton() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.authentication.signup;
    final submission = context.select((SignupCubit cubit) => cubit.state.submission);
    final isValid = context.select((SignupCubit cubit) => cubit.state.isValid);

    return BaseButton(
      text: l10n.buttonSubmit,
      isLoading: submission.isLoading,
      isEnabled: isValid,
      onPressed: context.read<SignupCubit>().onSubmit,
    );
  }
}

class const _SignInWithThirdPartyButtons() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginL10n = context.l10n.authentication.login;

    return Column(
      spacing: Spacings.small,
      children: [
        SocialButton(
          ButtonProvider.google,
          text: (provider) => loginL10n.buttonSignInWith(provider: provider.text),
          onPressed: context.read<SignupCubit>().onSignInWithGoogle,
        ),
        if (defaultTargetPlatform == TargetPlatform.iOS)
          SocialButton(
            ButtonProvider.apple,
            text: (provider) => loginL10n.buttonSignInWith(provider: provider.text),
            onPressed: context.read<SignupCubit>().onSignInWithApple,
          ),
      ],
    );
  }
}
