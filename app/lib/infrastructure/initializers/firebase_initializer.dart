import 'package:core/core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';

final class FirebaseInitializer() extends Initializer {
  static final Logger _logger = Logger('FirebaseInitializer');

  @override
  Future<void> initialize() {
    _logger.info('Initializing Firebase');
    return Firebase.initializeApp();
  }
}
