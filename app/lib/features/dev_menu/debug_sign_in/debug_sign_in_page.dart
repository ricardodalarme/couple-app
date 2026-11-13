import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/dev_menu/debug_sign_in/cubit/debug_sign_in_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const DebugSignInPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<DebugSignInCubit>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: const BaseAppBar(title: 'Debug sign-in'),
      body: BlocListener<DebugSignInCubit, DebugSignInState>(
        listenWhen: (previous, current) => previous.signInAction != current.signInAction,
        listener: (context, state) {
          if (state.signInAction case Failure(:final exception)) {
            BaseToast.show(
              context,
              context.l10n.authentication.errors.selectOrFallback(exception.l10nKey),
            );
          }
        },
        child: BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BaseTextField(
                type: BaseTextFieldType.email,
                label: 'Email',
                onChanged: context.read<DebugSignInCubit>().onEmailChanged,
              ),
              const SizedBox(height: AppSpace.s12),
              BaseTextField(
                type: BaseTextFieldType.password,
                label: 'Password',
                onChanged: context.read<DebugSignInCubit>().onPasswordChanged,
              ),
              const SizedBox(height: AppSpace.s16),
              const _SignInButton(),
              const SizedBox(height: AppSpace.s8),
              const _SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class const _SignInButton() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (DebugSignInCubit cubit) => cubit.state.signInAction.isLoading,
    );

    return BaseButton(
      text: 'Sign in',
      isLoading: isLoading,
      onPressed: context.read<DebugSignInCubit>().signIn,
    );
  }
}

class const _SignUpButton() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseButton(
      text: 'Create account',
      variant: .secondary,
      onPressed: context.read<DebugSignInCubit>().signUp,
    );
  }
}
