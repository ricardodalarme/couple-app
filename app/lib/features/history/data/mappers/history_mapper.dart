import 'package:clock/clock.dart';
import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/history/data/data_sources/remote/queries/generated/HistoryOverview.graphql.dart';
import 'package:flutter_bloc_starter/features/history/data/mappers/history_enum_mapper.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/data/models/story_event_kind.dart';
import 'package:flutter_bloc_starter/features/profile/data/mappers/avatar_kind_mapper.dart';
import 'package:flutter_bloc_starter/features/profile/data/mappers/relationship_phase_mapper.dart';
import 'package:flutter_bloc_starter/features/profile/data/mappers/relationship_status_mapper.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/avatar_kind.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_status.dart';

extension HistoryOverviewMapper on QueryHistoryOverview {
  HistoryOverview toModel({DateTime? now}) {
    final currentNow = now ?? clock.now();
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
    final avatarKind = selfProfile?.avatarKind.toModel() ?? AvatarKind.initials;
    final phase = settings?.phase?.toModel() ?? RelationshipPhase.dating;
    final relationshipStatus =
        settings?.relationshipStatus.toModel() ?? RelationshipStatus.together;

    final storyNodes = [for (final edge in storyEventsCollection.edges) edge.node];
    final memoryNodes = [for (final edge in memoriesCollection.edges) edge.node];
    final dateNodes = [
      for (final edge in importantDatesCollection.edges)
        if (!edge.node.hidden) edge.node,
    ];

    final storyDates = _buildStoryDates(
      storyNodes: storyNodes,
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
      final isMine = node.isMine ?? false;
      milestones.add(
        HistoryMilestone(
          id: node.id,
          source: MilestoneSource.storyEvent,
          kind: node.kind.toMilestoneKind(),
          title: (node.title != null && node.title!.trim().isNotEmpty)
              ? node.title!.trim()
              : _defaultStoryEventTitle(node.kind.toMilestoneKind()),
          date: node.happenedOn,
          precision: node.datePrecision.toModel(),
          isShared: node.isShared ?? false,
          isMine: isMine,
          authorName: isMine ? null : partnerName,
        ),
      );
    }

    for (final node in memoryNodes) {
      final isMine = node.isMine ?? false;
      final place = node.place?.trim();
      if (place != null && place.isNotEmpty) {
        places.add(place);
      }
      milestones.add(
        HistoryMilestone(
          id: node.id,
          source: MilestoneSource.memory,
          kind: node.origin.toMilestoneKind(place: place),
          title: node.title,
          body: node.body,
          place: (place == null || place.isEmpty) ? null : place,
          date: node.happenedOn,
          precision: node.datePrecision.toModel(),
          isShared: node.isShared ?? false,
          isMine: isMine,
          authorName: isMine ? null : partnerName,
        ),
      );
    }

    DateTime? nextReunionDate;
    final todayUtc = DateTime.utc(currentNow.year, currentNow.month, currentNow.day);

    for (final node in dateNodes) {
      if (node.kind == EnumImportantDateKind.birthday ||
          node.kind == EnumImportantDateKind.holiday) {
        continue;
      }
      final isMine = node.isMine ?? false;
      final year = node.year;
      final resolvedDate = year == null ? null : DateTime(year, node.month, node.day);

      if (node.kind == EnumImportantDateKind.reunion && resolvedDate != null) {
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
          kind: node.kind.toMilestoneKind(),
          title: node.title,
          date: resolvedDate,
          precision: year == null ? MilestoneDatePrecision.unknown : MilestoneDatePrecision.day,
          isShared: node.isShared ?? false,
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
  required String? partnerName,
  required DateTime? settingsTogetherSince,
}) {
  StoryDateEntry entryFor(StoryEventKind kind) {
    QueryHistoryOverviewstoryEventsCollectionedgesnode? match;
    for (final node in storyNodes) {
      if (node.kind != kind.toRemote()) continue;
      if (node.isMine == true) {
        match = node;
        break;
      }
      match ??= node;
    }
    if (match == null) return StoryDateEntry(kind: kind);
    final isMine = match.isMine ?? false;
    return StoryDateEntry(
      id: match.id,
      kind: kind,
      date: match.happenedOn,
      precision: match.datePrecision.toModel(),
      isShared: match.isShared ?? false,
      isMine: isMine,
      authorName: isMine ? null : partnerName,
    );
  }

  var selfStart = settingsTogetherSince;
  DateTime? partnerStart;

  for (final node in storyNodes) {
    if (node.kind == EnumStoryEventKind.dating || node.kind == EnumStoryEventKind.met) {
      if (node.isMine == true) {
        selfStart ??= node.happenedOn;
      } else {
        partnerStart ??= node.happenedOn;
      }
    }
  }

  return StoryDatesSummary(
    met: entryFor(StoryEventKind.met),
    dating: entryFor(StoryEventKind.dating),
    engaged: entryFor(StoryEventKind.engaged),
    married: entryFor(StoryEventKind.married),
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

String _defaultStoryEventTitle(MilestoneKind kind) => switch (kind) {
  MilestoneKind.met => 'Nos conhecemos',
  MilestoneKind.dating => 'Começamos a namorar',
  MilestoneKind.engaged => 'Noivamos',
  MilestoneKind.married => 'Casamos',
  _ => 'Marco',
};

extension _StringCharacters on String {
  Iterable<String> get characters sync* {
    for (final rune in runes) {
      yield String.fromCharCode(rune);
    }
  }
}
