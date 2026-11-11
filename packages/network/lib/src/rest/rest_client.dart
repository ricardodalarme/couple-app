import 'dart:convert';

import 'package:dio/dio.dart';

abstract interface class RestClient() {
  Future<Response<T>> get<T>(String path, {Object? data, Map<String, dynamic>? queryParameters});
  Future<Response<T>> put<T>(String path, {Object? data, Map<String, dynamic>? queryParameters});
  Future<Response<T>> post<T>(String path, {Object? data, Map<String, dynamic>? queryParameters});
  Future<Response<T>> patch<T>(String path, {Object? data, Map<String, dynamic>? queryParameters});
  Future<Response<T>> delete<T>(String path, {Object? data, Map<String, dynamic>? queryParameters});

  /// Sends a POST and yields the response body line by line as it arrives.
  ///
  /// The lines are yielded for any status code, so a caller that reads an error body can do so; closing
  /// the subscription cancels the request.
  Stream<String> postLines(String path, {Object? data, Map<String, String>? headers});
}

class const RestClientImpl._(final Dio _client) implements RestClient {
  factory({required String baseUrl}) {
    return RestClientImpl._(Dio(BaseOptions(baseUrl: baseUrl)));
  }

  @override
  Future<Response<T>> get<T>(String path, {Object? data, Map<String, dynamic>? queryParameters}) {
    return _client.get(path, queryParameters: queryParameters, data: data);
  }

  @override
  Future<Response<T>> post<T>(String path, {Object? data, Map<String, dynamic>? queryParameters}) {
    return _client.post(path, queryParameters: queryParameters, data: data);
  }

  @override
  Future<Response<T>> put<T>(String path, {Object? data, Map<String, dynamic>? queryParameters}) {
    return _client.put(path, queryParameters: queryParameters, data: data);
  }

  @override
  Future<Response<T>> patch<T>(String path, {Object? data, Map<String, dynamic>? queryParameters}) {
    return _client.patch(path, queryParameters: queryParameters, data: data);
  }

  @override
  Future<Response<T>> delete<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) {
    return _client.delete(path, queryParameters: queryParameters, data: data);
  }

  @override
  Stream<String> postLines(String path, {Object? data, Map<String, String>? headers}) async* {
    final cancel = CancelToken();
    try {
      final response = await _client.post<ResponseBody>(
        path,
        data: data,
        cancelToken: cancel,
        options: Options(
          responseType: ResponseType.stream,
          headers: headers,
          validateStatus: (_) => true,
        ),
      );
      yield* response.data!.stream
          .cast<List<int>>()
          .transform(utf8.decoder)
          .transform(const LineSplitter());
    } finally {
      cancel.cancel();
    }
  }
}
