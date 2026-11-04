import 'package:equatable/equatable.dart';

/// The signed-in user's profile fields.
class const CurrentUser({
  /// The account email, or an empty string when the provider does not expose one.
  required final String email,

  /// The given name stored in the auth provider metadata.
  required final String firstName,

  /// The family name stored in the auth provider metadata.
  required final String lastName,
}) extends Equatable {
  @override
  List<Object?> get props => [email, firstName, lastName];
}
