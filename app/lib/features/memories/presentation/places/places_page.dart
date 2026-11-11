import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/memories/data/models/memory.dart';
import 'package:flutter_bloc_starter/features/memories/presentation/places/cubit/places_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The places the couple has been, by name only; no coordinates are ever read or stored.
@RoutePage()
class const PlacesPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<PlacesCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.places;
    final places = context.select((PlacesCubit cubit) => cubit.state.places);
    final cubit = context.read<PlacesCubit>();

    return BaseView(
      body: BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(header: true, child: Text(l10n.title, style: context.text.titleXl)),
            const SizedBox(height: AppSpace.s8),
            BaseNote(text: l10n.privacyNote),
            const SizedBox(height: AppSpace.s20),
            SkeletonizerResourceWidget<List<Place>>(
              places,
              fakeValue: [Place.fake()],
              successBuilder: (list) => list.isEmpty
                  ? BaseEmptyState(title: l10n.emptyTitle, text: l10n.emptyText)
                  : BaseListGroup(
                      children: [
                        for (final place in list)
                          BaseListTile(
                            title: place.name,
                            subtitle: place.memories.length == 1
                                ? l10n.memoryOne
                                : l10n.memoryMany(count: place.memories.length),
                            showsChevron: true,
                            onTap: () => context.pushRoute(PlaceDetailRoute(placeName: place.name)),
                          ),
                      ],
                    ),
              failureBuilder: (_) => BaseEmptyState(
                title: l10n.errorTitle,
                text: l10n.errorText,
                actionText: context.l10n.common.retry,
                onAction: cubit.load,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
