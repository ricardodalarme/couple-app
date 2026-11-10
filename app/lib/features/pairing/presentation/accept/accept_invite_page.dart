import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/accept/cubit/accept_invite_cubit.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/accept/widgets/accept_invite_connected.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/accept/widgets/accept_invite_form.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/accept/widgets/accept_invite_unusable.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const AcceptInvitePage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<AcceptInviteCubit>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final action = context.select((AcceptInviteCubit cubit) => cubit.state.acceptAction);

    return BaseView(
      appBar: action is Success<AcceptOutcome> && action.value == AcceptOutcome.connected
          ? null
          : const BaseAppBar(),
      body: BlocListener<AcceptInviteCubit, AcceptInviteState>(
        listenWhen: (previous, current) => previous.acceptAction != current.acceptAction,
        listener: (context, state) {
          if (state.acceptAction case Failure(:final exception)) {
            BaseToast.show(
              context,
              context.l10n.acceptInvite.errors.selectOrFallback(exception.l10nKey),
            );
          }
        },
        child: switch (action) {
          Success<AcceptOutcome>(value: AcceptOutcome.connected) => const AcceptInviteConnected(),
          Success<AcceptOutcome>() => const AcceptInviteUnusable(),
          _ => const AcceptInviteForm(),
        },
      ),
    );
  }
}
