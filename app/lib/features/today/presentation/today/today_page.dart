import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/_shared/presentation/errors/app_error_view.dart';
import 'package:flutter_bloc_starter/features/today/data/models/today_home.dart';
import 'package:flutter_bloc_starter/features/today/presentation/today/cubit/today_cubit.dart';
import 'package:flutter_bloc_starter/features/today/presentation/today/widgets/partner_unpaired_notice.dart';
import 'package:flutter_bloc_starter/features/today/presentation/today/widgets/today_content.dart';

@RoutePage()
class const TodayPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<TodayCubit>()..start(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final home = context.select((TodayCubit cubit) => cubit.state.home);
    final isOffline = context.select((TodayCubit cubit) => cubit.state.isOffline);
    final selfName = context.select((TodayCubit cubit) => cubit.state.selfName);
    final partnerHint = context.select((TodayCubit cubit) => cubit.state.partnerHint);
    final isFirstDay = context.select((TodayCubit cubit) => cubit.state.isFirstDay);
    final showUnpairNotice = context.select((TodayCubit cubit) => cubit.state.showUnpairNotice);
    final unpairedPartnerName = context.select(
      (TodayCubit cubit) => cubit.state.unpairedPartnerName,
    );

    return BaseView(
      appBar: null,
      body: showUnpairNotice
          ? PartnerUnpairedNotice(
              partnerName: unpairedPartnerName,
              onOk: context.read<TodayCubit>().acknowledgeUnpairNotice,
            )
          : BaseRefreshable(
              onRefresh: context.read<TodayCubit>().load,
              child: BaseStackedContent(
                body: SkeletonizerResourceWidget<TodayHome>(
                  home,
                  fakeValue: const TodayHome.fake(),
                  successBuilder: (value) => TodayContent(
                    home: value,
                    isOffline: isOffline,
                    selfName: selfName,
                    partnerHint: partnerHint,
                    isFirstDay: isFirstDay,
                  ),
                  failureBuilder: (failure) =>
                      AppErrorView(exception: failure, onRetry: context.read<TodayCubit>().load),
                ),
              ),
            ),
    );
  }
}
