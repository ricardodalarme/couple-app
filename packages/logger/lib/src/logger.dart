import 'dart:developer' as developer;

import 'package:logging/logging.dart' as ext;

/// Log levels for the Logger class
typedef LogLevel = ext.Level;

/// A logger utility.
class Logger {
  Logger(String name) {
    _ensureConfigured();
    _logger = ext.Logger(name);
  }

  late final ext.Logger _logger;

  static bool _isConfigured = false;
  static LogLevel _level = LogLevel.ALL;

  /// Gets the current global log level.
  static LogLevel get level => _level;

  /// Sets the global log level.
  static set level(LogLevel newLevel) {
    _level = newLevel;
    if (_isConfigured) {
      ext.Logger.root.level = _level;
    }
  }

  static void _ensureConfigured() {
    if (_isConfigured) return;
    _isConfigured = true;

    ext.hierarchicalLoggingEnabled = true;
    ext.Logger.root.level = _level;

    ext.Logger.root.onRecord.listen((record) {
      developer.log(
        record.message,
        time: record.time,
        level: record.level.value,
        name: record.loggerName,
        error: record.error,
        stackTrace: record.stackTrace,
      );
    });
  }

  /// Trace log
  void trace(dynamic message, {Object? error, StackTrace? stackTrace}) {
    _logger.finest(message, error, stackTrace);
  }

  /// Debug log
  void debug(dynamic message, {Object? error, StackTrace? stackTrace}) {
    _logger.fine(message, error, stackTrace);
  }

  /// Info log
  void info(dynamic message, {Object? error, StackTrace? stackTrace}) {
    _logger.info(message, error, stackTrace);
  }

  /// Warning log
  void warning(dynamic message, {Object? error, StackTrace? stackTrace}) {
    _logger.warning(message, error, stackTrace);
  }

  /// Error log
  void error(dynamic message, {Object? error, StackTrace? stackTrace}) {
    _logger.severe(message, error, stackTrace);
  }

  /// Fatal log
  void fatal(dynamic message, {Object? error, StackTrace? stackTrace}) {
    _logger.shout(message, error, stackTrace);
  }
}
