import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/avatar_kind.dart';

final class const Profile({
  required final String id,
  required final AvatarKind avatarKind,
  final String? displayName,
  final String? avatarPath,
  final String? city,
  final String? pronouns,
}) with Equatable {
  const new fake()
    : this(id: 'fake', avatarKind: AvatarKind.initials, displayName: 'Nome Sobrenome');

  @override
  List<Object?> get props => [id, avatarKind, displayName, avatarPath, city, pronouns];
}
