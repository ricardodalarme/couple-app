import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notes/presentation/compose/cubit/compose_cubit.dart';
import 'package:flutter_bloc_starter/features/notes/presentation/compose/widgets/drawing_painter.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

const double _penSize = 32;

/// A square sheet to draw on with a finger, plus the pens, eraser and undo.
class const DrawingCanvas({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.notes;
    final colors = context.colors;
    final strokes = context.select((ComposeCubit cubit) => cubit.state.strokes);
    final tool = context.select((ComposeCubit cubit) => cubit.state.tool);
    final penIndex = context.select((ComposeCubit cubit) => cubit.state.penIndex);
    final cubit = context.read<ComposeCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Semantics(
          label: l10n.canvasLabel,
          child: AspectRatio(
            aspectRatio: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: drawingPaper,
                borderRadius: BorderRadius.circular(AppRadius.xl),
                border: Border.all(color: colors.borderDefault),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.xl),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final size = constraints.biggest;
                    Offset fraction(Offset local) => Offset(
                      (local.dx / size.width).clamp(0, 1),
                      (local.dy / size.height).clamp(0, 1),
                    );

                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onPanStart: (details) =>
                          cubit.onStrokeStarted(fraction(details.localPosition)),
                      onPanUpdate: (details) =>
                          cubit.onStrokeUpdated(fraction(details.localPosition)),
                      child: CustomPaint(
                        size: size,
                        painter: DrawingPainter(strokes: strokes),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpace.s12),
        Row(
          spacing: AppSpace.s12,
          children: [
            for (var index = 0; index < drawingPens.length; index++)
              _PenDot(
                color: drawingPens[index],
                label: l10n.pens[index],
                isSelected: tool == DrawingTool.pen && penIndex == index,
                onTap: () => cubit.onPenChanged(index),
              ),
          ],
        ),
        const SizedBox(height: AppSpace.s12),
        Wrap(
          spacing: AppSpace.s8,
          runSpacing: AppSpace.s8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            BaseChoiceChip(
              label: l10n.eraser,
              isSelected: tool == DrawingTool.eraser,
              onTap: () => cubit.onToolChanged(
                tool == DrawingTool.eraser ? DrawingTool.pen : DrawingTool.eraser,
              ),
            ),
            if (strokes.isNotEmpty) ...[
              BaseTextLink(text: l10n.undo, onPressed: cubit.undo),
              BaseTextLink(text: l10n.clear, onPressed: cubit.clearDrawing),
            ],
          ],
        ),
        if (strokes.isEmpty) ...[
          const SizedBox(height: AppSpace.s8),
          Text(l10n.emptyDrawing, style: context.text.bodySm.copyWith(color: colors.textSecondary)),
        ],
      ],
    );
  }
}

class const _PenDot({
  required final Color color,
  required final String label,
  required final bool isSelected,
  required final VoidCallback onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: isSelected,
      label: label,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: AppMotion.fast,
          width: _penSize,
          height: _penSize,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: context.colors.borderSelected,
              width: isSelected ? AppBorder.focus : 0,
            ),
          ),
        ),
      ),
    );
  }
}
