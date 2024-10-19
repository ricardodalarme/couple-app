import 'dart:async';

import 'package:common/common.dart';
import 'package:quickstart_flutter_bloc/features/_shared/data/data_sources/fragments/generated/PageInfoFragment.graphql.dart';
import 'package:quickstart_flutter_bloc/features/_shared/data/mappers/page_info_response_mapper.dart';
import 'package:quickstart_flutter_bloc/features/_shared/domain/entities/page_info.dart';

class SharedInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerFactory<Mapper<FragmentPageInfoFragment, PageInfo>>(
      PageInfoResponseMapper.new,
    );
  }
}
