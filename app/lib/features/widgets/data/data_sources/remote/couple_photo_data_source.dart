import 'package:flutter_bloc_starter/features/widgets/data/data_sources/remote/mutations/generated/DeleteCouplePhoto.graphql.dart';
import 'package:flutter_bloc_starter/features/widgets/data/data_sources/remote/mutations/generated/UpsertCouplePhoto.graphql.dart';
import 'package:flutter_bloc_starter/features/widgets/data/data_sources/remote/queries/generated/CouplePhoto.graphql.dart';
import 'package:flutter_bloc_starter/features/widgets/data/mappers/couple_photo_mapper.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/couple_photo.dart';
import 'package:network/network.dart';

/// The current couple id and its photo row, read in one round trip.
typedef CouplePhotoSnapshot = ({String? coupleId, CouplePhoto? photo});

class CouplePhotoDataSource({required final GQLClient _client}) {
  Future<CouplePhotoSnapshot> getPhoto() async {
    final response = await _client.query(
      OptionsQueryCouplePhoto(fetchPolicy: FetchPolicy.networkOnly),
    );

    return validateResponseData(
      response,
      getData: (data) => (
        coupleId: data.myCouple?.id,
        photo: data.couplePhotosCollection.edges.firstOrNull?.node.toModel(),
      ),
    );
  }

  /// The number of rows the update touched; `0` means the couple has no row yet.
  Future<int> update({
    required String coupleId,
    required String storagePath,
    required String uploadedBy,
  }) async {
    final response = await _client.mutate(
      OptionsMutationUpsertCouplePhoto(
        variables: VariablesMutationUpsertCouplePhoto(
          coupleId: coupleId,
          storagePath: storagePath,
          uploadedBy: uploadedBy,
        ),
      ),
    );

    return validateResponseData(
      response,
      getData: (data) => data.updateCouplePhotosCollection.affectedCount,
    );
  }

  Future<int> insert({
    required String coupleId,
    required String storagePath,
    required String uploadedBy,
  }) async {
    final response = await _client.mutate(
      OptionsMutationInsertCouplePhoto(
        variables: VariablesMutationInsertCouplePhoto(
          coupleId: coupleId,
          storagePath: storagePath,
          uploadedBy: uploadedBy,
        ),
      ),
    );

    return validateResponseData(
      response,
      getData: (data) => data.insertIntoCouplePhotosCollection?.affectedCount ?? 0,
    );
  }

  Future<int> delete(String coupleId) async {
    final response = await _client.mutate(
      OptionsMutationDeleteCouplePhoto(
        variables: VariablesMutationDeleteCouplePhoto(coupleId: coupleId),
      ),
    );

    return validateResponseData(
      response,
      getData: (data) => data.deleteFromCouplePhotosCollection.affectedCount,
    );
  }
}
