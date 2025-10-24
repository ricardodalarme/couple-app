import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show TextButton;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/login/bloc/login_bloc.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/login/widgets/sign_in_button.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/login/widgets/text_divider.dart';
import 'package:quickstart_flutter_bloc/features/dev_menu/storybook/storybook_page.dart';
import 'package:quickstart_flutter_bloc/l10n/l10n_map_extension.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/router/app_router.dart';

@RoutePage()
class LoginPage extends StatelessWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<LoginBloc>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final TranslationsAuthenticationLoginEn l10n = context.l10n.authentication.login;

    return BaseView(
      title: l10n.title,
      body: BlocListener<LoginBloc, LoginState>(
        listenWhen: (previous, current) => previous.login != current.login,
        listener: _handleStatus,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Spacings.large),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _UsernameTextField(),
                const Gap(Spacings.medium),
                const _PasswordTextField(),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.pushRoute(const ForgotPasswordRoute());
                    },
                    child: Text(l10n.buttonForgotPassword),
                  ),
                ),
                const Gap(Spacings.small),
                const _LoginButton(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Spacings.large),
                  child: TextDivider(l10n.dividerOr),
                ),
                const _SignInWithThirdPartyButtons(),
                const _SignupButton(),
                if (kDebugMode)
                  TextButton(
                    onPressed: () => context.router.pushWidget(const StorybookPage()),
                    child: Text(l10n.buttonDevMenu),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleStatus(BuildContext context, LoginState state) {
    final TranslationsAuthenticationLoginEn l10n = context.l10n.authentication.login;

    switch (state.login) {
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

class _UsernameTextField extends StatelessWidget {
  const _UsernameTextField();

  @override
  Widget build(BuildContext context) {
    final TranslationsAuthenticationLoginEn l10n = context.l10n.authentication.login;

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) => BaseTextField(
        text: state.username.value,
        label: context.l10n.common.username,
        errorText: l10n.usernameErrors[state.username.displayError?.name],
        onChanged: (username) => context.read<LoginBloc>().add(LoginUsernameChanged(username)),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField();

  @override
  Widget build(BuildContext context) {
    final TranslationsAuthenticationLoginEn l10n = context.l10n.authentication.login;

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) => BaseTextField(
        type: BaseTextFieldType.password,
        text: state.password.value,
        errorText: l10n.passwordErrors[state.password.displayError?.name],
        onChanged: (password) => context.read<LoginBloc>().add(LoginPasswordChanged(password)),
        label: context.l10n.common.password,
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => context.read<LoginBloc>().add(const LoginSubmitted()),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    final TranslationsAuthenticationLoginEn l10n = context.l10n.authentication.login;

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) => BaseButton(
        text: l10n.buttonLogin,
        isLoading: state.login.isLoading,
        isEnabled: state.isValid,
        onPressed: () => context.read<LoginBloc>().add(const LoginSubmitted()),
      ),
    );
  }
}

class _SignInWithThirdPartyButtons extends StatelessWidget {
  const _SignInWithThirdPartyButtons();

  @override
  Widget build(BuildContext context) {
    final TranslationsAuthenticationLoginEn l10n = context.l10n.authentication.login;

    return Column(
      children: [
        SignInButton(
          ButtonProvider.google,
          text: (provider) => l10n.buttonSignInWith(provider: provider.text),
          onPressed: () => context.read<LoginBloc>().add(const LoginWithGoogleSubmitted()),
        ),
        SignInButton(
          ButtonProvider.facebook,
          text: (provider) => l10n.buttonSignInWith(provider: provider.text),
          onPressed: () => context.read<LoginBloc>().add(const LoginWithFacebookSubmitted()),
        ),
      ],
    );
  }
}

class _SignupButton extends StatelessWidget {
  const _SignupButton();

  @override
  Widget build(BuildContext context) {
    final TranslationsAuthenticationLoginEn l10n = context.l10n.authentication.login;

    return TextButton(
      onPressed: () => context.pushRoute(const SignUpRoute()),
      child: Text.rich(
        l10n.buttonNewAccount(
          signUp: (text) => TextSpan(
            text: text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
