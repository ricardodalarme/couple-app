import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/unpair/cubit/unpair_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class const UnpairPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<UnpairCubit>()..loadPartner(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.unpair;
    final partnerName = context.select((UnpairCubit cubit) => cubit.state.partnerName);
    final action = context.select((UnpairCubit cubit) => cubit.state.unpairAction);
    final name = partnerName ?? l10n.unnamedPartner;

    return BaseView(
      appBar: BaseAppBar(title: l10n.appBarTitle),
      body: BlocListener<UnpairCubit, UnpairState>(
        listenWhen: (previous, current) => previous.unpairAction != current.unpairAction,
        listener: (context, state) {
          switch (state.unpairAction) {
            case Success<void>():
              context.router.replace(const UnpairDoneRoute());
            case Failure(:final exception):
              BaseToast.show(context, l10n.errors.selectOrFallback(exception.l10nKey));
            case Initial() || Loading():
              break;
          }
        },
        child: BaseFlowContent(
          heading: l10n.title(name: name),
          highlightedWord: name,
          subtitle: l10n.text,
          content: const SizedBox.shrink(),
          primaryAction: BaseButton(
            text: l10n.confirm,
            variant: .destructive,
            isLoading: action.isLoading,
            onPressed: action.isLoading ? null : () => _confirm(context, name),
          ),
          secondaryAction: BaseButton(
            text: l10n.cancel,
            variant: .secondary,
            onPressed: context.router.maybePop,
          ),
        ),
      ),
    );
  }

  Future<void> _confirm(BuildContext context, String name) async {
    final l10n = context.l10n.unpair;
    final confirmed = await BaseConfirmSheet.show(
      context: context,
      title: l10n.title(name: name),
      text: l10n.text,
      confirmText: l10n.confirm,
      cancelText: l10n.cancel,
      isDestructive: true,
    );
    if (confirmed && context.mounted) await context.read<UnpairCubit>().unpair();
  }
}
