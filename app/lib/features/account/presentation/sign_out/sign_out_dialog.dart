import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/account/presentation/sign_out/cubit/sign_out_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Asks how to leave: keep the local copy or erase everything on this device.
Future<void> showSignOutDialog(BuildContext context) async {
  final l10n = context.l10n.account;
  final cubit = AppInjector.instance.get<SignOutCubit>()..load();

  final choice = await BaseDialog.show<bool>(
    context: context,
    title: l10n.signOutTitle,
    text: cubit.state.pendingSlips > 0
        ? l10n.signOutPending(count: cubit.state.pendingSlips)
        : l10n.signOutText,
    primaryText: l10n.signOut,
    primaryResult: false,
    secondaryText: l10n.signOutRemove,
    secondaryResult: true,
  );
  if (choice == null) return;

  await cubit.signOut(removeLocalData: choice);
}
