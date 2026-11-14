import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/avatar_kind.dart';

extension EnumAvatarKindMapper on EnumAvatarKind {
  /// An unknown avatar is shown as initials.
  AvatarKind toModel() => switch (this) {
    EnumAvatarKind.photo => AvatarKind.photo,
    EnumAvatarKind.illustration => AvatarKind.illustration,
    EnumAvatarKind.initials || EnumAvatarKind.$unknown => AvatarKind.initials,
  };
}

extension AvatarKindMapper on AvatarKind {
  EnumAvatarKind toRemote() => switch (this) {
    AvatarKind.photo => EnumAvatarKind.photo,
    AvatarKind.illustration => EnumAvatarKind.illustration,
    AvatarKind.initials => EnumAvatarKind.initials,
  };
}
