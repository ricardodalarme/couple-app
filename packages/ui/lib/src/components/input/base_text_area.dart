import 'package:material_ui/material_ui.dart';
import 'package:ui/ui.dart';

const double _minHeight = 150;
const double _counterThresholdRatio = .8;
const double _counterRight = 18;
const double _counterBottom = 14;
const double _cursorHeight = 22;

/// The large writing field used for slips, answers, and notes.
///
/// The Material text field keeps only its editing behaviour: no decoration
/// chrome, a system caret tinted by `accent.highlight`, and a minimum height of
/// 150 that grows up to [maxLines]. The counter appears at the bottom right
/// once the text passes 80% of [maxLength]; [hasError] paints the error edge
/// and shows [errorText] below the ring. A read-only field keeps the same
/// surface but hides the caret and the counter while the text stays selectable.
class const BaseTextArea({
  final String? text,
  final String? hint,
  final int maxLength = 140,
  final bool showCounter = true,
  final bool hasError = false,
  final String? errorText,
  final ValueChanged<String>? onChanged,
  final bool isEnabled = true,
  final bool isReadOnly = false,
  final int maxLines = 5,
  super.key,
}) extends StatefulWidget {
  @override
  State<BaseTextArea> createState() => _BaseTextAreaState();
}

class _BaseTextAreaState() extends State<BaseTextArea> {
  late final TextEditingController _controller;
  int _length = 0;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text ?? '');
    _length = _controller.text.length;
    _controller.addListener(_handleChanged);
  }

  @override
  void didUpdateWidget(BaseTextArea oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text case final text?) {
      if (text != _controller.text) {
        _length = text.length;
        _controller.value = TextEditingValue(
          text: text,
          selection: TextSelection.collapsed(offset: text.length),
        );
      }
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_handleChanged);
    _controller.dispose();
    super.dispose();
  }

  void _handleChanged() {
    final length = _controller.text.length;
    if (length != _length) setState(() => _length = length);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = context.text;
    final threshold = (widget.maxLength * _counterThresholdRatio).ceil();
    final showsCounter = !widget.isReadOnly && widget.showCounter && _length >= threshold;

    final field = DecoratedBox(
      decoration: BoxDecoration(
        color: colors.bgSurface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: widget.hasError
            ? Border.all(color: AppPalette.errorInk, width: AppBorder.selected)
            : null,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpace.s20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: _minHeight),
              // The field owns its Material ancestor so it works outside a
              // Scaffold (modal routes, previews, embedded surfaces).
              child: Material(
                type: MaterialType.transparency,
                child: _FieldLocalizations(
                  child: TextField(
                    controller: _controller,
                    enabled: widget.isEnabled,
                    readOnly: widget.isReadOnly,
                    showCursor: !widget.isReadOnly,
                    enableInteractiveSelection: true,
                    style: text.bodyLg.copyWith(color: colors.textPrimary),
                    cursorColor: colors.accentHighlight,
                    cursorHeight: _cursorHeight,
                    maxLines: widget.maxLines,
                    minLines: 1,
                    maxLength: widget.maxLength,
                    textAlignVertical: TextAlignVertical.top,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    onChanged: widget.onChanged,
                    buildCounter: (
                      _, {
                      required currentLength,
                      required isFocused,
                      required maxLength,
                    }) => null,
                    decoration: InputDecoration.collapsed(
                      hintText: widget.hint,
                      hintStyle: text.bodyLg.copyWith(color: colors.textPlaceholder),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (showsCounter)
            Positioned(
              right: _counterRight,
              bottom: _counterBottom,
              child: Text(
                '$_length/${widget.maxLength}',
                style: text.micro.copyWith(color: colors.textPlaceholder),
              ),
            ),
        ],
      ),
    );

    if (!widget.hasError || widget.errorText == null) {
      return AppCardRing(child: field);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppCardRing(child: field),
        Padding(
          padding: const EdgeInsets.only(top: AppSpace.s8, left: AppSpace.s4, right: AppSpace.s4),
          child: Text(widget.errorText!, style: text.caption.copyWith(color: AppPalette.errorInk)),
        ),
      ],
    );
  }
}

/// Supplies English material localizations only when the host provides none
/// (previews and isolated component galleries). Real apps keep their own.
class const _FieldLocalizations({required final Widget child}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Localizations.of<MaterialLocalizations>(context, MaterialLocalizations) != null) {
      return child;
    }

    return Localizations(
      locale: Localizations.maybeLocaleOf(context) ?? const Locale('en', 'US'),
      delegates: const [
        DefaultWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
      ],
      child: child,
    );
  }
}
