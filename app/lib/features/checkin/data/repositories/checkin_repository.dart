import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/checkin/data/data_sources/local/checkin_local_data_source.dart';
import 'package:flutter_bloc_starter/features/checkin/data/data_sources/remote/checkin_data_source.dart';
import 'package:flutter_bloc_starter/features/checkin/data/models/checkin_answer.dart';
import 'package:flutter_bloc_starter/features/checkin/data/models/checkin_week.dart';
import 'package:logger/logger.dart';

class CheckinRepository({
  required final CheckinDataSource _dataSource,
  required final CheckinLocalDataSource _localDataSource,
}) {
  final Logger _logger = Logger('CheckinRepository');

  /// Reads the current week from the server's local day, scoped to the person's couple.
  Future<CheckinWeek> getWeek() => _run('read the weekly check-in', () async {
    final today = await _dataSource.getToday();
    final weekStart = checkinWeekStart(today.localDate);
    final coupleId = today.coupleId;
    if (coupleId == null || !today.isPaired) {
      return CheckinWeek(
        weekStart: weekStart,
        coupleId: coupleId,
        isPaired: today.isPaired,
        partnerName: today.partnerName,
      );
    }

    final rows = await _dataSource.getAnswers(weekStart: weekStart, coupleId: coupleId);
    final ownAnswers = <int, CheckinAnswer>{};
    final partnerAnswers = <int, CheckinAnswer>{};

    for (final row in rows) {
      final answer = CheckinAnswer(id: row.id, question: row.question, body: row.body);
      if (row.authorId == today.selfId) {
        ownAnswers[answer.question] = answer;
      } else {
        partnerAnswers[answer.question] = answer;
      }
    }

    return CheckinWeek(
      weekStart: weekStart,
      coupleId: coupleId,
      isPaired: today.isPaired,
      partnerName: today.partnerName,
      ownAnswers: ownAnswers,
      partnerAnswers: partnerAnswers,
    );
  });

  /// Inserts a new answer or updates the existing row before the reveal.
  Future<CheckinAnswer> saveAnswer({
    required CheckinWeek week,
    required int question,
    required String body,
  }) => _run('save a check-in answer', () async {
    final coupleId = week.coupleId;
    if (coupleId == null) throw const LocalizedException(l10nKey: 'NO_COUPLE');

    final existing = week.answerFor(question);
    final text = body.trim();
    try {
      final record = await _dataSource.saveAnswer(
        id: existing?.id,
        coupleId: coupleId,
        weekStart: week.weekStart,
        question: question,
        body: text,
      );

      return CheckinAnswer(id: record.id, question: record.question, body: record.body);
    } on LocalizedException catch (exception) {
      if (existing != null || !_isUniqueViolation(exception)) rethrow;
      final fresh = await getWeek();
      final row = fresh.answerFor(question);
      if (row == null) rethrow;
      final record = await _dataSource.saveAnswer(
        id: row.id,
        coupleId: coupleId,
        weekStart: week.weekStart,
        question: question,
        body: text,
      );

      return CheckinAnswer(id: record.id, question: record.question, body: record.body);
    }
  });

  /// Removes an answer so a cleared or skipped question returns to being blank.
  Future<void> deleteAnswer(String id) =>
      _run('delete a check-in answer', () => _dataSource.deleteAnswer(id));

  /// Records that this week's check-in was dismissed locally.
  Future<void> dismissWeek(DateTime weekStart) => _localDataSource.writeDismissedWeek(weekStart);

  /// Whether the person dismissed the check-in for the server's current week.
  Future<bool> isCurrentWeekDismissed() => _run('read the check-in dismissal', () async {
    final today = await _dataSource.getToday();

    return _localDataSource.isDismissedFor(checkinWeekStart(today.localDate));
  });

  bool _isUniqueViolation(LocalizedException exception) =>
      exception.l10nKey == '23505' || exception.l10nKey.toLowerCase().contains('duplicate key');

  Future<T> _run<T>(String what, Future<T> Function() action) async {
    try {
      return await action();
    } catch (exception) {
      final key = exception is LocalizedException
          ? exception.l10nKey
          : exception.runtimeType.toString();
      _logger.error('Failed to $what ($key)');
      rethrow;
    }
  }
}
