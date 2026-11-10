import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slip_kind/cubit/slip_kind_cubit.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slip_kind/widgets/slip_kind_form.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slip_kind/widgets/slip_kind_saved.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const SlipKindPage({
  @QueryParam('kind') final String kind = 'specific',
  @QueryParam('text') final String text = '',
  super.key,
}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<SlipKindCubit>()..start(kind: kind, text: text),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isSaved = context.select((SlipKindCubit cubit) => cubit.state.saveAction is Success);

    return BaseView(
      appBar: BaseAppBar(onClose: () => context.router.maybePop()),
      body: BlocListener<SlipKindCubit, SlipKindState>(
        listenWhen: (previous, current) => previous.saveAction != current.saveAction,
        listener: _onStateChanged,
        child: isSaved ? const SlipKindSaved() : const SlipKindForm(),
      ),
    );
  }

  void _onStateChanged(BuildContext context, SlipKindState state) {
    final action = state.saveAction;
    if (action is! Failure) return;

    BaseToast.show(
      context,
      context.l10n.slipKind.errors.selectOrFallback(action.exception.l10nKey),
    );
  }
}
