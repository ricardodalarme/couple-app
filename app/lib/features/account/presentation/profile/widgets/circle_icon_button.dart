import 'package:common_ui/common_ui.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({required this.label, required this.icon, required this.onTap, super.key});

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BaseTooltip(
      text: label,
      child: Column(
        children: [
          BaseTapper(
            onTap: onTap,
            backgroundColor: context.palette.container,
            shape: const CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(Spacings.xlarge),
              child: Icon(icon, color: context.palette.onContainer),
            ),
          ),
          const Gap(Spacings.medium),
          Text(label),
        ],
      ),
    );
  }
}
