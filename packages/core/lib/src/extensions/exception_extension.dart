import 'package:core/core.dart';

typedef ExceptionCodeCallback<T extends Exception> = String Function(T exception);

extension ExceptionExtension<T extends Exception> on T {
  LocalizedException toLocalizedException(ExceptionCodeCallback codeCallback) {
    if (this is LocalizedException) {
      return this as LocalizedException;
    }
    final String l10nKey = codeCallback(this);
    return LocalizedException(l10nKey: l10nKey);
  }
}
