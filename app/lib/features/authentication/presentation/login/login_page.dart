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
class const LoginPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<LoginCubit>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.authentication.login;

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
    final l10n = context.l10n.authentication.login;

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

class const _EmailTextField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.authentication.login;
    final email = context.select((LoginCubit cubit) => cubit.state.email);

    return BaseTextField(
      text: email.value,
      label: context.l10n.common.email,
      errorText: l10n.emailErrors[email.displayError?.name],
      onChanged: context.read<LoginCubit>().onEmailChanged,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }
}

class const _PasswordTextField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.authentication.login;
    final password = context.select((LoginCubit cubit) => cubit.state.password);

    return BaseTextField(
      type: BaseTextFieldType.password,
      text: password.value,
      errorText: l10n.passwordErrors[password.displayError?.name],
      onChanged: context.read<LoginCubit>().onPasswordChanged,
      label: context.l10n.common.password,
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => context.read<LoginCubit>().onSubmit(),
    );
  }
}

class const _LoginButton() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.authentication.login;
    final login = context.select((LoginCubit cubit) => cubit.state.login);
    final isValid = context.select((LoginCubit cubit) => cubit.state.isValid);

    return BaseButton(
      text: l10n.buttonLogin,
      isLoading: login.isLoading,
      isEnabled: isValid,
      onPressed: context.read<LoginCubit>().onSubmit,
    );
  }
}

class const _SignInWithThirdPartyButtons() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.authentication.login;

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

class const _SignupButton() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.authentication.login;

    return BaseTextButton(
      text: l10n.buttonNewAccount,
      onPressed: () => context.pushRoute(const SignUpRoute()),
    );
  }
}
