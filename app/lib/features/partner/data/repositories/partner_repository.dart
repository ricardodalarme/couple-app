import 'package:flutter_bloc_starter/features/partner/data/data_sources/remote/partner_data_source.dart';
import 'package:flutter_bloc_starter/features/partner/data/mappers/partner_fact_category_mapper.dart';
import 'package:flutter_bloc_starter/features/partner/data/models/partner_fact.dart';
import 'package:flutter_bloc_starter/features/partner/data/models/partner_fact_category.dart';
import 'package:logger/logger.dart';

class PartnerRepository({required final PartnerDataSource _dataSource}) {
  final Logger _logger = Logger('PartnerRepository');

  Future<List<PartnerFact>> getFacts() async {
    try {
      return [
        for (final node in await _dataSource.getFacts())
          PartnerFact(
            id: node.id,
            label: node.label,
            value: node.value,
            category: node.category?.toModel(),
          ),
      ];
    } catch (e, stack) {
      _logger.error('Failed to read partner notes', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Saves a private note; the client [id] makes retries safe.
  Future<void> addFact({
    required String id,
    required String label,
    required String value,
    PartnerFactCategory? category,
  }) async {
    try {
      await _dataSource.addFact(
        id: id,
        label: label.trim(),
        value: value.trim(),
        category: category?.toRemote(),
      );
    } catch (e, stack) {
      _logger.error('Failed to save a partner note', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> deleteFact(String id) async {
    try {
      await _dataSource.deleteFact(id);
    } catch (e, stack) {
      _logger.error('Failed to delete a partner note', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
