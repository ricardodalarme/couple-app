import 'package:flutter_bloc_starter/features/distance/data/data_sources/remote/queries/generated/PartnerTimeZone.graphql.dart';
import 'package:network/network.dart';

class DistanceDataSource({required final GQLClient _client}) {
  /// The partner's IANA time zone, or null when there is no partner.
  Future<String?> getPartnerTimeZone() async {
    final response = await _client.query(
      OptionsQueryPartnerTimeZone(fetchPolicy: FetchPolicy.networkOnly),
    );

    return validateResponseData(response, getData: (data) => data.partnerTimeZone);
  }
}
