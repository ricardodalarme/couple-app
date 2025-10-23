import 'package:core/core.dart';

final class NoDataException extends LocalizedException {
  const NoDataException() : super(l10nKey: 'noData');
}
