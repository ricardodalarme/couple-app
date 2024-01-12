import 'package:core/core.dart';

final class ServerResponseException extends LocalizedException {
  const ServerResponseException(this.code, this.originalException)
      : super(l10nKey: code ?? 'serverError');

  final String? code;
  final Exception originalException;
}
