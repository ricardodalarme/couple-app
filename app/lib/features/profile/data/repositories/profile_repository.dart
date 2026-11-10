import 'package:flutter_bloc_starter/features/profile/data/data_sources/profile_data_source.dart';
import 'package:flutter_bloc_starter/features/profile/data/mappers/profile_mapper.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:logger/logger.dart';

class ProfileRepository({required final ProfileDataSource _profileDataSource}) {
  final Logger _logger = Logger('ProfileRepository');

  Future<Profile> getMyProfile() async {
    try {
      return (await _profileDataSource.getMyProfile()).toModel();
    } catch (e, stack) {
      _logger.error('Failed to load the profile', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Creates the profile row for a newly signed-in user, or returns the existing one.
  Future<Profile> ensureProfile() async {
    try {
      return (await _profileDataSource.ensureProfile()).toModel();
    } catch (e, stack) {
      _logger.error('Failed to ensure the profile', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
