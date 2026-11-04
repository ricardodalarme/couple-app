import 'package:core/core.dart';

final class const ServerResponseException(final String? code, final Exception originalException)
    extends LocalizedException {
  this : super(l10nKey: code ?? 'serverError');

  @override
  String toString() => 'ServerResponseException(code: $code, cause: $originalException)';
}
