import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/sign_in/cubit/sign_in_cubit.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/sign_in/widgets/provider_buttons.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const ExistingAccountPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<SignInCubit>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.authentication;

    return BaseView(
      body: BlocListener<SignInCubit, SignInState>(
        listenWhen: (previous, current) => previous.signInAction != current.signInAction,
        listener: (context, state) {
          if (state.signInAction case Failure(:final exception)) {
            BaseToast.show(context, l10n.errors.selectOrFallback(exception.l10nKey));
          }
        },
        child: BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(l10n.existingAccountTitle, style: context.text.titleXl),
              const SizedBox(height: AppSpace.s8),
              Text(
                l10n.existingAccountSubtitle,
                style: context.text.body.copyWith(color: context.colors.textSecondary),
              ),
              const SizedBox(height: AppSpace.s28),
              const ProviderButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
