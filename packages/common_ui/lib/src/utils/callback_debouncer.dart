import 'dart:async';

import 'package:flutter/foundation.dart';

/// Coalesces repeated calls into one, [delay] after the last request.
class CallbackDebouncer(final Duration delay) {
  Timer? _timer;

  /// Schedules [callback], replacing any pending call.
  void call(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  /// Cancels a pending call without running it.
  void cancel() {
    _timer?.cancel();
    _timer = null;
  }

  /// Releases the timer; the instance cannot be used afterwards.
  void dispose() => cancel();
}
