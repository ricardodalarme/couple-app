import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/questions/data/data_sources/questions_data_source.dart';
import 'package:flutter_bloc_starter/features/questions/data/models/question_thread.dart';
import 'package:logger/logger.dart';

class QuestionsRepository({required final QuestionsDataSource _dataSource}) {
  final Logger _logger = Logger('QuestionsRepository');

  /// The current question and couple context, without reading any answers.
  Future<QuestionPrompt> getPrompt() => _run('read the weekly question', () async {
    final record = await _dataSource.getPrompt();

    return QuestionPrompt(
      slug: record.slug,
      title: record.title,
      body: record.body,
      tags: record.tags,
      isPaired: record.isPaired,
      partnerName: record.partnerName,
      coupleId: record.coupleId,
      selfId: record.selfId,
    );
  });

  /// Reads the question and the answer rows the server allows this person to see.
  Future<QuestionThread> getThread() => _run('read the weekly question and answers', () async {
    final prompt = await getPrompt();
    final answers = await _dataSource.getAnswers(prompt.slug);
    QuestionAnswer? own;
    QuestionAnswer? partner;

    for (final row in answers.rows) {
      if (row.coupleId != prompt.coupleId) continue;
      final answer = QuestionAnswer(id: row.id, body: row.body);
      if (row.authorId == prompt.selfId) {
        own = answer;
      } else {
        partner = answer;
      }
    }

    return QuestionThread(
      prompt: prompt,
      ownAnswer: own,
      partnerAnswer: partner,
      partnerHasAnswered: answers.partnerAnswered,
    );
  });

  /// Inserts the first answer or replaces the person's own row when editing.
  ///
  /// The backend grants insert and delete only, so an edit removes the row and
  /// inserts the new text.
  Future<QuestionAnswer> saveAnswer({required QuestionThread thread, required String body}) =>
      _run('save the weekly answer', () async {
        final text = body.trim();
        final existing = thread.ownAnswer;
        if (existing == null) return _insert(thread.prompt, text);

        await _dataSource.deleteAnswer(existing.id);
        try {
          return await _insert(thread.prompt, text);
        } catch (_) {
          await _restore(thread.prompt, existing.body);
          rethrow;
        }
      });

  Future<void> _restore(QuestionPrompt prompt, String body) async {
    try {
      await _dataSource.insertAnswer(
        questionSlug: prompt.slug,
        body: body,
        coupleId: prompt.coupleId,
      );
    } catch (exception) {
      _logger.error('Failed to restore the previous weekly answer (${exception.runtimeType})');
    }
  }

  Future<QuestionAnswer> _insert(QuestionPrompt prompt, String text) async {
    try {
      final record = await _dataSource.insertAnswer(
        questionSlug: prompt.slug,
        body: text,
        coupleId: prompt.coupleId,
      );

      return QuestionAnswer(id: record.id, body: record.body);
    } on LocalizedException catch (exception) {
      if (!_isUniqueViolation(exception)) rethrow;
      final fresh = await getThread();
      final row = fresh.ownAnswer;
      if (row == null) rethrow;
      await _dataSource.deleteAnswer(row.id);
      final record = await _dataSource.insertAnswer(
        questionSlug: prompt.slug,
        body: text,
        coupleId: prompt.coupleId,
      );

      return QuestionAnswer(id: record.id, body: record.body);
    }
  }

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
