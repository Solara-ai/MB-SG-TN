import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:schedule_gen_and_time_management/src/utils/extensions/string_extension.dart';
final _defaultBorderRadius = BorderRadius.circular(8);
class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.undoController,
    TextInputType? keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled = true,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorOpacityAnimates,
    this.cursorColor,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    bool? enableInteractiveSelection,
    this.selectionControls,
    this.onTap,
    this.onTapOutside,
    this.mouseCursor,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints = const <String>[],
    this.contentInsertionConfiguration,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.scribbleEnabled = true,
    this.enableIMEPersonalizedLearning = true,
    this.contextMenuBuilder = _defaultContextMenuBuilder,
    this.canRequestFocus = true,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.label,
    this.labelStyle,
    this.labelType = LabelType.inline,
    this.isRequired = false,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.errorText,
    this.labelBuilder,
    this.errorBuilder,
    this.size = TextFieldSize.medium,
    this.style,
    this.constraints,
    this.contentPadding,
    this.floatingLabelStyle,
    this.floatingLabelBehavior,
    this.borderRadius,
  })  : smartDashesType = smartDashesType ?? (obscureText ? SmartDashesType.disabled : SmartDashesType.enabled),
        smartQuotesType = smartQuotesType ?? (obscureText ? SmartQuotesType.disabled : SmartQuotesType.enabled),
        keyboardType = keyboardType ?? (maxLines == 1 ? TextInputType.text : TextInputType.multiline),
        enableInteractiveSelection = enableInteractiveSelection ?? (!readOnly || !obscureText);

  final TextMagnifierConfiguration? magnifierConfiguration;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType smartDashesType;
  final SmartQuotesType smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final bool readOnly;
  final bool? showCursor;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final bool? cursorOpacityAnimates;
  final Color? cursorColor;
  final ui.BoxHeightStyle selectionHeightStyle;
  final ui.BoxWidthStyle selectionWidthStyle;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final DragStartBehavior dragStartBehavior;
  bool get selectionEnabled => enableInteractiveSelection;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final MouseCursor? mouseCursor;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final Iterable<String>? autofillHints;
  final Clip clipBehavior;
  final String? restorationId;
  final bool scribbleEnabled;
  final bool enableIMEPersonalizedLearning;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final bool canRequestFocus;
  final UndoHistoryController? undoController;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final String? label;
  final TextStyle? labelStyle;
  final LabelType labelType;
  final bool isRequired;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? constraints;
  final String? errorText;
  final Widget? labelBuilder;
  final Widget? errorBuilder;
  final TextFieldSize size;
  final TextStyle? style;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? floatingLabelStyle;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final BorderRadius? borderRadius;

  static Widget _defaultContextMenuBuilder(BuildContext context, EditableTextState editableTextState) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  @override
  Widget build(BuildContext context) {
    final borderSide = BorderSide(width: 1, color: R.color.inputColorBorder);
    final border = OutlineInputBorder(borderRadius: borderRadius ?? _defaultBorderRadius, borderSide: borderSide);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelType == LabelType.inline && (labelBuilder != null || !label.isNullOrEmpty())) ...[
          labelBuilder ?? Text(label!, style: labelStyle ?? R.textStyle.inter_regular_16_400),
          const SizedBox(height: 8),
        ],
        TextField(
          restorationId: restorationId,
          controller: controller,
          focusNode: focusNode,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textAlignVertical: textAlignVertical,
          textDirection: textDirection,
          textCapitalization: textCapitalization,
          autofocus: autofocus,
          readOnly: readOnly,
          showCursor: showCursor,
          obscuringCharacter: obscuringCharacter,
          obscureText: obscureText,
          autocorrect: autocorrect,
          smartDashesType: smartDashesType,
          smartQuotesType: smartQuotesType,
          enableSuggestions: enableSuggestions,
          maxLengthEnforcement: maxLengthEnforcement,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          maxLength: maxLength,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          onSubmitted: onSubmitted,
          inputFormatters: inputFormatters,
          enabled: enabled,
          cursorWidth: cursorWidth,
          cursorHeight: cursorHeight,
          cursorRadius: cursorRadius,
          cursorColor: cursorColor,
          scrollPadding: scrollPadding,
          scrollPhysics: scrollPhysics,
          keyboardAppearance: keyboardAppearance,
          enableInteractiveSelection: enableInteractiveSelection,
          selectionControls: selectionControls,
          buildCounter: buildCounter,
          autofillHints: autofillHints,
          scrollController: scrollController,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
          mouseCursor: mouseCursor,
          contextMenuBuilder: contextMenuBuilder,
          spellCheckConfiguration: spellCheckConfiguration,
          magnifierConfiguration: magnifierConfiguration,
          undoController: undoController,
          onAppPrivateCommand: onAppPrivateCommand,
          cursorOpacityAnimates: cursorOpacityAnimates,
          selectionHeightStyle: selectionHeightStyle,
          selectionWidthStyle: selectionWidthStyle,
          dragStartBehavior: dragStartBehavior,
          contentInsertionConfiguration: contentInsertionConfiguration,
          clipBehavior: clipBehavior,
          scribbleEnabled: scribbleEnabled,
          canRequestFocus: canRequestFocus,
          onTapOutside: onTapOutside ?? (_) => FocusScope.of(context).unfocus(),
          style: style ?? R.textStyle.inter_regular_16_400,
          decoration: InputDecoration(
            error: errorText != null ? const SizedBox() : null,
            border: border,
            enabledBorder: border.copyWith(borderSide: borderSide.copyWith(color: R.color.inputColorBorder)),
            disabledBorder: border.copyWith(borderSide: borderSide.copyWith(color: R.color.background)),
            focusedBorder: border.copyWith(borderSide: borderSide.copyWith(color: R.color.info)),
            errorBorder: border.copyWith(borderSide: borderSide.copyWith(color: R.color.colorErrorBase)),
            focusedErrorBorder: border.copyWith(borderSide: borderSide.copyWith(color: R.color.colorErrorBase)),
            labelText: labelType == LabelType.floating ? (labelBuilder == null ? label : null) : null,
            label: labelType == LabelType.floating ? labelBuilder : null,
            labelStyle: labelType == LabelType.floating ? (labelStyle ?? R.textStyle.inter_regular_16_400) : null,
            alignLabelWithHint: true,
            hintText: hintText,
            hintStyle: hintStyle ?? R.textStyle.inter_regular_16_400.copyWith(color: R.color.inputColorTextPlaceholder),
            floatingLabelStyle: floatingLabelStyle ?? R.textStyle.inter_regular_16_400,
            contentPadding: size.contentPadding,
            isDense: true,
            counterText: '',
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixIconConstraints,
            suffixIcon: suffixIcon,
            suffixIconConstraints: suffixIconConstraints,
            filled: true,
            constraints: constraints,
            fillColor: R.color.transparent,
            floatingLabelBehavior: floatingLabelBehavior ?? FloatingLabelBehavior.auto,
          ),
        ),
        errorBuilder ??
            Builder(
              builder: (context) {
                final _errorText = errorText;
                if (_errorText == null) {
                  return const SizedBox();
                }

                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                  child: Text(
                    _errorText,
                    style: R.textStyle.inter_regular_12_400.copyWith(color: R.color.colorErrorBase),
                  ),
                );
              },
            )
      ],
    );
  }
}

enum TextFieldSize {
  large,
  medium;

  EdgeInsets get contentPadding {
    switch (this) {
      case TextFieldSize.large:
        return const EdgeInsets.symmetric(vertical: 16, horizontal: 12);
      case TextFieldSize.medium:
        return const EdgeInsets.symmetric(vertical: 8, horizontal: 12);
    }
  }
}

enum LabelType {
  floating,
  inline,
}
