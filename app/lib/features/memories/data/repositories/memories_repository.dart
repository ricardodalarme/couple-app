import 'package:flutter_bloc_starter/features/memories/data/data_sources/memories_data_source.dart';
import 'package:flutter_bloc_starter/features/memories/data/models/memory.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:logger/logger.dart';

class MemoriesRepository({
  required final MemoriesDataSource _dataSource,
  required final TogetherRepository _togetherRepository,
}) {
  final Logger _logger = Logger('MemoriesRepository');

  Future<List<Memory>> getMemories() => _run(
    'read memories',
    () async => [
      for (final node in await _dataSource.getMemories())
        Memory(id: node.id, title: node.title, body: node.body, happenedOn: node.happenedOn),
    ],
  );

  /// Saves a memory shared with the partner when there is one; the client [id] makes retries safe.
  Future<void> addMemory({
    required String id,
    required String title,
    required DateTime happenedOn,
    String? body,
  }) => _run(
    'add a memory',
    () async => _dataSource.addMemory(
      id: id,
      title: title.trim(),
      body: body == null || body.trim().isEmpty ? null : body.trim(),
      happenedOn: DateTime(happenedOn.year, happenedOn.month, happenedOn.day),
      coupleId: await _togetherRepository.getCoupleId(),
    ),
  );

  Future<void> deleteMemory(String id) =>
      _run('delete a memory', () => _dataSource.deleteMemory(id));

  /// The text of one random slip from the jar, or null when it is empty.
  Future<String?> drawFromJar() => _run('draw from the jar', _dataSource.drawFromJar);

  Future<T> _run<T>(String what, Future<T> Function() action) async {
    try {
      return await action();
    } catch (e, stack) {
      _logger.error('Failed to $what', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
