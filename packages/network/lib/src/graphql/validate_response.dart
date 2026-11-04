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

  final firstError = exception.graphqlErrors.firstOrNull;
  final code =
      firstError?.extensions?['code']?.toString() ??
      firstError?.extensions?['error_code']?.toString() ??
      firstError?.message;

  return ServerResponseException(code, exception);
}

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
