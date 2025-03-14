import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/string_extension.dart';
import 'package:schedule_gen_and_time_management/src/utils/validator_ultils.dart';
import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_text_field.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/form_field_wrapper.dart';

class CommonTextFormField extends FormField<String> {
  CommonTextFormField({
    super.key,
    this.controller,
    String? initialValue,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    bool? showCursor,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool enableSuggestions = true,
    MaxLengthEnforcement? maxLengthEnforcement,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    this.onChanged,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    super.onSaved,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    bool enabled = true,
    double cursorWidth = 2.0,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool? enableInteractiveSelection,
    TextSelectionControls? selectionControls,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    AutovalidateMode? autovalidateMode,
    ScrollController? scrollController,
    super.restorationId,
    bool enableIMEPersonalizedLearning = true,
    MouseCursor? mouseCursor,
    EditableTextContextMenuBuilder? contextMenuBuilder = _defaultContextMenuBuilder,
    SpellCheckConfiguration? spellCheckConfiguration,
    TextMagnifierConfiguration? magnifierConfiguration,
    UndoHistoryController? undoController,
    AppPrivateCommandCallback? onAppPrivateCommand,
    bool? cursorOpacityAnimates,
    ui.BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight,
    ui.BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ContentInsertionConfiguration? contentInsertionConfiguration,
    Clip clipBehavior = Clip.hardEdge,
    bool scribbleEnabled = true,
    bool canRequestFocus = true,
    String? label,
    TextStyle? labelStyle,
    bool isRequired = false,
    String? hintText,
    TextStyle? hintStyle,
    Widget? prefixIcon,
    BoxConstraints? prefixIconConstraints,
    Widget? suffixIcon,
    BoxConstraints? suffixIconConstraints,
    BoxConstraints? constraints,
    TextStyle? style,
    EdgeInsetsGeometry? contentPadding,
    Widget? labelBuilder,
    Widget? errorBuilder,
    Widget Function(FormFieldState<String> field)? builder,
    TextFieldSize? size,
    FloatingLabelBehavior? floatingLabelBehavior,
    BorderRadius? borderRadius,
  }) : super(
          initialValue: controller != null ? controller.text : (initialValue ?? ''),
          enabled: enabled,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          validator: (value) {
            String? result;
            if (isRequired) {
              result = ValidatorUltils.requiredFileValidator(value, fileLabel: label ?? '');
              result ??= validator?.call(value);
            } else {
              result = validator?.call(value);
            }
            return result;
          },
          builder: builder ??
              (field) {
                final state = field as CommonTextFormFieldState;
                void onChangedHandler(String value) {
                  field.didChange(value);
                  onChanged?.call(value);
                }

                final defaultRequiredLabel = Text.rich(
                  TextSpan(
                    text: label,
                    style: R.textStyle.inter_regular_16_400.copyWith(color: R.color.text),
                  ),
                );

                return FormFieldWrapper(
                  key: state._key,
                  hasError: state.hasError,
                  child: CommonTextField(
                    restorationId: restorationId,
                    controller: state.effectiveController,
                    focusNode: focusNode ?? state._focusNode,
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
                    smartDashesType: smartDashesType ??
                        (obscureText ? SmartDashesType.disabled : SmartDashesType.enabled),
                    smartQuotesType: smartQuotesType ??
                        (obscureText ? SmartQuotesType.disabled : SmartQuotesType.enabled),
                    enableSuggestions: enableSuggestions,
                    maxLengthEnforcement: maxLengthEnforcement,
                    maxLines: maxLines,
                    minLines: minLines,
                    expands: expands,
                    maxLength: maxLength,
                    onChanged: onChangedHandler,
                    onTap: onTap,
                    onTapOutside: (_) => state._focusNode.unfocus(),
                    onEditingComplete: onEditingComplete,
                    onSubmitted: onFieldSubmitted,
                    inputFormatters: inputFormatters,
                    enabled: enabled,
                    cursorWidth: cursorWidth,
                    cursorHeight: cursorHeight,
                    cursorRadius: cursorRadius,
                    borderRadius: borderRadius,
                    cursorColor: cursorColor ?? R.color.black,
                    scrollPadding: scrollPadding,
                    scrollPhysics: scrollPhysics,
                    keyboardAppearance: keyboardAppearance,
                    enableInteractiveSelection:
                        enableInteractiveSelection ?? (!obscureText || !readOnly),
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
                    label: label,
                    labelStyle: labelStyle ?? R.textStyle.inter_medium_14_500.copyWith(color: R.color.text),
                    hintText: hintText,
                    hintStyle: hintStyle ??
                        R.textStyle.inter_regular_16_400
                            .copyWith(color: R.color.colorTextDescription),
                    isRequired: isRequired,
                    prefixIcon: prefixIcon,
                    prefixIconConstraints: prefixIconConstraints,
                    suffixIcon: suffixIcon,
                    suffixIconConstraints: suffixIconConstraints,
                    errorText: state.errorText,
                    labelBuilder: labelBuilder ??
                        ((isRequired && !label.isNullOrEmpty()) ? defaultRequiredLabel : null),
                    errorBuilder: errorBuilder,
                    size: size ?? TextFieldSize.medium,
                    floatingLabelBehavior: floatingLabelBehavior,
                    constraints: constraints,
                    style: style ?? R.textStyle.inter_regular_16_400.copyWith(color: R.color.text),
                    contentPadding: contentPadding,
                  ),
                );
              },
        );

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  static Widget _defaultContextMenuBuilder(
      BuildContext context, EditableTextState editableTextState) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  @override
  FormFieldState<String> createState() => CommonTextFormFieldState();
}

