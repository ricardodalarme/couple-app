import 'package:graphql/client.dart' hide UnknownException;
import 'package:network/src/exceptions/no_data_exception.dart';
import 'package:network/src/exceptions/server_response_exception.dart';

void validateResponse(QueryResult response) {
  final mapped = mapResponseException(response);
  if (mapped != null) {
    throw mapped;
  }
}

ServerResponseException? mapResponseException(QueryResult response) {
  final exception = response.exception;
  if (exception == null) {
    return null;
  }

  if (exception.linkException != null && exception.graphqlErrors.isEmpty) {
    final link = exception.linkException.toString().toLowerCase();

    return ServerResponseException(
      link.contains('timeout') ? timeoutErrorCode : networkErrorCode,
      exception,
    );
  }

  final firstError = exception.graphqlErrors.firstOrNull;
  final message = firstError?.message;
  final code = message != null && _stableCode.hasMatch(message)
      ? message
      : firstError?.extensions?['code']?.toString() ??
            firstError?.extensions?['error_code']?.toString() ??
            message;

  return ServerResponseException(code, exception);
}

/// The code reported when the request never reached the server.
const String networkErrorCode = 'NETWORK';

/// The code reported when the request reached the server too late.
const String timeoutErrorCode = 'TIMEOUT';

final RegExp _stableCode = RegExp(r'^[A-Z][A-Z0-9_]+$');

D validateResponseData<T, D>(QueryResult<T> response, {D? Function(T data)? getData}) {
  validateResponse(response);

  final parsedData = response.parsedData;
  if (parsedData == null) {
    throw const NoDataException();
  }

  if (getData != null) {
    final data = getData(parsedData);
    if (data == null) {
      throw const NoDataException();
    }
    return data;
  }

  return parsedData as D;
}

extension WatchQueryStreamX<T> on Stream<T> {
  Stream<R> mapData<R>(R? Function(T data) select) => map((data) {
    final result = select(data);
    if (result == null) {
      throw const NoDataException();
    }
    return result;
  });
}
