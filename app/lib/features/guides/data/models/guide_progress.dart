import 'package:equatable/equatable.dart';

/// How long a guide keeps its position and answers.
const Duration guideProgressLifetime = Duration(days: 7);

/// The local state of one guide: where the person stopped and what they wrote.
final class const GuideProgress({
  required final int stepIndex,
  required final List<String> answers,
  required final DateTime savedAt,
  required final String contentVersion,
  final String? prepId,
}) with Equatable {
  /// Whether the saved progress is older than [guideProgressLifetime].
  bool isExpiredAt(DateTime now) => now.toUtc().difference(savedAt.toUtc()) > guideProgressLifetime;

  Map<String, Object?> toJson() => {
    'stepIndex': stepIndex,
    'answers': answers,
    'savedAt': savedAt.toUtc().toIso8601String(),
    'contentVersion': contentVersion,
    'prepId': prepId,
  };

  /// Reads a stored progress, or null when the payload is malformed.
  static GuideProgress? fromJson(Object? raw) {
    if (raw is! Map) return null;
    final stepIndex = raw['stepIndex'];
    final answers = raw['answers'];
    final savedAt = DateTime.tryParse('${raw['savedAt']}');
    final contentVersion = raw['contentVersion'];
    final prepId = raw['prepId'];
    if (stepIndex is! int ||
        answers is! List ||
        savedAt == null ||
        contentVersion is! String ||
        contentVersion.isEmpty) {
      return null;
    }

    return GuideProgress(
      stepIndex: stepIndex,
      answers: answers.whereType<String>().toList(),
      savedAt: savedAt.toUtc(),
      contentVersion: contentVersion,
      prepId: prepId is String ? prepId : null,
    );
  }

  @override
  List<Object?> get props => [stepIndex, answers, savedAt, contentVersion, prepId];
}
