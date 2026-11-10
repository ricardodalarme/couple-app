import 'package:flutter_bloc_starter/features/ideas/data/data_sources/ideas_data_source.dart';
import 'package:flutter_bloc_starter/features/ideas/data/data_sources/ideas_local_data_source.dart';
import 'package:flutter_bloc_starter/features/ideas/data/models/idea.dart';
import 'package:logger/logger.dart';

class IdeasRepository({
  required final IdeasDataSource _dataSource,
  required final IdeasLocalDataSource _localDataSource,
}) {
  final Logger _logger = Logger('IdeasRepository');

  /// The ideas for [locale] in editorial order.
  Future<List<Idea>> getIdeas(String locale) async {
    try {
      final result = await _dataSource.getIdeas(locale);

      return [
        for (final edge in result.edges)
          Idea(
            slug: edge.node.slug,
            title: edge.node.title,
            body: edge.node.body,
            tags: edge.node.tags.whereType<String>().toList(),
          ),
      ];
    } catch (e, stack) {
      _logger.error('Failed to load ideas', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Marks an idea as done; doing it again changes nothing.
  Future<void> markDone(String slug) {
    final done = _localDataSource.readDone();
    if (!done.add(slug)) return Future.value();

    return _localDataSource.writeDone(done);
  }

  bool isDone(String slug) => _localDataSource.readDone().contains(slug);
}
