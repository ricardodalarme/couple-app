import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/routes/app_router.dart';

@RoutePage()
class SignUpPage extends StatelessWidget implements AutoRouteWrapper {
  const SignUpPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<SignupBloc>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: context.l10n.signup.title,
      body: BlocListener<SignupBloc, SignupState>(
        listenWhen: (previous, current) =>
            previous.submission != current.submission,
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
    switch (state.submission) {
      case Success():
        context.router.replaceAll([const HomeRoute()]);
      default:
        break;
    }
  }
}

class _UsernameTextField extends StatelessWidget {
  const _UsernameTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) => BaseTextField(
        text: state.username.value,
        label: context.l10n.common.username,
        errorText: context
            .l10n.signup.usernameErrors[state.username.displayError?.name],
        onChanged: (username) =>
            context.read<SignupBloc>().add(SignupUsernameChanged(username)),
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
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) => BaseTextField(
        text: state.email.value,
        label: context.l10n.common.email,
        errorText:
            context.l10n.signup.emailErrors[state.email.displayError?.name],
        onChanged: (email) =>
            context.read<SignupBloc>().add(SignupEmailChanged(email)),
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
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) => PasswordTextField(
        text: state.password.value,
        label: context.l10n.common.password,
        errorText: context
            .l10n.signup.passwordErrors[state.password.displayError?.name],
        onChanged: (password) =>
            context.read<SignupBloc>().add(SignupPasswordChanged(password)),
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class _ConfirmPasswordTextField extends StatelessWidget {
  const _ConfirmPasswordTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) =>
          previous.confirmPassword != current.confirmPassword,
      builder: (context, state) => PasswordTextField(
        text: state.confirmPassword.value,
        label: context.l10n.signup.labelConfirmPassword,
        errorText: context.l10n.signup
            .confirmPasswordErrors[state.confirmPassword.displayError?.name],
        onChanged: (password) => context
            .read<SignupBloc>()
            .add(SignupConfirmPasswordChanged(password)),
        textInputAction: TextInputAction.done,
        onSubmitted: (_) =>
            context.read<SignupBloc>().add(const SignupSubmitted()),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) => BaseButton(
        text: context.l10n.signup.buttonSubmit,
        isLoading: state.submission.isLoading,
        isEnabled: state.isValid,
        onPressed: () =>
            context.read<SignupBloc>().add(const SignupSubmitted()),
      ),
    );
  }
}
