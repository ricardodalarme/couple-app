import 'package:flutter_bloc_starter/features/history/data/data_sources/remote/queries/generated/HistoryOverview.graphql.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_status.dart';

extension HistoryOverviewMapper on QueryHistoryOverview {
  HistoryOverview toModel({DateTime? now}) {
    final currentNow = now ?? DateTime.now();
    final selfProfile = myProfile;
    final partnerProfile = myPartner;
    final settings = mySettings;
    final selfId = selfProfile?.id ?? settings?.profileId ?? '';
    final selfName = (selfProfile?.displayName ?? '').trim();
    final partnerNameRaw = (partnerProfile?.displayName ?? settings?.partnerName ?? '').trim();
    final partnerName = partnerNameRaw.isEmpty ? null : partnerNameRaw;
    final coupleId = myCouple?.id;
    final isPaired = coupleId != null || partnerProfile != null;

    final selfInitials = _initials(selfName, fallback: 'V');
    final partnerInitials = partnerName != null ? _initials(partnerName, fallback: '+') : null;
    final avatarKind = AvatarKind.fromServer(selfProfile?.avatarKind);
    final phase =
        RelationshipPhase.fromServer(settings?.phase?.toJson()) ?? RelationshipPhase.dating;
    final relationshipStatus = RelationshipStatus.fromServer(settings?.relationshipStatus.toJson());

    final storyNodes = [for (final edge in storyEventsCollection.edges) edge.node];
    final memoryNodes = [for (final edge in memoriesCollection.edges) edge.node];
    final dateNodes = [
      for (final edge in importantDatesCollection.edges)
        if (!edge.node.hidden) edge.node,
    ];

    final storyDates = _buildStoryDates(
      storyNodes: storyNodes,
      selfId: selfId,
      partnerName: partnerName,
      settingsTogetherSince: settings?.togetherSince,
    );

    final hasMoreMemories = memoriesCollection.pageInfo.hasNextPage;
    final hasMoreHistory =
        storyEventsCollection.pageInfo.hasNextPage ||
        hasMoreMemories ||
        importantDatesCollection.pageInfo.hasNextPage;

    final effectiveTogetherSince =
        settings?.togetherSince ?? storyDates.dating.date ?? storyDates.met.date;

    final milestones = <HistoryMilestone>[];
    final places = <String>[];

    for (final node in storyNodes) {
      final isMine = node.authorId == selfId;
      milestones.add(
        HistoryMilestone(
          id: node.id,
          source: MilestoneSource.storyEvent,
          kind: MilestoneKind.fromServer(node.kind),
          title: (node.title != null && node.title!.trim().isNotEmpty)
              ? node.title!.trim()
              : _defaultStoryEventTitle(node.kind),
          date: node.happenedOn,
          precision: MilestoneDatePrecision.fromServer(node.datePrecision),
          isShared: node.coupleId != null,
          isMine: isMine,
          authorName: isMine ? null : partnerName,
        ),
      );
    }

    for (final node in memoryNodes) {
      final isMine = node.authorId == selfId;
      final place = node.place?.trim();
      if (place != null && place.isNotEmpty) {
        places.add(place);
      }
      milestones.add(
        HistoryMilestone(
          id: node.id,
          source: MilestoneSource.memory,
          kind: MilestoneKind.fromServer(node.origin, place: place),
          title: node.title,
          body: node.body,
          place: (place == null || place.isEmpty) ? null : place,
          date: node.happenedOn,
          precision: MilestoneDatePrecision.fromServer(node.datePrecision),
          isShared: node.coupleId != null,
          isMine: isMine,
          authorName: isMine ? null : partnerName,
        ),
      );
    }

    DateTime? nextReunionDate;
    final todayUtc = DateTime.utc(currentNow.year, currentNow.month, currentNow.day);

    for (final node in dateNodes) {
      if (node.kind == 'birthday' || node.kind == 'holiday') continue;
      final isMine = node.authorId == selfId;
      final year = node.year;
      final resolvedDate = year == null ? null : DateTime(year, node.month, node.day);

      if (node.kind == 'reunion' && resolvedDate != null) {
        final reunionUtc = DateTime.utc(resolvedDate.year, resolvedDate.month, resolvedDate.day);
        if (!reunionUtc.isBefore(todayUtc) &&
            (nextReunionDate == null || reunionUtc.isBefore(nextReunionDate))) {
          nextReunionDate = reunionUtc;
        }
      }

      milestones.add(
        HistoryMilestone(
          id: node.id,
          source: MilestoneSource.importantDate,
          kind: MilestoneKind.fromServer(node.kind),
          title: node.title,
          date: resolvedDate,
          precision: year == null ? MilestoneDatePrecision.unknown : MilestoneDatePrecision.day,
          isShared: node.coupleId != null,
          isMine: isMine,
          authorName: isMine ? null : partnerName,
        ),
      );
    }

    milestones.sort(_compareMilestones);

    final recapNode = myYear;
    final yearRecap = recapNode == null
        ? null
        : HistoryYearRecap(
            year: recapNode.year ?? currentNow.year,
            memories: recapNode.memories ?? 0,
            firsts: recapNode.firsts ?? 0,
            slips: recapNode.slips ?? 0,
            cardsSent: recapNode.cardsSent ?? 0,
            ritualsDone: recapNode.ritualsDone ?? 0,
          );

    final numbers = HistoryNumbers.compute(
      togetherSince: effectiveTogetherSince,
      now: currentNow,
      places: places,
      yearRecap: yearRecap,
    );

    return HistoryOverview(
      selfId: selfId,
      selfName: selfName,
      selfInitials: selfInitials,
      partnerName: partnerName,
      partnerInitials: partnerInitials,
      isPaired: isPaired,
      coupleId: coupleId,
      avatarKind: avatarKind,
      phase: phase,
      relationshipStatus: relationshipStatus,
      togetherSince: effectiveTogetherSince,
      nextReunionDate: nextReunionDate,
      memoryCount: memoryNodes.length,
      hasMoreMemories: hasMoreMemories,
      hasMoreHistory: hasMoreHistory,
      milestones: milestones,
      storyDates: storyDates,
      numbers: numbers,
    );
  }
}

