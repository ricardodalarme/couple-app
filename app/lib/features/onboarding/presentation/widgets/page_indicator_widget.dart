import 'package:design_system/design_system.dart';

class const PageIndicatorWidget({
  required final int current,
  required final int totalPages,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        final isSelected = current == index;

        return AnimatedContainer(
          duration: context.motionDuration(AppMotion.base),
          margin: const EdgeInsets.symmetric(horizontal: AppSpace.s4),
          height: AppSpace.s8,
          width: isSelected ? AppSpace.s24 : AppSpace.s8,
          decoration: BoxDecoration(
            color: isSelected ? context.colors.accentLabel : context.colors.iconMuted,
            borderRadius: BorderRadius.circular(AppRadius.pill),
          ),
        );
      }),
    );
  }
}
