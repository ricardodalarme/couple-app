import 'package:flutter_bloc_starter/features/programs/data/data_sources/mutations/generated/CompleteProgramEnrollment.graphql.dart';
import 'package:flutter_bloc_starter/features/programs/data/data_sources/mutations/generated/DeleteJournalEntry.graphql.dart';
import 'package:flutter_bloc_starter/features/programs/data/data_sources/mutations/generated/DeleteLessonProgress.graphql.dart';
import 'package:flutter_bloc_starter/features/programs/data/data_sources/mutations/generated/InsertJournalEntry.graphql.dart';
import 'package:flutter_bloc_starter/features/programs/data/data_sources/mutations/generated/InsertLessonProgress.graphql.dart';
import 'package:flutter_bloc_starter/features/programs/data/data_sources/mutations/generated/InsertProgramEnrollment.graphql.dart';
import 'package:flutter_bloc_starter/features/programs/data/data_sources/mutations/generated/RestartProgramEnrollment.graphql.dart';
import 'package:flutter_bloc_starter/features/programs/data/data_sources/mutations/generated/UpdateJournalEntry.graphql.dart';
import 'package:flutter_bloc_starter/features/programs/data/data_sources/mutations/generated/UpdateLessonProgress.graphql.dart';
import 'package:flutter_bloc_starter/features/programs/data/data_sources/mutations/generated/UpdateProgramEnrollment.graphql.dart';
import 'package:flutter_bloc_starter/features/programs/data/data_sources/queries/generated/JournalEntries.graphql.dart';
import 'package:flutter_bloc_starter/features/programs/data/data_sources/queries/generated/ProgramDetail.graphql.dart';
import 'package:flutter_bloc_starter/features/programs/data/data_sources/queries/generated/ProgramProgress.graphql.dart';
import 'package:flutter_bloc_starter/features/programs/data/data_sources/queries/generated/Programs.graphql.dart';
import 'package:network/network.dart';

typedef ContentItemRecord = ({
  String slug,
  String title,
  String? body,
  String? parentSlug,
  int position,
  bool plusOnly,
});

/// Programs and lessons for one locale, already ordered by position.
typedef ProgramsRecord = ({List<ContentItemRecord> programs, List<ContentItemRecord> lessons});

/// One program and the lessons under it.
typedef ProgramRecord = ({ContentItemRecord? program, List<ContentItemRecord> lessons});

typedef EnrollmentRecord = ({String programSlug, int currentDay, DateTime? completedAt});

typedef LessonProgressRecord = ({String programSlug, int lessonDay, String status});

typedef JournalEntryRecord = ({String id, DateTime entryDate, String body, String? mood});

