import 'package:flutter_bloc_starter/features/mood/data/models/mood_kind.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/need_kind.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/partner_mood.dart';
import 'package:flutter_bloc_starter/features/today/data/data_sources/queries/generated/TodayHome.graphql.dart';
import 'package:flutter_bloc_starter/features/today/data/models/today_home.dart';

extension TodayHomeMapper on QueryTodayHome {
  /// The home state, or `null` when the server returned no `today` row.
  TodayHome? toModel() {
    final state = today;
    if (state == null) return null;
    final sharedMood = partnerMoodToday;

    return TodayHome(
      isPaired: state.isPaired ?? false,
      unopenedCards: state.unopenedCards ?? 0,
      slipsThisWeek: state.slipsThisWeek ?? 0,
      slipsTotal: state.slipsTotal ?? 0,
      hasPendingInvite: state.hasPendingInvite ?? false,
      hasPlus: state.hasPlus ?? false,
      unseenSignals: state.unseenSignals ?? 0,
      partnerName: state.partnerName,
      localDate: state.localDate,
      cardStatus: state.cardStatus,
      togetherSince: state.togetherSince,
      pauseIsMine: state.pauseIsMine ?? false,
      pauseReturnAt: state.pauseReturnAt,
      question: question == null
          ? null
          : Suggestion(
              slug: question!.slug,
              title: question!.title,
              tags: question!.tags.whereType<String>().toList(),
            ),
      idea: idea == null
          ? null
          : Suggestion(slug: idea!.slug, title: idea!.title, body: idea!.body),
      partnerMood: state.localDate != null && sharedMood?.day == state.localDate
          ? sharedMood!.toPartnerMood()
          : null,
    );
  }
}

extension PartnerMoodMapper on QueryTodayHomepartnerMoodToday {
  PartnerMood toPartnerMood() =>
      PartnerMood(day: day, mood: MoodKind.fromValue(mood), need: NeedKind.fromValue(need));
}
