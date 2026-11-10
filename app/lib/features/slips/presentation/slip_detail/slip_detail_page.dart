import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_detail.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slip_detail/cubit/slip_detail_cubit.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slip_detail/widgets/slip_detail_content.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const SlipDetailPage({@PathParam('id') required final String id, super.key})
    extends StatelessWidget
    implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<SlipDetailCubit>()..load(id),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.slipDetail;
    final slip = context.select((SlipDetailCubit cubit) => cubit.state.slip);

    return BaseView(
      body: MultiBlocListener(
        listeners: [
          BlocListener<SlipDetailCubit, SlipDetailState>(
            listenWhen: (previous, current) => previous.saveAction != current.saveAction,
            listener: _onSaveChanged,
          ),
          BlocListener<SlipDetailCubit, SlipDetailState>(
            listenWhen: (previous, current) => previous.deleteAction != current.deleteAction,
            listener: _onDeleteChanged,
          ),
        ],
        child: SkeletonizerResourceWidget<SlipDetail?>(
          slip,
          fakeValue: SlipDetail.fake(),
          successBuilder: (value) => value == null
              ? BaseEmptyState(title: l10n.notFoundTitle, text: l10n.notFoundText)
              : const SlipDetailContent(),
          failureBuilder: (_) => BaseEmptyState(
            title: l10n.errorTitle,
            text: l10n.errorText,
            actionText: context.l10n.common.retry,
            onAction: () => context.read<SlipDetailCubit>().load(id),
          ),
        ),
      ),
    );
  }

  void _onSaveChanged(BuildContext context, SlipDetailState state) {
    final l10n = context.l10n.slipDetail;
    final action = state.saveAction;
    if (action is Failure) {
      BaseToast.show(context, l10n.errors.selectOrFallback(action.exception.l10nKey));
    } else if (action is Success) {
      final slip = state.current;
      final text = slip != null && slip.isArchived ? l10n.archivedToast : l10n.saved;
      BaseToast.show(context, text);
    }
  }

  void _onDeleteChanged(BuildContext context, SlipDetailState state) {
    final l10n = context.l10n.slipDetail;
    final action = state.deleteAction;
    if (action is Failure) {
      BaseToast.show(context, l10n.errors.selectOrFallback(action.exception.l10nKey));
    } else if (action is Success) {
      BaseToast.show(context, l10n.deleted);
      context.router.maybePop();
    }
  }
}