class ProgramsDataSource({required final GQLClient _client}) {
  Future<ProgramsRecord> getPrograms(String locale) async {
    final response = await _client.query(
      OptionsQueryPrograms(
        variables: VariablesQueryPrograms(locale: locale),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    final data = validateResponseData<QueryPrograms, QueryPrograms>(response);

    return (
      programs: [
        for (final edge in data.programs.edges)
          _content(
            slug: edge.node.slug,
            title: edge.node.title,
            body: edge.node.body,
            parentSlug: null,
            position: edge.node.position,
            plusOnly: edge.node.plusOnly,
          ),
      ],
      lessons: [
        for (final edge in data.lessons.edges)
          _content(
            slug: edge.node.slug,
            title: edge.node.title,
            body: edge.node.body,
            parentSlug: edge.node.parentSlug,
            position: edge.node.position,
            plusOnly: edge.node.plusOnly,
          ),
      ],
    );
  }

  Future<ProgramRecord> getProgram({required String slug, required String locale}) async {
    final response = await _client.query(
      OptionsQueryProgramDetail(
        variables: VariablesQueryProgramDetail(slug: slug, locale: locale),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    final data = validateResponseData<QueryProgramDetail, QueryProgramDetail>(response);

    return (
      program: data.program.edges.firstOrNull == null
          ? null
          : _content(
              slug: data.program.edges.first.node.slug,
              title: data.program.edges.first.node.title,
              body: data.program.edges.first.node.body,
              parentSlug: null,
              position: data.program.edges.first.node.position,
              plusOnly: data.program.edges.first.node.plusOnly,
            ),
      lessons: [
        for (final edge in data.lessons.edges)
          _content(
            slug: edge.node.slug,
            title: edge.node.title,
            body: edge.node.body,
            parentSlug: edge.node.parentSlug,
            position: edge.node.position,
            plusOnly: edge.node.plusOnly,
          ),
      ],
    );
  }

  Future<EnrollmentRecord?> getEnrollment(String programSlug) async {
    final (enrollment, _) = await _getProgress(programSlug);

    return enrollment;
  }

  Future<List<LessonProgressRecord>> getLessonProgress(String programSlug) async {
    final (_, progress) = await _getProgress(programSlug);

    return progress;
  }

  Future<void> insertEnrollment({
    required String programSlug,
    required int currentDay,
    DateTime? completedAt,
  }) async {
    final response = await _client.mutate(
      OptionsMutationInsertProgramEnrollment(
        variables: VariablesMutationInsertProgramEnrollment(
          programSlug: programSlug,
          currentDay: currentDay,
          completedAt: completedAt,
        ),
      ),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.insertIntoProgramEnrollmentsCollection?.affectedCount ?? 0,
    );
    if (affected == 0) throw const NoDataException();
  }

  /// Whether an enrollment existed to update.
  Future<bool> updateEnrollment({required String programSlug, required int currentDay}) async {
    final response = await _client.mutate(
      OptionsMutationUpdateProgramEnrollment(
        variables: VariablesMutationUpdateProgramEnrollment(
          programSlug: programSlug,
          currentDay: currentDay,
        ),
      ),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.updateProgramEnrollmentsCollection.affectedCount,
    );

    return affected > 0;
  }

  /// Whether an enrollment existed to complete.
  Future<bool> completeEnrollment({
    required String programSlug,
    required int currentDay,
    required DateTime completedAt,
  }) async {
    final response = await _client.mutate(
      OptionsMutationCompleteProgramEnrollment(
        variables: VariablesMutationCompleteProgramEnrollment(
          programSlug: programSlug,
          currentDay: currentDay,
          completedAt: completedAt,
        ),
      ),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.updateProgramEnrollmentsCollection.affectedCount,
    );

    return affected > 0;
  }

  Future<void> restartEnrollment(String programSlug) async {
    final response = await _client.mutate(
      OptionsMutationRestartProgramEnrollment(
        variables: VariablesMutationRestartProgramEnrollment(programSlug: programSlug),
      ),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.updateProgramEnrollmentsCollection.affectedCount,
    );
    if (affected == 0) throw const NoDataException();
  }

  Future<void> clearLessonProgress(String programSlug) async {
    final response = await _client.mutate(
      OptionsMutationDeleteLessonProgress(
        variables: VariablesMutationDeleteLessonProgress(programSlug: programSlug),
      ),
    );

    validateResponse(response);
  }

  /// Updates the lesson when the row exists, otherwise inserts the first one.
  Future<void> setLessonStatus({
    required String programSlug,
    required int lessonDay,
    required String status,
  }) async {
    final response = await _client.mutate(
      OptionsMutationUpdateLessonProgress(
        variables: VariablesMutationUpdateLessonProgress(
          programSlug: programSlug,
          lessonDay: lessonDay,
          status: status,
        ),
      ),
    );
    final affected = validateResponseData<MutationUpdateLessonProgress, int>(
      response,
      getData: (data) => data.updateLessonProgressCollection.affectedCount,
    );
    if (affected > 0) return;

    final insert = await _client.mutate(
      OptionsMutationInsertLessonProgress(
        variables: VariablesMutationInsertLessonProgress(
          programSlug: programSlug,
          lessonDay: lessonDay,
          status: status,
        ),
      ),
    );
    validateResponse(insert);
  }

  Future<List<JournalEntryRecord>> getJournalEntries() async {
    final response = await _client.query(
      OptionsQueryJournalEntries(fetchPolicy: FetchPolicy.networkOnly),
    );
    final data = validateResponseData<QueryJournalEntries, QueryJournalEntries>(response);

    return [
      for (final edge in data.journalEntriesCollection.edges)
        (
          id: edge.node.id,
          entryDate: edge.node.entryDate,
          body: edge.node.body,
          mood: edge.node.mood,
        ),
    ];
  }

  Future<JournalEntryRecord> insertJournalEntry({
    required DateTime entryDate,
    required String body,
    String? mood,
  }) async {
    final response = await _client.mutate(
      OptionsMutationInsertJournalEntry(
        variables: VariablesMutationInsertJournalEntry(
          entryDate: entryDate,
          body: body,
          mood: mood,
        ),
      ),
    );
    final node = validateResponseData(
      response,
      getData: (data) => data.insertIntoJournalEntriesCollection?.records.firstOrNull,
    );

    return (id: node.id, entryDate: node.entryDate, body: node.body, mood: node.mood);
  }

  Future<void> updateJournalEntry({required String id, required String body, String? mood}) async {
    final response = await _client.mutate(
      OptionsMutationUpdateJournalEntry(
        variables: VariablesMutationUpdateJournalEntry(id: id, body: body, mood: mood),
      ),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.updateJournalEntriesCollection.affectedCount,
    );
    if (affected == 0) throw const NoDataException();
  }

  Future<void> deleteJournalEntry(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeleteJournalEntry(variables: VariablesMutationDeleteJournalEntry(id: id)),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.deleteFromJournalEntriesCollection.affectedCount,
    );
    if (affected == 0) throw const NoDataException();
  }

  Future<(EnrollmentRecord?, List<LessonProgressRecord>)> _getProgress(String programSlug) async {
    final response = await _client.query(
      OptionsQueryProgramProgress(
        variables: VariablesQueryProgramProgress(slug: programSlug),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    final data = validateResponseData<QueryProgramProgress, QueryProgramProgress>(response);
    final enrollment = data.programEnrollmentsCollection.edges.firstOrNull?.node;

    return (
      enrollment == null
          ? null
          : (
              programSlug: enrollment.programSlug,
              currentDay: enrollment.currentDay,
              completedAt: enrollment.completedAt,
            ),
      [
        for (final edge in data.lessonProgressCollection.edges)
          (
            programSlug: edge.node.programSlug,
            lessonDay: edge.node.lessonDay,
            status: edge.node.status,
          ),
      ],
    );
  }

  ContentItemRecord _content({
    required String slug,
    required String title,
    required String? body,
    required String? parentSlug,
    required int position,
    required bool plusOnly,
  }) => (
    slug: slug,
    title: title,
    body: body,
    parentSlug: parentSlug,
    position: position,
    plusOnly: plusOnly,
  );
}
