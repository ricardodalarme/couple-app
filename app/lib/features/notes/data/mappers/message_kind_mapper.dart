import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/notes/data/models/sent_message.dart';

extension EnumPartnerMessageKindMapper on EnumPartnerMessageKind {
  /// Kinds the app cannot show as a drawing are shown as notes.
  MessageKind toModel() => switch (this) {
    EnumPartnerMessageKind.drawing => MessageKind.drawing,
    _ => MessageKind.note,
  };
}
