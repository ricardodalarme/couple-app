import 'package:core/src/exceptions/localized_exception.dart';

final class UnknownException extends LocalizedException {
  const UnknownException() : super(l10nKey: 'other');
}
