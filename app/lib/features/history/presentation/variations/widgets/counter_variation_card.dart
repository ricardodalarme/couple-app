import 'package:design_system/design_system.dart';

class const CounterVariationCard({
  required final String selfInitials,
  required final String label,
  required final bool isSelected,
  required final VoidCallback onTap,
  final String? partnerInitials,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AppPressable(
      onTap: onTap,
      isSelected: isSelected,
      borderRadius: BorderRadius.circular(AppRadius.ring),
      child: AppCardRing(
        child: AppWashSurface(
          wash: AppWash.hero,
          padding: const EdgeInsets.symmetric(horizontal: AppSpace.s20, vertical: AppSpace.s16),
          child: Row(
            children: [
              BaseAvatarPair(selfInitials: selfInitials, partnerInitials: partnerInitials),
              const SizedBox(width: AppSpace.s14),
              Expanded(
                child: Text(
                  label,
                  style: context.text.titleSm.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colors.textPrimary,
                  ),
                ),
              ),
              if (isSelected)
                AppIcon(icon: AppIcons.check, size: AppIconSize.sm, color: colors.accentLabel),
            ],
          ),
        ),
      ),
    );
  }
}
