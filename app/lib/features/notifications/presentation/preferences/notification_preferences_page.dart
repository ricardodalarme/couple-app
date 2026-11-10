import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notifications/data/models/notification_preferences.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/preferences/cubit/notification_preferences_cubit.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/preferences/widgets/notification_preferences_content.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const NotificationPreferencesPage({super.key})
    extends StatefulWidget
    implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<NotificationPreferencesCubit>()..load(),
      child: this,
    );
  }

  @override
  State<NotificationPreferencesPage> createState() => _NotificationPreferencesPageState();
}

class _NotificationPreferencesPageState()
    extends State<NotificationPreferencesPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<NotificationPreferencesCubit>().refreshAccess();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.notificationPreferences;
    final preferences = context.select(
      (NotificationPreferencesCubit cubit) => cubit.state.preferences,
    );

    return BaseView(
      body: BlocListener<NotificationPreferencesCubit, NotificationPreferencesState>(
        listenWhen: (previous, current) => previous.saveAction != current.saveAction,
        listener: _onSaveChanged,
        child: SkeletonizerResourceWidget<NotificationPreferences>(
          preferences,
          fakeValue: NotificationPreferences.fake(),
          successBuilder: (_) => const NotificationPreferencesContent(),
          failureBuilder: (_) => BaseEmptyState(
            title: l10n.loadErrorTitle,
            text: l10n.loadErrorText,
            actionText: context.l10n.common.retry,
            onAction: context.read<NotificationPreferencesCubit>().load,
          ),
        ),
      ),
    );
  }

  void _onSaveChanged(BuildContext context, NotificationPreferencesState state) {
    final action = state.saveAction;
    if (action is Failure) {
      BaseToast.show(
        context,
        context.l10n.notificationPreferences.errors.selectOrFallback(action.exception.l10nKey),
      );
    }
  }
}
