import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/signup/bloc/signup_bloc.dart';
import 'package:quickstart_flutter_bloc/l10n/l10n_map_extension.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/router/app_router.dart';

@RoutePage()
class SignUpPage extends StatelessWidget implements AutoRouteWrapper {
  const SignUpPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<SignupBloc>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final TranslationsAuthenticationSignupEn l10n = context.l10n.authentication.signup;

    return BaseView(
      title: l10n.title,
      body: BlocListener<SignupBloc, SignupState>(
        listenWhen: (previous, current) => previous.submission != current.submission,
        listener: _handleStatus,
        child: const Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(Spacings.large),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _UsernameTextField(),
                Gap(Spacings.medium),
                _EmailTextField(),
                Gap(Spacings.medium),
                _PasswordTextField(),
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

  void _handleStatus(BuildContext context, SignupState state) {
    final TranslationsAuthenticationSignupEn l10n = context.l10n.authentication.signup;

    switch (state.submission) {
      case Success():
        context.router.replaceAll([const HomeRoute()]);
      case Failure(:final LocalizedException exception):
        context.showSnackBar(
          message: l10n.errors.selectOrFallback(exception.l10nKey),
          type: SnackBarType.error,
        );
      default:
        break;
    }
  }
}

class _UsernameTextField extends StatelessWidget {
  const _UsernameTextField();

  @override
  Widget build(BuildContext context) {
    final TranslationsAuthenticationSignupEn l10n = context.l10n.authentication.signup;

    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) => BaseTextField(
        text: state.username.value,
        label: context.l10n.common.username,
        errorText: l10n.usernameErrors[state.username.displayError?.name],
        onChanged: (username) => context.read<SignupBloc>().add(SignupUsernameChanged(username)),
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    final TranslationsAuthenticationSignupEn l10n = context.l10n.authentication.signup;

    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) => BaseTextField(
        text: state.email.value,
        label: context.l10n.common.email,
        errorText: l10n.emailErrors[state.email.displayError?.name],
        onChanged: (email) => context.read<SignupBloc>().add(SignupEmailChanged(email)),
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

    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) => BasePasswordTextField(
        text: state.password.value,
        label: context.l10n.common.password,
        errorText: l10n.passwordErrors[state.password.displayError?.name],
        onChanged: (password) => context.read<SignupBloc>().add(SignupPasswordChanged(password)),
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

    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.confirmPassword != current.confirmPassword,
      builder: (context, state) => BasePasswordTextField(
        text: state.confirmPassword.value,
        label: l10n.labelConfirmPassword,
        errorText: l10n.confirmPasswordErrors[state.confirmPassword.displayError?.name],
        onChanged: (password) =>
            context.read<SignupBloc>().add(SignupConfirmPasswordChanged(password)),
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => context.read<SignupBloc>().add(const SignupSubmitted()),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final TranslationsAuthenticationSignupEn l10n = context.l10n.authentication.signup;

    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) => BaseButton(
        text: l10n.buttonSubmit,
        isLoading: state.submission.isLoading,
        isEnabled: state.isValid,
        onPressed: () => context.read<SignupBloc>().add(const SignupSubmitted()),
      ),
    );
  }
}
