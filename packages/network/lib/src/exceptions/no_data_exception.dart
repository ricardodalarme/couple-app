import 'package:core/core.dart';

final class const NoDataException() extends LocalizedException {
  this : super(l10nKey: 'noData');
}
