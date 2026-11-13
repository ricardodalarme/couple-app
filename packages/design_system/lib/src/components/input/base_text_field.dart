import 'package:design_system/design_system.dart';
import 'package:design_system/design_system_l10n.dart';
import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

const double _fieldHeight = 54;
const double _fieldRadius = 18;
const double _fieldPadding = 18;
const double _fieldGap = 10;
const double _labelGap = 6;
const double _messageGap = 6;
const double _messageIconSize = 16;
const double _messageIconGap = 6;
const double _labelInset = 4;
const double _disabledOpacity = .4;

class const BaseTextField({
  final String? text,
  final String? label,
  final String? hint,
  final String? helpText,
  final String? errorText,
  final IconData? leadingIcon,
  final Widget? trailingAction,
  final BaseTextFieldType type = BaseTextFieldType.text,
  final ValueChanged<String>? onChanged,
  final ValueChanged<String>? onSubmitted,
  final TextInputAction? textInputAction,
  final String? semanticLabel,
  final String? showPasswordLabel,
  final String? hidePasswordLabel,
  final bool isEnabled = true,
  super.key,
}) extends StatefulWidget {
  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

/// Input behaviours offered by [BaseTextField].
enum BaseTextFieldType() {
  /// Free text.
  text,

  /// E-mail keyboard without autocorrect.
  email,

  /// Uppercase code with wide letter spacing.
  inviteCode,

  /// Obscured text with a show/hide action.
  password,
}

class _BaseTextFieldState() extends State<BaseTextField> {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text ?? '');
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void didUpdateWidget(BaseTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.type != widget.type) _isObscured = true;
    // Only follow a value the parent actually changed; a rebuild that repeats
    // the same text must not overwrite what the person just typed.
    final text = widget.text;
    if (text != null && text != oldWidget.text && text != _controller.text) {
      _controller.value = TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    }
  }

  @override
  void dispose() {
    _focusNode
      ..removeListener(_handleFocusChange)
      ..dispose();
    _controller.dispose();
    super.dispose();
  }

  void _handleFocusChange() => setState(() {});

  bool get _isPassword => widget.type == BaseTextFieldType.password;

  List<TextInputFormatter>? get _formatters {
    if (widget.type != BaseTextFieldType.inviteCode) return null;

    return [
      TextInputFormatter.withFunction(
        (oldValue, newValue) => newValue.copyWith(text: newValue.text.toUpperCase()),
      ),
    ];
  }

  TextInputType get _keyboardType => switch (widget.type) {
    .text => TextInputType.text,
    .email => TextInputType.emailAddress,
    .inviteCode => TextInputType.text,
    .password => TextInputType.visiblePassword,
  };

  Widget? get _trailing {
    if (widget.trailingAction case final action?) return action;
    if (!_isPassword) return null;

    final isObscured = _isObscured;
    final l10n = context.designSystemL10nOrBase.input;

    return AppPressable(
      onTap: () => setState(() => _isObscured = !isObscured),
      isEnabled: widget.isEnabled,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      semanticLabel: isObscured
          ? widget.showPasswordLabel ?? l10n.showPassword
          : widget.hidePasswordLabel ?? l10n.hidePassword,
      enforceMinTapTarget: true,
      child: AppIcon(
        icon: isObscured ? AppIcons.eye : AppIcons.eye_off,
        color: context.colors.iconMuted,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = context.text;
    final hasError = widget.errorText != null;
    final borderColor = hasError
        ? AppPalette.errorInk
        : _focusNode.hasFocus
        ? colors.borderSelected
        : colors.borderDefault;
    final borderWidth = hasError || _focusNode.hasFocus ? AppBorder.selected : AppBorder.hair;
    final message = widget.errorText ?? widget.helpText;
    final messageColor = hasError ? AppPalette.errorInk : colors.textSecondary;
    final trailing = _trailing;

    final fieldContent = AnimatedContainer(
      duration: context.motionDuration(AppMotion.fast),
      curve: AppMotion.fastCurve,
      constraints: const BoxConstraints(minHeight: _fieldHeight),
      padding: const EdgeInsets.symmetric(horizontal: _fieldPadding),
      decoration: BoxDecoration(
        color: colors.bgSurface,
        borderRadius: BorderRadius.circular(_fieldRadius),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: Row(
        spacing: _fieldGap,
        children: [
          if (widget.leadingIcon case final icon?) AppIcon(icon: icon, color: colors.textSecondary),
          Expanded(
            child: Material(
              type: MaterialType.transparency,
              child: _FieldLocalizations(
                child: Semantics(
                  label: widget.semanticLabel,
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    enabled: widget.isEnabled,
                    style: text.body.copyWith(
                      color: colors.textPrimary,
                      letterSpacing: widget.type == BaseTextFieldType.inviteCode ? 3 : null,
                    ),
                    cursorColor: colors.accentHighlight,
                    keyboardType: _keyboardType,
                    textInputAction: widget.textInputAction ?? TextInputAction.done,
                    textCapitalization: widget.type == BaseTextFieldType.inviteCode
                        ? TextCapitalization.characters
                        : TextCapitalization.none,
                    autocorrect: widget.type != BaseTextFieldType.password,
                    enableSuggestions: widget.type != BaseTextFieldType.password,
                    obscureText: _isPassword && _isObscured,
                    inputFormatters: _formatters,
                    onChanged: widget.onChanged,
                    onSubmitted: widget.onSubmitted,
                    decoration: InputDecoration.collapsed(
                      hintText: widget.hint,
                      hintStyle: text.body.copyWith(color: colors.textPlaceholder),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ?trailing,
        ],
      ),
    );
    final field = widget.isEnabled
        ? fieldContent
        : Opacity(opacity: _disabledOpacity, child: fieldContent);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.label case final label?)
          Padding(
            padding: const EdgeInsets.only(left: _labelInset, bottom: _labelGap),
            child: Text(
              label,
              style: text.caption.copyWith(
                fontWeight: FontWeight.w600,
                color: colors.textSecondary,
              ),
            ),
          ),
        field,
        if (message != null)
          Padding(
            padding: const EdgeInsets.only(top: _messageGap, left: _labelInset, right: _labelInset),
            child: Semantics(
              liveRegion: hasError,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: _messageIconGap,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: AppIcon(
                      icon: hasError ? AppIcons.warning : AppIcons.info,
                      size: _messageIconSize,
                      color: messageColor,
                    ),
                  ),
                  Expanded(
                    child: Text(message, style: text.caption.copyWith(color: messageColor)),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

/// Supplies English material localizations when the host provides none.
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
