import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/account/presentation/delete_account/cubit/delete_account_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class const DeleteAccountPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<DeleteAccountCubit>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.account.deleteAccount;
    final deletion = context.select((DeleteAccountCubit cubit) => cubit.state.deletion);

    return BaseView(
      body: BlocListener<DeleteAccountCubit, DeleteAccountState>(
        listenWhen: (previous, current) => previous.deletion != current.deletion,
        listener: (context, state) {
          switch (state.deletion) {
            case Success():
              BaseToast.show(context, l10n.messageSuccess);
              context.router.replaceAll([const LoginRoute()]);
            case Failure(:final LocalizedException exception):
              BaseToast.show(context, l10n.errors.selectOrFallback(exception.l10nKey));
            default:
              break;
          }
        },
        child: BaseFlowContent(
          heading: l10n.title,
          content: Text(
            l10n.warning,
            style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
          ),
          primaryAction: BaseButton.destructive(
            text: l10n.buttonDelete,
            isLoading: deletion.isLoading,
            isEnabled: deletion is! Loading,
            onPressed: context.read<DeleteAccountCubit>().deleteAccount,
          ),
          secondaryAction: BaseButton.text(
            text: l10n.buttonCancel,
            onPressed: () => context.router.maybePop(),
          ),
        ),
      ),
    );
  }
}
