import 'package:common_ui/common_ui.dart';

class const CircleIconButton({
  required final String label,
  required final IconData icon,
  required final VoidCallback onTap,
  super.key,
}) extends StatelessWidget {
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
