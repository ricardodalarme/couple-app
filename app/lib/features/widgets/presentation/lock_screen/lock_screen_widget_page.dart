import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/lock_screen/cubit/lock_screen_widget_cubit.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/lock_screen/widgets/lock_screen_preview_section.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// Lock-screen widget screen (`X-148`): iOS accessory families preview, pause status,
/// zero personal names/messages rule, and honest Android explanation.
@RoutePage()
class const LockScreenWidgetPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<LockScreenWidgetCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;
    final overviewResource = context.select((LockScreenWidgetCubit cubit) => cubit.state.overview);
    final cubit = context.read<LockScreenWidgetCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.lockScreenPageTitle),
      body: BaseStackedContent(
        footer: BaseButton(
          text: l10n.howToAddAction,
          onPressed: () => context.pushRoute(const WidgetHowToAddRoute()),
        ),
        body: SkeletonizerResourceWidget<WidgetOverview>(
          overviewResource,
          fakeValue: WidgetOverview.fake(),
          failureBuilder: (_) => BaseEmptyState(
            title: l10n.loadErrorTitle,
            text: l10n.loadErrorBody,
            actionText: l10n.retryAction,
            onAction: cubit.load,
          ),
          successBuilder: (overview) => LockScreenPreviewSection(payload: overview.payload),
        ),
      ),
    );
  }
}
