import 'dart:async';

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:network/network.dart';

/// The shared failure surface: one layout, copy chosen from the stable code, and a retry that
/// backs off after repeated failures.
class const AppErrorView({
  required final LocalizedException exception,
  required final VoidCallback onRetry,
  super.key,
}) extends StatefulWidget {
  @override
  State<AppErrorView> createState() => _AppErrorViewState();
}

class _AppErrorViewState() extends State<AppErrorView> {
  int _attempts = 0;
  int _cooldownSeconds = 0;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.globalErrors;
    final copy = _copy(l10n);

    return BaseEmptyState(
      face: FaceKind.sad,
      title: copy.title,
      text: copy.text,
      actionText: _cooldownSeconds > 0 ? l10n.retryIn(seconds: _cooldownSeconds) : l10n.retry,
      onAction: _cooldownSeconds > 0 ? null : _retry,
    );
  }

  ({String title, String text}) _copy(Translations$globalErrors$pt l10n) =>
      switch (widget.exception.l10nKey) {
        networkErrorCode => (title: l10n.networkTitle, text: l10n.networkText),
        timeoutErrorCode => (title: l10n.timeoutTitle, text: l10n.timeoutText),
        'RATE_LIMITED' => (title: l10n.rateTitle, text: l10n.rateText),
        'NOT_FOUND' ||
        'CARD_NOT_FOUND' ||
        'SLIP_NOT_FOUND' => (title: l10n.notFoundTitle, text: l10n.notFoundText),
        _ => (title: l10n.errorTitle, text: l10n.errorText),
      };

  void _retry() {
    widget.onRetry();
    final next = _attempts + 1;
    _attempts = next;
    final seconds = 1 << (next - 1).clamp(0, 3);
    _startCooldown(seconds > 8 ? 8 : seconds);
  }

  void _startCooldown(int seconds) {
    _timer?.cancel();
    setState(() => _cooldownSeconds = seconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() => _cooldownSeconds--);
      if (_cooldownSeconds <= 0) timer.cancel();
    });
  }
}
