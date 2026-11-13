import 'dart:async';

import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/together_data_source.dart';
import 'package:flutter_bloc_starter/features/together/data/models/date_idea.dart';
import 'package:flutter_bloc_starter/features/together/data/models/logistic_item.dart';
import 'package:flutter_bloc_starter/features/together/data/models/ritual.dart';
import 'package:logger/logger.dart';

class TogetherRepository({required final TogetherDataSource _dataSource}) {
  final Logger _logger = Logger('TogetherRepository');
  final StreamController<void> _changes = StreamController<void>.broadcast();

  /// Emits whenever a shared item is changed on this device, so lists can read again.
  Stream<void> get onChanged => _changes.stream;

  /// The id of the couple the person is in, or null when they are on their own.
  Future<String?> getCoupleId() => _dataSource.getCoupleId();

  Future<List<LogisticItem>> getLogisticItems() async {
    try {
      return [
        for (final node in await _dataSource.getLogisticItems())
          LogisticItem(
            id: node.id,
            title: node.title,
            assigneeId: node.assigneeId,
            isDone: node.doneAt != null,
          ),
      ];
    } catch (e, stack) {
      _logger.error('Failed to read logistics', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Adds an item shared with the partner when there is one; the client [id] makes retries safe.
  Future<void> addLogisticItem({
    required String id,
    required String title,
    String? assigneeId,
  }) async {
    try {
      final coupleId = await _dataSource.getCoupleId();
      await _dataSource.addLogisticItem(
        id: id,
        title: title.trim(),
        assigneeId: assigneeId,
        coupleId: coupleId,
      );
      _changes.add(null);
    } catch (e, stack) {
      _logger.error('Failed to add a logistic item', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> setLogisticItemDone({required String id, required bool isDone, DateTime? now}) =>
      _run(
        'update a logistic item',
        () => _dataSource.setLogisticItemDone(
          id: id,
          doneAt: isDone ? (now ?? DateTime.now()) : null,
        ),
      );

  Future<void> setLogisticItemAssignee({required String id, String? assigneeId}) => _run(
    'assign a logistic item',
    () => _dataSource.setLogisticItemAssignee(id: id, assigneeId: assigneeId),
  );

  Future<void> deleteLogisticItem(String id) =>
      _run('delete a logistic item', () => _dataSource.deleteLogisticItem(id));

  Future<List<Ritual>> getRituals() async {
    try {
      return [
        for (final node in await _dataSource.getRituals())
          Ritual(
            id: node.id,
            title: node.title,
            cadence: node.cadence,
            weekday: node.weekday,
            hour: _hourOf(node.atTime),
            hasReminder: node.reminder,
            lastDoneOn: node.ritualLogsCollection?.edges.firstOrNull?.node.doneOn,
          ),
      ];
    } catch (e, stack) {
      _logger.error('Failed to read rituals', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Creates a new ritual shared with the partner, or saves the changes of an existing one.
  Future<void> saveRitual(Ritual ritual, {required bool isNew}) async {
    try {
      final time = '${ritual.hour.toString().padLeft(2, '0')}:00:00';
      final weekday = ritual.needsWeekday ? ritual.weekday : null;
      if (isNew) {
        await _dataSource.addRitual(
          id: ritual.id,
          title: ritual.title.trim(),
          cadence: ritual.cadence,
          weekday: weekday,
          atTime: time,
          reminder: ritual.hasReminder,
          coupleId: await _dataSource.getCoupleId(),
        );
      } else {
        await _dataSource.updateRitual(
          id: ritual.id,
          title: ritual.title.trim(),
          cadence: ritual.cadence,
          weekday: weekday,
          atTime: time,
          reminder: ritual.hasReminder,
        );
      }
      _changes.add(null);
    } catch (e, stack) {
      _logger.error('Failed to save a ritual', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Hides a ritual; its history stays on the server.
  Future<void> archiveRitual(String id, {required DateTime now}) =>
      _run('archive a ritual', () => _dataSource.archiveRitual(id: id, at: now));

  /// Records that the ritual happened today.
  Future<void> completeRitual(String id, {required DateTime now}) => _run(
    'complete a ritual',
    () => _dataSource.completeRitual(id: id, day: DateTime(now.year, now.month, now.day)),
  );

  Future<List<DateIdea>> getDateIdeas() async {
    try {
      return [
        for (final node in await _dataSource.getDateIdeas())
          DateIdea(
            id: node.id,
            title: node.title,
            status: node.status,
            plannedFor: node.plannedFor,
          ),
      ];
    } catch (e, stack) {
      _logger.error('Failed to read date ideas', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// The editorial ideas offered when the couple has none of its own.
  Future<List<DateIdeaSuggestion>> getDateIdeaSuggestions(String locale) async {
    try {
      return [
        for (final node in await _dataSource.getDateIdeaSuggestions(locale))
          DateIdeaSuggestion(slug: node.slug, title: node.title),
      ];
    } catch (e, stack) {
      _logger.error('Failed to read date suggestions', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Saves an idea shared with the partner; [slug] names an editorial idea it came from.
  Future<void> addDateIdea({required String id, required String title, String? slug}) async {
    try {
      await _dataSource.addDateIdea(
        id: id,
        title: title.trim(),
        slug: slug,
        coupleId: await _dataSource.getCoupleId(),
      );
      _changes.add(null);
    } catch (e, stack) {
      _logger.error('Failed to save a date idea', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Plans [idea] for [day] and adds the shared date that reminds both people.
  Future<void> planDateIdea(DateIdea idea, {required DateTime day}) async {
    try {
      await _dataSource.planDateIdea(id: idea.id, day: day);
      await _dataSource.addSharedDate(
        title: idea.title,
        day: day,
        coupleId: await _dataSource.getCoupleId(),
      );
      _changes.add(null);
    } catch (e, stack) {
      _logger.error('Failed to plan a date', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> setDateIdeaDone({required String id, required bool isDone}) => _run(
    'update a date idea',
    () => _dataSource.setDateIdeaStatus(id: id, status: isDone ? 'done' : 'saved'),
  );

  Future<void> deleteDateIdea(String id) =>
      _run('delete a date idea', () => _dataSource.deleteDateIdea(id));

  /// Editorial help content of a [kind], such as `mood_tip` or `question`, in editorial order.
  Future<List<HelpItem>> getHelpContent({required String kind, required String locale}) async {
    try {
      return [
        for (final node in await _dataSource.getHelpContent(kind: kind, locale: locale))
          HelpItem(slug: node.slug, title: node.title, body: node.body),
      ];
    } catch (e, stack) {
      _logger.error('Failed to read help content', error: e, stackTrace: stack);
      rethrow;
    }
  }

  int _hourOf(String? time) => time == null ? 19 : int.tryParse(time.split(':').first) ?? 19;

  Future<void> _run(String what, Future<void> Function() action) async {
    try {
      await action();
      _changes.add(null);
    } catch (e, stack) {
      _logger.error('Failed to $what', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
