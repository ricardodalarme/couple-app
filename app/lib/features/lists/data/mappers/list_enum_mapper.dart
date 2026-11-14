import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_item_status.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_kind.dart';

extension EnumListKindMapper on EnumListKind {
  ListKind toModel() => switch (this) {
    EnumListKind.travel => ListKind.travel,
    EnumListKind.restaurants => ListKind.restaurants,
    EnumListKind.movies => ListKind.movies,
    EnumListKind.custom => ListKind.custom,
    EnumListKind.$unknown => throw const FormatException('Unknown list kind'),
  };
}

extension ListKindMapper on ListKind {
  EnumListKind toRemote() => switch (this) {
    ListKind.travel => EnumListKind.travel,
    ListKind.restaurants => EnumListKind.restaurants,
    ListKind.movies => EnumListKind.movies,
    ListKind.custom => EnumListKind.custom,
  };
}

extension EnumListItemStatusMapper on EnumListItemStatus {
  ListItemStatus toModel() => switch (this) {
    EnumListItemStatus.dream => ListItemStatus.dream,
    EnumListItemStatus.planned => ListItemStatus.planned,
    EnumListItemStatus.done => ListItemStatus.done,
    EnumListItemStatus.$unknown => throw const FormatException('Unknown list item status'),
  };
}

extension ListItemStatusMapper on ListItemStatus {
  EnumListItemStatus toRemote() => switch (this) {
    ListItemStatus.dream => EnumListItemStatus.dream,
    ListItemStatus.planned => EnumListItemStatus.planned,
    ListItemStatus.done => EnumListItemStatus.done,
  };
}
