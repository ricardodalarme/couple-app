import 'package:quickstart_flutter_bloc/features/_shared/data/data_sources/fragments/generated/PageInfoFragment.graphql.dart';
import 'package:quickstart_flutter_bloc/features/_shared/data/models/page_info.dart';

extension PageInfoResponseMapper on FragmentPageInfoFragment {
  PageInfo toModel() => PageInfo(
    hasNextPage: hasNextPage,
    hasPreviousPage: hasPreviousPage,
    startCursor: startCursor,
    endCursor: endCursor,
  );
}
