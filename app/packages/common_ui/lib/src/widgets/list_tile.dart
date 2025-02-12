import 'package:common_ui/common_ui.dart';

class ListTile extends StatelessWidget {
  const ListTile({required this.title, required this.leading, required this.onTap, super.key});

  final String title;
  final Widget leading;
  final VoidCallback onTap;

  static const double _iconSize = 22;

  @override
  Widget build(BuildContext context) {
    return Tapper(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(Spacings.large),
        child: Row(
          children: [
            IconTheme(
              data: IconThemeData(color: context.colors.onSurface, size: _iconSize),
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
