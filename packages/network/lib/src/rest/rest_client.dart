import 'package:dio/dio.dart';

abstract interface class RestClient() {
  Future<Response<T>> get<T>(String path, {Object? data, Map<String, dynamic>? queryParameters});
  Future<Response<T>> put<T>(String path, {Object? data, Map<String, dynamic>? queryParameters});
  Future<Response<T>> post<T>(String path, {Object? data, Map<String, dynamic>? queryParameters});
  Future<Response<T>> patch<T>(String path, {Object? data, Map<String, dynamic>? queryParameters});
  Future<Response<T>> delete<T>(String path, {Object? data, Map<String, dynamic>? queryParameters});
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
}
