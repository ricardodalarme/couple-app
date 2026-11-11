import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/configure/cubit/widget_configure_cubit.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/configure/widgets/configure_form_section.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Widget configuration screen (`X-154`): content source, photo rotation cadence,
/// and privacy toggles (`widget_show_names`, `widget_in_discreet`, `widget_allow_partner_notes`).
@RoutePage()
class const WidgetConfigurePage({final WidgetFamilyKind? initialFamily, super.key})
    extends StatelessWidget
    implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<WidgetConfigureCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;
    final overviewResource = context.select((WidgetConfigureCubit cubit) => cubit.state.overview);
    final isSaving = context.select(
      (WidgetConfigureCubit cubit) => cubit.state.saveAction is Loading,
    );
    final cubit = context.read<WidgetConfigureCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.configureTitle),
      body: BlocListener<WidgetConfigureCubit, WidgetConfigureState>(
        listenWhen: (previous, current) => previous.saveAction != current.saveAction,
        listener: (context, state) {
          switch (state.saveAction) {
            case Success():
              BaseToast.show(context, l10n.configureSavedToast);
              context.maybePop(true);
            case Failure(:final exception):
              BaseToast.show(context, l10n.errors.selectOrFallback(exception.l10nKey));
            case Initial() || Loading():
              break;
          }
        },
        child: BaseStackedContent(
          footer: BaseButton(text: l10n.configureSave, isLoading: isSaving, onPressed: cubit.save),
          body: SkeletonizerResourceWidget<WidgetOverview>(
            overviewResource,
            fakeValue: WidgetOverview.fake(),
            failureBuilder: (_) => BaseEmptyState(
              title: l10n.loadErrorTitle,
              text: l10n.loadErrorBody,
              actionText: l10n.retryAction,
              onAction: cubit.load,
            ),
            successBuilder: (overview) =>
                ConfigureFormSection(payload: overview.payload, initialFamily: initialFamily),
          ),
        ),
      ),
    );
  }
}
