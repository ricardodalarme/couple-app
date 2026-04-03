import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/login/cubit/login_cubit.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/shared/widgets/social_button.dart';
import 'package:flutter_bloc_starter/features/dev_menu/dev_menu_page.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class LoginPage extends StatelessWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<LoginCubit>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final TranslationsAuthenticationLoginEn l10n = context.l10n.authentication.login;

    return BaseView(
      title: l10n.title,
      body: BlocListener<LoginCubit, LoginState>(
        listenWhen: (previous, current) => previous.login != current.login,
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
                Align(
                  alignment: Alignment.centerRight,
                  child: BaseTextButton(
                    text: l10n.buttonForgotPassword,
                    onPressed: () {
                      context.pushRoute(const ForgotPasswordRoute());
                    },
                  ),
                ),
                const Gap(Spacings.small),
                const _LoginButton(),
                BaseDivider.text(
                  text: l10n.dividerOr,
                  startMargin: Spacings.large,
                  endMargin: Spacings.large,
                ),
                const _SignInWithThirdPartyButtons(),
                const Gap(Spacings.small),
                const _SignupButton(),
                if (kDebugMode)
                  BaseTextButton(
                    text: l10n.buttonDevMenu,
                    onPressed: () => context.router.pushWidget(const DevMenuPage()),
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

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    final TranslationsAuthenticationLoginEn l10n = context.l10n.authentication.login;

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) => BaseTextField(
        text: state.email.value,
        label: context.l10n.common.email,
        errorText: l10n.emailErrors[state.email.displayError?.name],
        onChanged: context.read<LoginCubit>().onEmailChanged,
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
    final TranslationsAuthenticationLoginEn l10n = context.l10n.authentication.login;

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) => BaseTextField(
        type: BaseTextFieldType.password,
        text: state.password.value,
        errorText: l10n.passwordErrors[state.password.displayError?.name],
        onChanged: context.read<LoginCubit>().onPasswordChanged,
        label: context.l10n.common.password,
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => context.read<LoginCubit>().onSubmit(),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    final TranslationsAuthenticationLoginEn l10n = context.l10n.authentication.login;

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) => BaseButton(
        text: l10n.buttonLogin,
        isLoading: state.login.isLoading,
        isEnabled: state.isValid,
        onPressed: context.read<LoginCubit>().onSubmit,
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
      spacing: Spacings.small,
      children: [
        SocialButton(
          ButtonProvider.google,
          text: (provider) => l10n.buttonSignInWith(provider: provider.text),
          onPressed: context.read<LoginCubit>().onLoginWithGoogle,
        ),
        if (defaultTargetPlatform == TargetPlatform.iOS)
          SocialButton(
            ButtonProvider.apple,
            text: (provider) => l10n.buttonSignInWith(provider: provider.text),
            onPressed: context.read<LoginCubit>().onLoginWithApple,
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

    return BaseTextButton(
      text: l10n.buttonNewAccount,
      onPressed: () => context.pushRoute(const SignUpRoute()),
    );
  }
}
