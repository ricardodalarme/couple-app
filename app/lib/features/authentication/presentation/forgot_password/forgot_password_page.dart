import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:quickstart_flutter_bloc/l10n/l10n_map_extension.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

@RoutePage()
class ForgotPasswordPage extends StatelessWidget implements AutoRouteWrapper {
  const ForgotPasswordPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<ForgotPasswordCubit>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final TranslationsAuthenticationForgotPasswordEn l10n =
        context.l10n.authentication.forgotPassword;

    return BaseView(
      title: l10n.title,
      body: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listenWhen: (previous, current) => previous.submission != current.submission,
        listener: _handleStatus,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Spacings.large),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  l10n.description,
                  textAlign: TextAlign.center,
                  style: context.typography.labelLarge,
                ),
                const Gap(Spacings.xlarge),
                const _EmailTextField(),
                const Gap(Spacings.large),
                const _SubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleStatus(BuildContext context, ForgotPasswordState state) {
    final TranslationsAuthenticationForgotPasswordEn l10n =
        context.l10n.authentication.forgotPassword;

    switch (state.submission) {
      case Success():
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

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    final TranslationsAuthenticationForgotPasswordEn l10n =
        context.l10n.authentication.forgotPassword;

    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) => BaseTextField(
        text: state.email.value,
        keyboardType: TextInputType.emailAddress,
        label: context.l10n.common.email,
        errorText: l10n.emailErrors[state.email.displayError?.name],
        textInputAction: TextInputAction.done,
        onChanged: context.read<ForgotPasswordCubit>().onEmailChanged,
        onSubmitted: (_) => context.read<ForgotPasswordCubit>().onSubmit(),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state) => BaseButton(
        text: context.l10n.common.send,
        isEnabled: state.isValid,
        isLoading: state.submission.isLoading,
        onPressed: context.read<ForgotPasswordCubit>().onSubmit,
      ),
    );
  }
}
