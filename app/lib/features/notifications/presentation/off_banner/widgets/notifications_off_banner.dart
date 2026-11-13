import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/off_banner/cubit/notifications_off_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// A quiet notice that reminders are off.
class const NotificationsOffBanner({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<NotificationsOffCubit>()..start(),
      child: const _Banner(),
    );
  }
}

class const _Banner() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.notificationPermission;
    final isVisible = context.select((NotificationsOffCubit cubit) => cubit.state.isVisible);
    if (!isVisible) return const SizedBox.shrink();

    final cubit = context.read<NotificationsOffCubit>();

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpace.s12),
      child: BaseBanner(
        text: l10n.offBanner,
        variant: BaseBannerVariant.notice,
        icon: AppIcons.bell_off,
        actionLabel: l10n.openSettings,
        onAction: cubit.openSettings,
        onDismiss: cubit.dismiss,
        dismissLabel: l10n.close,
        isCompact: true,
      ),
    );
  }
}
