import 'package:design_system/design_system.dart';

/// Page shell for a gallery example: a titled, scrollable column.
class const GalleryPage({
  required final String title,
  required final List<Widget> children,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colors.bgScreen,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpace.s24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: context.text.titleLg),
            const SizedBox(height: AppSpace.s20),
            ...children,
          ],
        ),
      ),
    );
  }
}

/// A labelled block of examples.
class const GallerySection({
  required final String title,
  required final List<Widget> children,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpace.s28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: context.text.label.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s12),
          ...children,
        ],
      ),
    );
  }
}

/// Lays examples out in a wrapping row with the system's gap.
class const GalleryRow({required final List<Widget> children, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpace.s12,
      runSpacing: AppSpace.s12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: children,
    );
  }
}

/// One example with a caption underneath.
class const GalleryItem({
  required final String label,
  required final Widget child,
  final bool centered = false,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        child,
        const SizedBox(height: AppSpace.s6),
        Text(
          label,
          textAlign: centered ? TextAlign.center : TextAlign.start,
          style: context.text.micro.copyWith(color: context.colors.textSecondary),
        ),
      ],
    );
  }
}

/// A fixed-width column so cards keep their intended proportion.
class const GallerySurface({required final Widget child, final double width = 350, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SizedBox(width: width, child: child);
}
