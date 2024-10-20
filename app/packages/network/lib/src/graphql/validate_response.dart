import 'package:graphql/client.dart' hide UnknownException;
import 'package:network/src/exceptions/no_data_exception.dart';
import 'package:network/src/exceptions/server_response_exception.dart';

void validateResponse(QueryResult response) {
  final exception = response.exception;
  if (exception == null) {
    return;
  }

  final firstError = exception.graphqlErrors.firstOrNull;
  final code = firstError?.extensions?['code']?.toString();

  throw ServerResponseException(code, exception);
}

D validateResponseData<T, D>(
  QueryResult<T> response, {
  required D? Function(T?) getData,
}) {
  validateResponse(response);

  final data = getData(response.parsedData);
  if (data == null) {
    throw const NoDataException();
  }
  return data;
}
