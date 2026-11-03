import 'package:core/src/exceptions/localized_exception.dart';

final class const UnknownException() extends LocalizedException {
  this : super(l10nKey: 'other');
}
