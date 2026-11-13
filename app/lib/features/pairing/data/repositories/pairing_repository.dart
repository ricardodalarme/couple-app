import 'dart:async';

import 'package:flutter_bloc_starter/features/pairing/data/data_sources/local/pairing_local_data_source.dart';
import 'package:flutter_bloc_starter/features/pairing/data/data_sources/remote/pairing_data_source.dart';
import 'package:flutter_bloc_starter/features/pairing/data/models/active_invite.dart';
import 'package:flutter_bloc_starter/features/profile/data/mappers/profile_mapper.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:logger/logger.dart';

class PairingRepository({
  required final PairingDataSource _pairingDataSource,
  required final PairingLocalDataSource _localDataSource,
}) {
  final Logger _logger = Logger('PairingRepository');
  final StreamController<void> _changes = StreamController<void>.broadcast();

  /// Emits when the couple forms or ends, so screens that show the partner can read again.
  Stream<void> get onChanged => _changes.stream;

  /// The invite already created and still valid, or a new one.
  Future<ActiveInvite> getOrCreateInvite(DateTime now) async {
    final stored = await _localDataSource.read();
    if (stored != null && !stored.isExpired(now)) return stored;

    return createInvite();
  }

  /// Creates an invite; the server cancels the previous one, so only the latest is valid.
  Future<ActiveInvite> createInvite() async {
    try {
      final created = await _pairingDataSource.createInvite();
      final invite = ActiveInvite(
        id: created.id!,
        code: created.code!,
        expiresAt: created.expiresAt!,
      );
      await _localDataSource.write(invite);
      return invite;
    } catch (e, stack) {
      _logger.error('Failed to create an invite', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Whether [code] connected the two people. `false` covers every code that cannot be used.
  Future<bool> acceptInvite(String code) async {
    try {
      final connected = await _pairingDataSource.acceptInvite(code);
      if (connected) {
        await _localDataSource.clear();
        _changes.add(null);
      }
      return connected;
    } catch (e, stack) {
      _logger.error('Failed to accept an invite', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// The connected partner, or `null` when the person is not paired.
  Future<Profile?> getPartner() async {
    try {
      return (await _pairingDataSource.getMyPartner())?.toModel();
    } catch (e, stack) {
      _logger.error('Failed to load the partner', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> cancelInvite(String inviteId) async {
    try {
      await _pairingDataSource.cancelInvite(inviteId);
      await _localDataSource.clear();
    } catch (e, stack) {
      _logger.error('Failed to cancel the invite', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Ends the couple and clears the stored invite.
  Future<void> unpair() async {
    try {
      await _pairingDataSource.unpair();
      await _localDataSource.clear();
      _changes.add(null);
    } catch (e, stack) {
      _logger.error('Failed to unpair', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Keeps the person's shared rows private or deletes them, after [unpair].
  Future<void> resolveSharedItems({required bool keep}) async {
    try {
      await _pairingDataSource.resolveSharedItems(keep: keep);
    } catch (e, stack) {
      _logger.error('Failed to resolve shared items', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
