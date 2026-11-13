import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_starter/features/plus/data/data_sources/remote/plus_data_source.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:logger/logger.dart';
import 'package:purchase_service/purchase_service.dart';

class PlusRepository({
  required final PlusDataSource _dataSource,
  required final PurchaseService _purchaseService,
  final Duration _confirmationWindow = confirmationWindow,
  final Duration _confirmationStep = confirmationStep,
}) {
  final Logger _logger = Logger('PlusRepository');
  Map<String, Package> _packages = const {};

  /// How long to wait for the server to confirm a purchase or a restore, and how often to ask.
  static const Duration confirmationWindow = Duration(seconds: 30);
  static const Duration confirmationStep = Duration(seconds: 2);

  /// Buys the plan [priceId] and waits for the server to show Plus.
  ///
  /// A cancelled purchase ends silently; a purchase the server has not confirmed within the
  /// window ends as pending, and Plus appears on the next read.
  Future<PurchaseOutcome> purchase(String priceId) async {
    final package = _packages[priceId];
    if (package == null) throw StateError('Unknown plan $priceId');

    try {
      await _purchaseService.purchasePackage(package);
    } on PlatformException catch (e) {
      if (PurchasesErrorHelper.getErrorCode(e) == PurchasesErrorCode.purchaseCancelledError) {
        return PurchaseOutcome.cancelled;
      }
      _logger.error('Purchase failed', error: e);
      rethrow;
    }

    return await _waitForPlus() ? PurchaseOutcome.unlocked : PurchaseOutcome.pending;
  }

  /// What the server says the person has; Plus from the partner counts for the couple.
  Future<PlusState> getPlus() async {
    try {
      final plus = await _dataSource.getPlus();

      return PlusState(
        hasPlus: plus.hasPlus ?? false,
        isPaidByPartner: plus.paidByPartner ?? false,
        slipsLeft: plus.slipsLeftThisMonth ?? 0,
        cardsLeft: plus.cardsLeftThisMonth ?? 0,
        plan: plus.plan,
        status: plus.status,
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
      _packages = {for (final package in packages) package.identifier: package};
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

  /// Re-applies store purchases and returns what the store and the server report.
  ///
  /// Throws `LocalizedException` with `storeUnavailable` when the store is not configured.
  Future<RestoreOutcome> restorePurchases() async {
    final CustomerInfo info;
    try {
      info = await _purchaseService.restorePurchases();
    } on PurchaseUnavailableException catch (e) {
      _logger.warning('Could not restore purchases', error: e);
      throw const LocalizedException(l10nKey: 'storeUnavailable');
    } catch (e, stack) {
      _logger.error('Could not restore purchases', error: e, stackTrace: stack);
      rethrow;
    }

    if (info.activeSubscriptions.isEmpty && info.entitlements.active.isEmpty) {
      return RestoreOutcome.nothing;
    }

    return await _waitForPlus() ? RestoreOutcome.unlocked : RestoreOutcome.pending;
  }

  /// The store page for managing the subscription, or null when the store has none.
  ///
  /// Throws [LocalizedException] with `storeUnavailable` when the store is not configured.
  Future<Uri?> getManagementUrl() async {
    try {
      return await _purchaseService.getManagementUrl();
    } on PurchaseUnavailableException catch (e) {
      _logger.warning('Could not read the management page', error: e);
      throw const LocalizedException(l10nKey: 'storeUnavailable');
    } catch (e, stack) {
      _logger.error('Could not read the management page', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<bool> _waitForPlus() async {
    final deadline = DateTime.now().add(_confirmationWindow);
    while (DateTime.now().isBefore(deadline)) {
      if ((await getPlus()).hasPlus) return true;
      await Future<void>.delayed(_confirmationStep);
    }

    return false;
  }
}
