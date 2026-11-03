import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract interface class ConnectivityService() {
  Stream<bool> get onStatusChange;

  Future<bool> get hasInternetAccess;

  Future<void> dispose();
}

class InternetConnectivityService([InternetConnection? connection]) implements ConnectivityService {
  final InternetConnection _connection =
      connection ??
      InternetConnection.createInstance(triggerStream: Connectivity().onConnectivityChanged);

  @override
  Stream<bool> get onStatusChange =>
      _connection.onStatusChange.map((status) => status == InternetStatus.connected);

  @override
  Future<bool> get hasInternetAccess => _connection.hasInternetAccess;

  @override
  Future<void> dispose() => _connection.dispose();
}
