import 'dart:async';

import 'package:graphql/client.dart';

/// Raised when a request gets no response within its time limit.
class const RequestTimeoutException(final Duration timeout) extends LinkException {
  this : super(null, null);

  @override
  String toString() => 'RequestTimeoutException(no response within $timeout)';
}

/// Fails a query or mutation that produces no response within its time limit.
///
/// The client's own `queryRequestTimeout` completes the request from the first event but still
/// forwards a late response into the finished request, which throws `Bad state: Future already
/// completed`. This link owns the deadline instead: the first response, error or timeout settles the
/// request and cancels the source, so nothing can complete it twice. Subscriptions are not limited.
class TimeoutLink({required final Duration queryTimeout, required final Duration mutationTimeout})
    extends Link {
  @override
  Stream<Response> request(Request request, [NextLink? forward]) {
    final source = forward!(request);
    if (request.isSubscription) return source;

    return _withTimeout(source, request.isMutation ? mutationTimeout : queryTimeout);
  }

  Stream<Response> _withTimeout(Stream<Response> source, Duration timeout) {
    late final StreamController<Response> controller;
    StreamSubscription<Response>? subscription;
    Timer? timer;
    var isSettled = false;

    void settle({Response? response, Object? error, StackTrace? stackTrace}) {
      if (isSettled) return;
      isSettled = true;
      timer?.cancel();
      timer = null;
      if (error != null) {
        controller.addError(error, stackTrace);
      } else if (response != null) {
        controller.add(response);
      }
      unawaited(controller.close());
      unawaited(subscription?.cancel());
    }

    controller = StreamController<Response>(
      onListen: () {
        final sub = source.listen(
          (response) => settle(response: response),
          onError: (Object error, StackTrace stackTrace) =>
              settle(error: error, stackTrace: stackTrace),
          onDone: settle,
        );
        subscription = sub;
        if (isSettled) {
          // A synchronous source event settled the request before the subscription was assigned.
          unawaited(sub.cancel());
        } else {
          timer = Timer(timeout, () => settle(error: RequestTimeoutException(timeout)));
        }
      },
      onCancel: () {
        isSettled = true;
        timer?.cancel();
        return subscription?.cancel();
      },
    );

    return controller.stream;
  }
}
