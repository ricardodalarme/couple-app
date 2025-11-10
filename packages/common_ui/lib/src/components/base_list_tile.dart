import 'package:common_ui/common_ui.dart';

class BaseListTile extends StatelessWidget {
  const BaseListTile({required this.title, required this.leading, required this.onTap, super.key});

  final String title;
  final Widget leading;
  final VoidCallback onTap;

  static const double _iconSize = 22;

  @override
  Widget build(BuildContext context) {
    return BaseTapper(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(Spacings.large),
        child: Row(
          children: [
            IconTheme(
              data: IconThemeData(color: context.palette.onBackground, size: _iconSize),
              child: leading,
            ),
            const Gap(Spacings.large),
            Expanded(child: Text(title, style: context.typography.labelMedium)),
          ],
        ),
      ),
    );
  }
}
