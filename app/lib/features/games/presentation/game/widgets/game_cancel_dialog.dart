import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/cubit/game_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Asks for confirmation, then cancels the open session for both people.
Future<void> confirmCancelGame(BuildContext context) async {
  final l10n = context.l10n.games.cancel;
  final cubit = context.read<GameCubit>();
  final confirmed = await BaseConfirmSheet.show(
    context: context,
    title: l10n.title,
    text: l10n.text,
    confirmText: l10n.confirm,
    cancelText: l10n.keep,
    isDestructive: true,
  );
  if (confirmed) await cubit.cancel();
}
