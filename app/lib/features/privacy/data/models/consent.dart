import 'package:equatable/equatable.dart';

/// The consents the backend records, in the order the board lists them.
enum ConsentKind(final String value) {
  sensitiveData('sensitive_data'),
  analytics('analytics'),
  marketing('marketing'),
  ai('ai'),
  terms('terms');

  /// Whether the consent is required to use the app.
  bool get isRequired => this == sensitiveData || this == terms;

  static ConsentKind? fromValue(String value) {
    for (final kind in values) {
      if (kind.value == value) return kind;
    }
    return null;
  }
}

/// The latest decision for one consent kind.
final class const Consent({required final ConsentKind kind, required final bool granted})
    with Equatable {
  @override
  List<Object?> get props => [kind, granted];
}
