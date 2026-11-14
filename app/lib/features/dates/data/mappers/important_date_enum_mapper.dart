import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/dates/data/models/important_date_kind.dart';

extension EnumImportantDateKindMapper on EnumImportantDateKind {
  ImportantDateKind toModel() => switch (this) {
    EnumImportantDateKind.relationship => ImportantDateKind.relationship,
    EnumImportantDateKind.birthday => ImportantDateKind.birthday,
    EnumImportantDateKind.first => ImportantDateKind.first,
    EnumImportantDateKind.holiday => ImportantDateKind.holiday,
    EnumImportantDateKind.trip => ImportantDateKind.trip,
    EnumImportantDateKind.reunion => ImportantDateKind.reunion,
    EnumImportantDateKind.custom => ImportantDateKind.custom,
    EnumImportantDateKind.$unknown => ImportantDateKind.custom,
  };
}

extension ImportantDateKindMapper on ImportantDateKind {
  EnumImportantDateKind toRemote() => switch (this) {
    ImportantDateKind.relationship => EnumImportantDateKind.relationship,
    ImportantDateKind.birthday => EnumImportantDateKind.birthday,
    ImportantDateKind.first => EnumImportantDateKind.first,
    ImportantDateKind.holiday => EnumImportantDateKind.holiday,
    ImportantDateKind.trip => EnumImportantDateKind.trip,
    ImportantDateKind.reunion => EnumImportantDateKind.reunion,
    ImportantDateKind.custom => EnumImportantDateKind.custom,
  };
}

extension ImportantDateOriginMapper on ImportantDateOrigin {
  EnumImportantDateOrigin toRemote() => switch (this) {
    ImportantDateOrigin.manual => EnumImportantDateOrigin.manual,
    ImportantDateOrigin.auto => EnumImportantDateOrigin.auto,
    ImportantDateOrigin.chat => EnumImportantDateOrigin.chat,
  };
}
