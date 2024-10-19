import 'package:core/src/exceptions/l10n_placeholder_exception.dart';

final class UnknownException extends L10nPlaceholderException {
  const UnknownException() : super(l10nPlaceholder: 'unknown');
}