StoryDatesSummary _buildStoryDates({
  required List<QueryHistoryOverviewstoryEventsCollectionedgesnode> storyNodes,
  required String selfId,
  required String? partnerName,
  required DateTime? settingsTogetherSince,
}) {
  StoryDateEntry entryFor(String kind) {
    QueryHistoryOverviewstoryEventsCollectionedgesnode? match;
    for (final node in storyNodes) {
      if (node.kind != kind) continue;
      if (node.authorId == selfId) {
        match = node;
        break;
      }
      match ??= node;
    }
    if (match == null) return StoryDateEntry(kind: kind);
    final isMine = match.authorId == selfId;
    return StoryDateEntry(
      id: match.id,
      kind: kind,
      date: match.happenedOn,
      precision: MilestoneDatePrecision.fromServer(match.datePrecision),
      isShared: match.coupleId != null,
      isMine: isMine,
      authorName: isMine ? null : partnerName,
    );
  }

  var selfStart = settingsTogetherSince;
  DateTime? partnerStart;

  for (final node in storyNodes) {
    if (node.kind == 'dating' || node.kind == 'met') {
      if (node.authorId == selfId) {
        selfStart ??= node.happenedOn;
      } else {
        partnerStart ??= node.happenedOn;
      }
    }
  }

  return StoryDatesSummary(
    met: entryFor('met'),
    dating: entryFor('dating'),
    engaged: entryFor('engaged'),
    married: entryFor('married'),
    selfStartDate: selfStart,
    partnerStartDate: partnerStart,
  );
}

int _compareMilestones(HistoryMilestone a, HistoryMilestone b) {
  final dateA = a.date;
  final dateB = b.date;
  if (dateA == null && dateB == null) return a.title.compareTo(b.title);
  if (dateA == null) return 1;
  if (dateB == null) return -1;
  return dateA.compareTo(dateB);
}

String _initials(String name, {required String fallback}) {
  final trimmed = name.trim();
  if (trimmed.isEmpty) return fallback;
  return trimmed.characters.first.toUpperCase();
}

String _defaultStoryEventTitle(String kind) => switch (kind) {
  'met' => 'Nos conhecemos',
  'dating' => 'Começamos a namorar',
  'engaged' => 'Noivamos',
  'married' => 'Casamos',
  _ => 'Marco',
};

extension _StringCharacters on String {
  Iterable<String> get characters sync* {
    for (final rune in runes) {
      yield String.fromCharCode(rune);
    }
  }
}