class CommonTextFormFieldState extends FormFieldState<String> {
  final _key = GlobalKey();
  RestorableTextEditingController? _controller;
  TextEditingController get effectiveController => _textFormField.controller ?? _controller!.value;
  CommonTextFormField get _textFormField => super.widget as CommonTextFormField;
  bool _hasFirstTimeValidate = false;
  final _focusNode = FocusNode();

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    super.restoreState(oldBucket, initialRestore);
    if (_controller != null) {
      _registerController();
    }
    // Make sure to update the internal [FormFieldState] value to sync up with
    // text editing controller value.
    setValue(effectiveController.text);
  }

  void _registerController() {
    assert(_controller != null);
    registerForRestoration(_controller!, 'controller');
  }

  void _createLocalController([TextEditingValue? value]) {
    assert(_controller == null);
    _controller = value == null
        ? RestorableTextEditingController()
        : RestorableTextEditingController.fromValue(value);
    if (!restorePending) {
      _registerController();
    }
  }

  @override
  void initState() {
    super.initState();
    if (_textFormField.controller == null) {
      _createLocalController(
          widget.initialValue != null ? TextEditingValue(text: widget.initialValue!) : null);
    } else {
      _textFormField.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(CommonTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_textFormField.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      _textFormField.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && _textFormField.controller == null) {
        _createLocalController(oldWidget.controller!.value);
      }

      if (_textFormField.controller != null) {
        setValue(_textFormField.controller!.text);
        if (oldWidget.controller == null) {
          unregisterFromRestoration(_controller!);
          _controller!.dispose();
          _controller = null;
        }
      }
    }
  }

  @override
  void dispose() {
    _textFormField.controller?.removeListener(_handleControllerChanged);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChange(String? value) {
    super.didChange(value);
    if (_hasFirstTimeValidate) {
      validate();
    }

    if (effectiveController.text != value) {
      effectiveController.text = value ?? '';
    }
  }

  @override
  bool validate() {
    _hasFirstTimeValidate = true;
    return super.validate();
  }

  @override
  void reset() {
    effectiveController.text = widget.initialValue ?? '';
    super.reset();
    _textFormField.onChanged?.call(effectiveController.text);
  }

  void _handleControllerChanged() {
    if (effectiveController.text != value) {
      didChange(effectiveController.text);
    }
  }
}
