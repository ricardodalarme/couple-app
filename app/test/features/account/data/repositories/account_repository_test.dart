import 'package:flutter_bloc_starter/features/account/data/data_sources/remote/account_data_source.dart';
import 'package:flutter_bloc_starter/features/account/data/data_sources/remote/mutations/generated/RequestAccountDeletion.graphql.dart';
import 'package:flutter_bloc_starter/features/account/data/data_sources/remote/queries/generated/MyDeletionRequest.graphql.dart';
import 'package:flutter_bloc_starter/features/account/data/repositories/account_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAccountDataSource() extends Mock implements AccountDataSource;

void main() {
  late AccountDataSource dataSource;

  setUp(() => dataSource = _MockAccountDataSource());

  AccountRepository build() => AccountRepository(dataSource: dataSource);

  test('a missing request is null', () async {
    when(() => dataSource.getDeletion()).thenAnswer((_) async => null);

    expect(await build().getDeletion(), isNull);
  });

  test('the request keeps both dates', () async {
    when(() => dataSource.getDeletion()).thenAnswer(
      (_) async => QueryMyDeletionRequestdeletionRequestsCollectionedgesnode(
        requestedAt: DateTime(2026, 11, 10),
        purgeAfter: DateTime(2026, 11, 24),
      ),
    );

    final deletion = await build().getDeletion();

    expect(deletion!.purgeAfter, DateTime(2026, 11, 24));
    expect(deletion.requestedAt, DateTime(2026, 11, 10));
  });

  test('requesting returns the purge date', () async {
    when(() => dataSource.requestDeletion()).thenAnswer(
      (_) async => MutationRequestAccountDeletionrequestAccountDeletion(
        requestedAt: DateTime(2026, 11, 10),
        purgeAfter: DateTime(2026, 11, 24),
      ),
    );

    final deletion = await build().requestDeletion();

    expect(deletion.purgeAfter, DateTime(2026, 11, 24));
  });
}
