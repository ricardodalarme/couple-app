import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/privacy/data/data_sources/remote/privacy_data_source.dart';
import 'package:flutter_bloc_starter/features/privacy/data/data_sources/remote/queries/generated/MyConsents.graphql.dart';
import 'package:flutter_bloc_starter/features/privacy/data/models/consent.dart';
import 'package:flutter_bloc_starter/features/privacy/data/repositories/privacy_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockPrivacyDataSource() extends Mock implements PrivacyDataSource;

QueryMyConsentsconsentsCollectionedgesnode _row(
  EnumConsentKind kind,
  bool granted, {
  DateTime? at,
}) => QueryMyConsentsconsentsCollectionedgesnode(
  kind: kind,
  granted: granted,
  version: '1',
  createdAt: at ?? DateTime(2026, 11, 10),
);

void main() {
  late PrivacyDataSource dataSource;

  setUpAll(() => registerFallbackValue(EnumConsentKind.analytics));

  setUp(() => dataSource = _MockPrivacyDataSource());

  PrivacyRepository build() => PrivacyRepository(dataSource: dataSource);

  test('the newest row per kind wins and missing kinds use the defaults', () async {
    when(() => dataSource.getConsents()).thenAnswer(
      (_) async => [
        _row(EnumConsentKind.analytics, false, at: DateTime(2026, 11, 10)),
        _row(EnumConsentKind.analytics, true, at: DateTime(2026, 11, 9)),
        _row(EnumConsentKind.marketing, true),
      ],
    );

    final consents = await build().getConsents();

    expect(consents[ConsentKind.analytics], isFalse);
    expect(consents[ConsentKind.marketing], isTrue);
    expect(consents[ConsentKind.sensitiveData], isTrue);
    expect(consents[ConsentKind.terms], isTrue);
    expect(consents[ConsentKind.ai], isFalse);
    expect(consents[ConsentKind.sensitiveTracks], isFalse);
  });

  test('a withdrawal is recorded with the current version', () async {
    when(
      () => dataSource.grant(
        kind: any(named: 'kind'),
        granted: any(named: 'granted'),
        version: any(named: 'version'),
      ),
    ).thenAnswer((_) async {});

    await build().setConsent(ConsentKind.marketing, granted: false);

    verify(
      () => dataSource.grant(
        kind: EnumConsentKind.marketing,
        granted: false,
        version: PrivacyRepository.consentVersion,
      ),
    ).called(1);
  });
}
