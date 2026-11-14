import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/program.dart';

extension EnumLessonStatusMapper on EnumLessonStatus {
  LessonStatus toModel() => switch (this) {
    EnumLessonStatus.done => LessonStatus.done,
    EnumLessonStatus.saved => LessonStatus.saved,
    EnumLessonStatus.$unknown => throw const FormatException('Unknown lesson status'),
  };
}

extension LessonStatusMapper on LessonStatus {
  EnumLessonStatus toRemote() => switch (this) {
    LessonStatus.done => EnumLessonStatus.done,
    LessonStatus.saved => EnumLessonStatus.saved,
  };
}
