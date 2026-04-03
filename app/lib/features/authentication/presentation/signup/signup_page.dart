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
class SignUpPage extends StatelessWidget implements AutoRouteWrapper {
  const SignUpPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<SignupCubit>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final TranslationsAuthenticationSignupEn l10n = context.l10n.authentication.signup;
    final TranslationsAuthenticationLoginEn loginL10n = context.l10n.authentication.login;

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
                _SignInWithThirdPartyButtons(loginL10n: loginL10n),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleStatus(BuildContext context, SignupState state) {
    final TranslationsAuthenticationSignupEn l10n = context.l10n.authentication.signup;

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

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    final TranslationsAuthenticationSignupEn l10n = context.l10n.authentication.signup;

    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) => BaseTextField(
        text: state.email.value,
        label: context.l10n.common.email,
        errorText: l10n.emailErrors[state.email.displayError?.name],
        onChanged: context.read<SignupCubit>().onEmailChanged,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField();

  @override
  Widget build(BuildContext context) {
    final TranslationsAuthenticationSignupEn l10n = context.l10n.authentication.signup;

    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) => BaseTextField(
        type: BaseTextFieldType.password,
        text: state.password.value,
        label: context.l10n.common.password,
        errorText: l10n.passwordErrors[state.password.displayError?.name],
        onChanged: context.read<SignupCubit>().onPasswordChanged,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class _ConfirmPasswordTextField extends StatelessWidget {
  const _ConfirmPasswordTextField();

  @override
  Widget build(BuildContext context) {
    final TranslationsAuthenticationSignupEn l10n = context.l10n.authentication.signup;

    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.confirmPassword != current.confirmPassword,
      builder: (context, state) => BaseTextField(
        type: BaseTextFieldType.password,
        text: state.confirmPassword.value,
        label: l10n.labelConfirmPassword,
        errorText: l10n.confirmPasswordErrors[state.confirmPassword.displayError?.name],
        onChanged: context.read<SignupCubit>().onConfirmPasswordChanged,
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => context.read<SignupCubit>().onSubmit(),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final TranslationsAuthenticationSignupEn l10n = context.l10n.authentication.signup;

    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) => BaseButton(
        text: l10n.buttonSubmit,
        isLoading: state.submission.isLoading,
        isEnabled: state.isValid,
        onPressed: context.read<SignupCubit>().onSubmit,
      ),
    );
  }
}

class _SignInWithThirdPartyButtons extends StatelessWidget {
  const _SignInWithThirdPartyButtons({required this.loginL10n});

  final TranslationsAuthenticationLoginEn loginL10n;

  @override
  Widget build(BuildContext context) {
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
