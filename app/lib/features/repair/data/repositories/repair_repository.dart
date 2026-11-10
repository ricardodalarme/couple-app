import 'package:flutter_bloc_starter/features/repair/data/data_sources/repair_data_source.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/repair_path.dart';
import 'package:logger/logger.dart';

class RepairRepository({required final RepairDataSource _dataSource}) {
  final Logger _logger = Logger('RepairRepository');

  /// Stores the private temperature answer.
  Future<void> recordTemperature(String level) async {
    try {
      await _dataSource.recordTemperature(level);
    } catch (e, stack) {
      _logger.error('Failed to record the temperature', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Sends the partner a short repair message; [preset] names a ready-made one, if used.
  Future<void> sendRepair({required String message, String? preset}) async {
    try {
      await _dataSource.sendRepair(body: message.trim(), value: preset);
    } catch (e, stack) {
      _logger.error('Failed to send a repair message', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Starts a private repair session with the chosen [path]; the client [id] makes retries safe.
  Future<void> startSession({
    required String id,
    required RepairPath path,
    required int intensity,
  }) async {
    try {
      await _dataSource.startSession(id: id, path: path.key, intensity: intensity);
    } catch (e, stack) {
      _logger.error('Failed to start a repair session', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
