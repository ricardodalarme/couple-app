import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
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
      appBar: BaseAppBar(title: l10n.title),
      body: BlocListener<SignupCubit, SignupState>(
        listenWhen: (previous, current) => previous.submission != current.submission,
        listener: _handleStatus,
        child: BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _EmailTextField(),
              const SizedBox(height: AppSpace.s12),
              const _PasswordTextField(),
              const SizedBox(height: AppSpace.s12),
              const _ConfirmPasswordTextField(),
              const SizedBox(height: AppSpace.s16),
              const _SubmitButton(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpace.s16),
                child: BaseDivider(label: loginL10n.dividerOr),
              ),
              const _SignInWithThirdPartyButtons(),
            ],
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
        BaseToast.show(context, l10n.errors.selectOrFallback(exception.l10nKey));
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
      type: BaseTextFieldType.email,
      text: email.value,
      label: context.l10n.common.email,
      errorText: l10n.emailErrors[email.displayError?.name],
      onChanged: context.read<SignupCubit>().onEmailChanged,
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
      spacing: AppSpace.s8,
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
