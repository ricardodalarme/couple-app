import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const ForgotPasswordPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<ForgotPasswordCubit>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.authentication.forgotPassword;

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
    final l10n = context.l10n.authentication.forgotPassword;

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

class const _EmailTextField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.authentication.forgotPassword;
    final email = context.select((ForgotPasswordCubit cubit) => cubit.state.email);

    return BaseTextField(
      text: email.value,
      keyboardType: TextInputType.emailAddress,
      label: context.l10n.common.email,
      errorText: l10n.emailErrors[email.displayError?.name],
      textInputAction: TextInputAction.done,
      onChanged: context.read<ForgotPasswordCubit>().onEmailChanged,
      onSubmitted: (_) => context.read<ForgotPasswordCubit>().onSubmit(),
    );
  }
}

class const _SubmitButton() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final submission = context.select((ForgotPasswordCubit cubit) => cubit.state.submission);
    final isValid = context.select((ForgotPasswordCubit cubit) => cubit.state.isValid);

    return BaseButton(
      text: context.l10n.common.send,
      isEnabled: isValid,
      isLoading: submission.isLoading,
      onPressed: context.read<ForgotPasswordCubit>().onSubmit,
    );
  }
}
