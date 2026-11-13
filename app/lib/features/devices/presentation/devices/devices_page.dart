import 'package:auto_route/auto_route.dart';
import 'package:clock/clock.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/_shared/presentation/errors/app_error_view.dart';
import 'package:flutter_bloc_starter/features/devices/data/models/device.dart';
import 'package:flutter_bloc_starter/features/devices/presentation/devices/cubit/devices_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:formatters/formatters.dart';

/// The devices that receive notifications for the account.
@RoutePage()
class const DevicesPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<DevicesCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.devices;
    final devices = context.select((DevicesCubit cubit) => cubit.state.devices);
    final isRevoking = context.select((DevicesCubit cubit) => cubit.state.revokeAction.isLoading);
    final cubit = context.read<DevicesCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.title),
      body: BlocListener<DevicesCubit, DevicesState>(
        listenWhen: (previous, current) => previous.revokeAction != current.revokeAction,
        listener: (context, state) {
          final action = state.revokeAction;
          if (action is Success) BaseToast.show(context, l10n.revoked);
          if (action is Failure) {
            BaseToast.show(
              context,
              l10n.errors.selectOrFallback(action.exception.l10nKey),
              variant: BaseToastVariant.error,
            );
          }
        },
        child: BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.subtitle,
                style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
              ),
              const SizedBox(height: AppSpace.s16),
              SkeletonizerResourceWidget<List<Device>>(
                devices,
                fakeValue: [Device.fake(), Device.fake()],
                successBuilder: (items) => items.isEmpty
                    ? BaseEmptyState(title: l10n.emptyTitle, text: l10n.emptyText)
                    : BaseListGroup(
                        children: [
                          for (final device in items)
                            _DeviceTile(device: device, isRevoking: isRevoking),
                        ],
                      ),
                failureBuilder: (exception) =>
                    AppErrorView(exception: exception, onRetry: cubit.load),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class const _DeviceTile({required final Device device, required final bool isRevoking})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.devices;
    final name = _name(l10n);

    return BaseListTile(
      icon: AppIcons.smartphone,
      title: name,
      subtitle: _registered(l10n),
      trailing: device.isCurrent ? BaseTag(text: l10n.current) : null,
      isEnabled: !isRevoking,
      showsChevron: !device.isCurrent,
      onTap: device.isCurrent || isRevoking ? null : () => _confirmRevoke(context, name),
    );
  }

  String _name(Translations$devices$pt l10n) {
    final label = device.label;
    if (label != null && label.isNotEmpty) return label;

    return device.platform == 'ios' ? l10n.platformIos : l10n.platformAndroid;
  }

  String _registered(Translations$devices$pt l10n) {
    final local = device.lastSeenAt.toLocal();
    final now = clock.now();
    final today = DateTime(now.year, now.month, now.day);
    final day = DateTime(local.year, local.month, local.day);

    if (day == today) return l10n.registeredToday(time: DateFormatters.shortTime(local));
    if (day == today.subtract(const Duration(days: 1))) {
      return l10n.registeredYesterday(time: DateFormatters.shortTime(local));
    }

    return l10n.registeredOn(date: DateFormatters.mediumDate(local));
  }

  Future<void> _confirmRevoke(BuildContext context, String name) async {
    final l10n = context.l10n.devices;
    final cubit = context.read<DevicesCubit>();
    final confirmed = await BaseConfirmSheet.show(
      context: context,
      title: l10n.revokeTitle,
      text: l10n.revokeText(name: name),
      confirmText: l10n.revokeConfirm,
      isDestructive: true,
    );
    if (confirmed && context.mounted) await cubit.revoke(device);
  }
}
