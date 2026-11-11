import 'package:flutter_bloc_starter/features/widgets/data/data_sources/queries/generated/CouplePhoto.graphql.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/couple_photo.dart';

extension CouplePhotoNodeMapper on QueryCouplePhotocouplePhotosCollectionedgesnode {
  CouplePhoto toModel({String? url}) => CouplePhoto(
    coupleId: coupleId,
    storagePath: storagePath,
    uploadedBy: uploadedBy,
    updatedAt: updatedAt,
    url: url,
  );
}
