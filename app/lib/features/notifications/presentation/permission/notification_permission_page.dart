import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/permission/cubit/notification_permission_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Explains the reminders before the system prompt; pops when the person has answered.
@RoutePage()
class const NotificationPermissionPage({super.key})
    extends StatelessWidget
    implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<NotificationPermissionCubit>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.notificationPermission;
    final isLoading = context.select(
      (NotificationPermissionCubit cubit) => cubit.state.requestAction.isLoading,
    );

    return BaseView(
      appBar: null,
      body: BlocListener<NotificationPermissionCubit, NotificationPermissionState>(
        listenWhen: (previous, current) => previous.requestAction != current.requestAction,
        listener: (context, state) {
          if (state.requestAction is Success || state.requestAction is Failure) {
            context.router.maybePop();
          }
        },
        child: BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppSpace.s34),
              Text(
                l10n.label,
                style: context.text.label.copyWith(color: context.colors.accentLabel),
              ),
              const SizedBox(height: AppSpace.s8),
              Semantics(
                header: true,
                child: AppHighlightedText(
                  text: l10n.title,
                  highlight: l10n.titleHighlight,
                  style: context.text.display,
                ),
              ),
              const SizedBox(height: AppSpace.s24),
              for (final point in [l10n.pointLimit, l10n.pointPrivate, l10n.pointChoice]) ...[
                BaseSurfaceCard(child: Text(point, style: context.text.bodyLg)),
                const SizedBox(height: AppSpace.s10),
              ],
              const SizedBox(height: AppSpace.s6),
              BaseNote(text: l10n.changeLater),
            ],
          ),
          footer: Row(
            children: [
              BaseButton(
                text: l10n.notNow,
                variant: .text,
                isFullWidth: false,
                onPressed: () => context.router.maybePop(),
              ),
              const SizedBox(width: AppSpace.s12),
              Expanded(
                child: BaseButton(
                  text: l10n.allow,
                  isLoading: isLoading,
                  onPressed: context.read<NotificationPermissionCubit>().allow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
