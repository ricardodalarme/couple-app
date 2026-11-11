import 'package:flutter_bloc_starter/features/profile/data/data_sources/queries/generated/MySettings.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/mappers/account_settings_mapper.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('maps settings to the account model', () {
    final settings = QueryMySettingsmySettings.fromJson({
      'profileId': 'p1',
      'theme': 'azul',
      'timeZone': 'America/Sao_Paulo',
      'partnerName': 'Rui',
      'togetherSince': '2024-05-01',
      'relationshipStatus': 'together',
      'onboardedAt': null,
      'shareReadReceipts': true,
      'widgetInDiscreet': false,
      'heavyDaySharing': 'always',
      'phase': 'married',
      'goals': ['keep_romance'],
      'locale': 'pt-BR',
      '__typename': 'ProfileSettings',
    });

    expect(
      settings.toModel(),
      AccountSettings(
        theme: .blue,
        profileId: 'p1',
        timeZone: 'America/Sao_Paulo',
        partnerName: 'Rui',
        togetherSince: DateTime(2024, 5, 1),
        shareReadReceipts: true,
        heavyDaySharing: HeavyDaySharing.always,
        phase: 'married',
        goals: const ['keep_romance'],
        locale: 'pt-BR',
      ),
    );
  });
}
