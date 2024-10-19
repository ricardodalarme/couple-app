import 'package:core/core.dart';
import 'package:quickstart_flutter_bloc/features/_shared/data/data_sources/fragments/generated/PageInfoFragment.graphql.dart';
import 'package:quickstart_flutter_bloc/features/_shared/domain/entities/page_info.dart';

class PageInfoResponseMapper
    implements Mapper<FragmentPageInfoFragment, PageInfo> {
  const PageInfoResponseMapper();

  @override
  PageInfo map(FragmentPageInfoFragment input) {
    return PageInfo(
      hasNextPage: input.hasNextPage,
      hasPreviousPage: input.hasPreviousPage,
      startCursor: input.startCursor,
      endCursor: input.endCursor,
    );
  }
}
