import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/account/data/models/deletion_request.dart';
import 'package:flutter_bloc_starter/features/account/presentation/delete/cubit/delete_account_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final request = DeletionRequest(requestedAt: DateTime(2026), purgeAfter: DateTime(2026, 1, 31));

  test('clearDeletion drops the pending request', () {
    final state = DeleteAccountState(deletion: Success(request));

    final cleared = state.copyWith(clearDeletion: true);

    expect(cleared.pending, isNull);
    expect(cleared.deletion, isA<Success<DeletionRequest?>>());
  });

  test('changing another field keeps the pending request', () {
    final state = DeleteAccountState(deletion: Success(request));

    final updated = state.copyWith(partnerName: 'Ana');

    expect(updated.pending, request);
    expect(updated.partnerName, 'Ana');
  });

  test('pending is null until the request loads', () {
    expect(const DeleteAccountState().pending, isNull);
    expect(const DeleteAccountState(deletion: Loading()).pending, isNull);
    expect(const DeleteAccountState(deletion: Failure(UnknownException())).pending, isNull);
  });
}
