import 'package:flutter_bloc_starter/features/mood/data/data_sources/remote/mood_data_source.dart';
import 'package:flutter_bloc_starter/features/mood/data/mappers/mood_enum_mapper.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_entry.dart';

extension MoodRecordMapper on MoodRecord {
  MoodEntry toEntry() => MoodEntry(
    id: id,
    day: day,
    mood: mood.toModel(),
    need: need?.toModel(),
    share: share.toModel(),
  );
}
