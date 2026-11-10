import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_kind.dart';

extension MoodFace on MoodKind {
  FaceKind get face => switch (this) {
    MoodKind.happy => FaceKind.good,
    MoodKind.tired => FaceKind.tired,
    MoodKind.sad => FaceKind.sad,
    MoodKind.stressed => FaceKind.tense,
    MoodKind.loving => FaceKind.affectionate,
    MoodKind.playful => FaceKind.smile,
  };
}
