import 'package:flutter_bloc_starter/features/plus/data/data_sources/plus_data_source.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:logger/logger.dart';
import 'package:purchase_service/purchase_service.dart';

class PlusRepository({
  required final PlusDataSource _dataSource,
  required final PurchaseService _purchaseService,
}) {
  final Logger _logger = Logger('PlusRepository');

  /// What the server says the person has; Plus from the partner counts for the couple.
  Future<PlusState> getPlus() async {
    try {
      final plus = await _dataSource.getPlus();

      return PlusState(
        hasPlus: plus.hasPlus ?? false,
        isPaidByPartner: plus.paidByPartner ?? false,
        slipsLeft: plus.slipsLeftThisMonth ?? 0,
        cardsLeft: plus.cardsLeftThisMonth ?? 0,
      );
    } catch (e, stack) {
      _logger.error('Failed to read the plan', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// The monthly and yearly prices from the store; throws when the store cannot be reached.
  ///
  /// Prices are never written in the app, so there is nothing to show without the store.
  Future<List<PlanPrice>> getPrices() async {
    try {
      final packages = await _purchaseService.getPackages();
      final prices = [
        for (final package in packages)
          if (package.packageType == PackageType.monthly ||
              package.packageType == PackageType.annual)
            PlanPrice(
              id: package.identifier,
              price: package.storeProduct.priceString,
              isYearly: package.packageType == PackageType.annual,
            ),
      ];
      if (prices.isEmpty) throw StateError('The store returned no plans');

      return prices;
    } catch (e, stack) {
      _logger.warning('Could not load the plan prices', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
