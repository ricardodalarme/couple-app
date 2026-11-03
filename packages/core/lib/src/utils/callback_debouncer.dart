import 'dart:async';

class CallbackDebouncer(final Duration _delay) {
  Timer? _timer;

  void call(void Function() callback) {
    if (_delay == Duration.zero) {
      callback();
    } else {
      _timer?.cancel();
      _timer = Timer(_delay, callback);
    }
  }

  void dispose() {
    _timer?.cancel();
  }
}
