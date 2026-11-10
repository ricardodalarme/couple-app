import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/checkin/presentation/checkin/cubit/checkin_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const CheckinIntro({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.checkin;
    final cubit = context.read<CheckinCubit>();

    return BaseMomentContent(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BaseFace(kind: FaceKind.smile, size: FaceSize.showcase),
          const SizedBox(height: AppSpace.s20),
          Semantics(
            header: true,
            child: AppHighlightedText(
              text: l10n.title,
              highlight: l10n.titleHighlight,
              style: context.text.question,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpace.s10),
          Text(
            l10n.introSubtitle,
            textAlign: TextAlign.center,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
        ],
      ),
      footer: Column(
        children: [
          BaseButton.primary(text: l10n.start, onPressed: cubit.start),
          const SizedBox(height: AppSpace.s6),
          BaseButton.text(
            text: l10n.notThisWeek,
            onPressed: () async {
              await _dismiss(context, cubit);
            },
            isFullWidth: true,
          ),
        ],
      ),
    );
  }

  Future<void> _dismiss(BuildContext context, CheckinCubit cubit) async {
    await cubit.dismissThisWeek();
    if (context.mounted) await context.router.maybePop();
  }
}
