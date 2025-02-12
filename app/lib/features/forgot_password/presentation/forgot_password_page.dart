import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:quickstart_flutter_bloc/l10n/l10n_map_extension.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

@RoutePage()
class ForgotPasswordPage extends StatelessWidget implements AutoRouteWrapper {
  const ForgotPasswordPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<ForgotPasswordBloc>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: context.l10n.forgotPassword.title,
      body: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
        listenWhen: (previous, current) => previous.submission != current.submission,
        listener: _handleStatus,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Spacings.large),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.l10n.forgotPassword.description,
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
    switch (state.submission) {
      case Success():
        context.showSnackBar(
          message: context.l10n.forgotPassword.messageSuccess,
          type: SnackBarType.success,
        );
      case Failure(:final LocalizedException exception):
        context.showSnackBar(
          message: context.l10n.forgotPassword.errors.selectOrFallback(exception.l10nKey),
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
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder:
          (context, state) => BaseTextField(
            text: state.email.value,
            keyboardType: TextInputType.emailAddress,
            label: context.l10n.common.email,
            errorText: context.l10n.forgotPassword.emailErrors[state.email.displayError?.name],
            textInputAction: TextInputAction.done,
            onChanged:
                (value) =>
                    context.read<ForgotPasswordBloc>().add(ForgotPasswordEmailChanged(value)),
            onSubmitted:
                (_) => context.read<ForgotPasswordBloc>().add(const ForgotPasswordSubmitted()),
          ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder:
          (context, state) => BaseButton(
            text: context.l10n.common.send,
            isEnabled: state.isValid,
            isLoading: state.submission.isLoading,
            onPressed:
                () => context.read<ForgotPasswordBloc>().add(const ForgotPasswordSubmitted()),
          ),
    );
  }
}
