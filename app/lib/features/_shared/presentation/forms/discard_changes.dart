import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Asks before throwing away text the person wrote but did not save.
Future<bool> confirmDiscard(BuildContext context, {required String title, required String text}) {
  final l10n = context.l10n.common;

  return BaseConfirmSheet.show(
    context: context,
    title: title,
    text: text,
    confirmText: l10n.discard,
    cancelText: l10n.keepWriting,
    isDestructive: true,
  );
}

/// Blocks leaving a dirty form until the person confirms the discard.
class const DirtyFormGuard({
  required final bool isDirty,
  required final String title,
  required final String text,
  required final Widget child,
  super.key,
}) extends StatefulWidget {
  @override
  State<DirtyFormGuard> createState() => _DirtyFormGuardState();
}

class _DirtyFormGuardState() extends State<DirtyFormGuard> {
  bool _isDiscarding = false;

  @override
  Widget build(BuildContext context) {
    return PopScope<Object?>(
      canPop: !widget.isDirty || _isDiscarding,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop || _isDiscarding) return;
        final shouldDiscard = await confirmDiscard(context, title: widget.title, text: widget.text);
        if (!shouldDiscard || !context.mounted) return;

        setState(() => _isDiscarding = true);
        Navigator.of(context).pop(result);
      },
      child: widget.child,
    );
  }
}
