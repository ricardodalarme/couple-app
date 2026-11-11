import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/memories/data/models/memory.dart';
import 'package:flutter_bloc_starter/features/memories/presentation/places/cubit/places_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// The memories kept at one place.
@RoutePage()
class const PlaceDetailPage({required final String placeName, super.key})
    extends StatelessWidget
    implements AutoRouteWrapper {
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
            Semantics(header: true, child: Text(placeName, style: context.text.titleXl)),
            const SizedBox(height: AppSpace.s20),
            SkeletonizerResourceWidget<List<Place>>(
              places,
              fakeValue: [Place.fake()],
              successBuilder: (list) {
                final memories = [
                  for (final place in list)
                    if (place.name.toLowerCase() == placeName.toLowerCase()) ...place.memories,
                ];

                return memories.isEmpty
                    ? BaseEmptyState(title: l10n.detailEmptyTitle, text: l10n.detailEmptyText)
                    : BaseListGroup(
                        children: [
                          for (final memory in memories)
                            BaseListTile(
                              title: memory.title,
                              subtitle: [
                                l10n.dateLine(
                                  day: memory.happenedOn.day,
                                  month: l10n.monthsShort[memory.happenedOn.month - 1],
                                  year: memory.happenedOn.year,
                                ),
                                if (memory.body != null) memory.body!,
                              ].join(' · '),
                            ),
                        ],
                      );
              },
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
