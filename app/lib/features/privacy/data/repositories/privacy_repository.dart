import 'package:flutter_bloc_starter/features/privacy/data/data_sources/privacy_data_source.dart';
import 'package:flutter_bloc_starter/features/privacy/data/models/consent.dart';
import 'package:logger/logger.dart';

/// Reads the latest consent per kind and records changes.
///
/// Consents are append-only rows: a withdrawal is a new row with `granted` false.
class PrivacyRepository({required final PrivacyDataSource _dataSource}) {
  final Logger _logger = Logger('PrivacyRepository');

  /// The consent text version this build asks for.
  static const String consentVersion = '1';

  /// Sensitive data and terms are required; the optional ones start off.
  static const Map<ConsentKind, bool> defaults = {
    ConsentKind.sensitiveData: true,
    ConsentKind.terms: true,
    ConsentKind.analytics: false,
    ConsentKind.marketing: false,
    ConsentKind.ai: false,
  };

  Future<Map<ConsentKind, bool>> getConsents() async {
    try {
      final rows = await _dataSource.getConsents();
      final latest = {...defaults};
      final seen = <ConsentKind>{};
      for (final row in rows) {
        final kind = ConsentKind.fromValue(row.kind);
        if (kind == null || seen.contains(kind)) continue;
        seen.add(kind);
        latest[kind] = row.granted;
      }

      return latest;
    } catch (e, stack) {
      _logger.error('Failed to load consents', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> setConsent(ConsentKind kind, {required bool granted}) async {
    try {
      await _dataSource.grant(kind: kind.value, granted: granted, version: consentVersion);
    } catch (e, stack) {
      _logger.error('Failed to save a consent', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
