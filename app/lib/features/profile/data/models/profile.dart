import 'package:equatable/equatable.dart';

final class const Profile({
  required final String id,
  required final String avatarKind,
  final String? displayName,
  final String? avatarPath,
  final String? city,
  final String? pronouns,
}) with Equatable {
  const new fake() : this(id: 'fake', avatarKind: 'initial', displayName: 'Nome Sobrenome');

  @override
  List<Object?> get props => [id, avatarKind, displayName, avatarPath, city, pronouns];
}
