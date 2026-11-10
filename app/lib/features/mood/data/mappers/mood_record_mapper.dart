import 'package:flutter_bloc_starter/features/mood/data/data_sources/mood_data_source.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_entry.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_kind.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_share.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/need_kind.dart';

extension MoodRecordMapper on MoodRecord {
  MoodEntry toEntry() => MoodEntry(
    id: id,
    day: day,
    mood: MoodKind.fromValue(mood),
    need: NeedKind.fromValue(need),
    share: MoodShare.fromValue(share),
  );
}
