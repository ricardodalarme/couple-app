import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/fragments/generated/PageInfoFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/_shared/data/models/page_info.dart';

extension PageInfoResponseMapper on FragmentPageInfoFragment {
  PageInfo toModel() => PageInfo(
    hasNextPage: hasNextPage,
    hasPreviousPage: hasPreviousPage,
    startCursor: startCursor,
    endCursor: endCursor,
  );
}
