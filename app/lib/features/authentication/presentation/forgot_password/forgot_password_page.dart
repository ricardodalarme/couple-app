import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:ui/ui.dart';

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
      body: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listenWhen: (previous, current) => previous.submission != current.submission,
        listener: _handleStatus,
        child: BaseFlowContent(
          heading: l10n.title,
          subtitle: l10n.description,
          content: const _EmailTextField(),
          primaryAction: const _SubmitButton(),
        ),
      ),
    );
  }

  void _handleStatus(BuildContext context, ForgotPasswordState state) {
    final l10n = context.l10n.authentication.forgotPassword;

    switch (state.submission) {
      case Success():
        BaseToast.show(context, l10n.messageSuccess);
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
    final l10n = context.l10n.authentication.forgotPassword;
    final email = context.select((ForgotPasswordCubit cubit) => cubit.state.email);

    return BaseTextField(
      type: BaseTextFieldType.email,
      text: email.value,
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
