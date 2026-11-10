import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/unpair/cubit/unpair_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class const RelationshipPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<UnpairCubit>()..loadPartner(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.unpair;
    final partnerName = context.select((UnpairCubit cubit) => cubit.state.partnerName);
    final name = partnerName ?? l10n.unnamedPartner;

    return BaseView(
      appBar: BaseAppBar(title: l10n.relationship.title),
      body: BaseStackedContent(
        body: BaseListGroup(
          children: [
            BaseListTile(
              title: l10n.relationship.unpair(name: name),
              isDestructive: true,
              showsChevron: true,
              onTap: () => context.pushRoute(const UnpairRoute()),
            ),
            BaseListTile(
              title: l10n.relationship.ended,
              showsChevron: true,
              onTap: () => context.pushRoute(const BreakupRoute()),
            ),
          ],
        ),
      ),
    );
  }
}
