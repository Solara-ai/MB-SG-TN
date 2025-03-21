import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/gen/assets.gen.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/utils/validator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/widgets/bottom%20sheet/common_bottom_sheet.dart';

import 'common_text_field.dart';
import 'form_field_wrapper.dart';

// thể hiện cho mỗi một item nằm bên trong DropDownFormFiled
abstract class DropDownFormFieldItem {
  final String value;
  final String displayValue;

  DropDownFormFieldItem({required this.value, required this.displayValue});
}

// DropDownFormFieldBottomSheet chính là nơi để build ra dropDownFormFiled thông qua CommonBottomSheet
class DropDownFormFieldBottomSheet extends StatelessWidget {
  const DropDownFormFieldBottomSheet({
    required DropDownFormFieldItem? selectedItem,
    required List<DropDownFormFieldItem> itemList,
    required this.title,
    super.key,
    this.itemBuilder,
  })  : _selectedItem = selectedItem,
        _itemList = itemList;

  final DropDownFormFieldItem? _selectedItem;
  final List<DropDownFormFieldItem> _itemList;
  final String title;
  final Widget Function(BuildContext context, DropDownFormFieldItem item, bool isSelected)?
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    return CommonBottomSheet(
      title: title,
      child: _itemList.isEmpty
          ? const Center(child: Text('No data'))
          : ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemCount: _itemList.length,
              itemBuilder: (context, index) {
                final item = _itemList[index];
                final isSelected = _selectedItem?.value == item.value;

                if (itemBuilder != null) {
                  return itemBuilder?.call(context, item, isSelected);
                }
                return DropdownOptionListTile(item: item, isSelected: isSelected);
              },
              separatorBuilder: (context, index) => const Divider(height: 1),
            ),
    );
  }
}

// thể hiện cho 1 item trong dropDownFormFiled
class DropdownOptionListTile extends StatelessWidget {
  const DropdownOptionListTile({
    required this.item,
    required this.isSelected,
    super.key,
  });

  final DropDownFormFieldItem item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => NavigatorUltils.safePop(context, item),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
                child: Text(
              item.displayValue,
              style: R.textStyle.inter_medium_14_500
                  .copyWith(color: isSelected ? R.color.app_color : R.color.black),
            )),
            if (isSelected)
              SvgPicture.asset(
                Assets.lib.res.drawables.icCheck,
                color: R.color.app_color,
              )
          ],
        ),
      ),
    );
  }
}

class DropdownFormField<T extends DropDownFormFieldItem> extends FormField<T?> {
  DropdownFormField({
    this.controller,
    this.initialItem,
    this.itemList,
    this.onSavedItem,
    this.onChangedItem,
    this.willChangeItem,
    this.customeDisplayValue,
    FocusNode? focusNode,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    MaxLengthEnforcement? maxLengthEnforcement,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    TapRegionCallback? onTapOutside,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldValidator<T>? validator,
    List<TextInputFormatter>? inputFormatters,
    bool enabled = true,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    TextSelectionControls? selectionControls,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    AutovalidateMode? autovalidateMode,
    ScrollController? scrollController,
    super.restorationId,
    bool enableIMEPersonalizedLearning = true,
    TextMagnifierConfiguration? magnifierConfiguration,
    UndoHistoryController? undoController,
    AppPrivateCommandCallback? onAppPrivateCommand,
    ui.BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight,
    ui.BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ContentInsertionConfiguration? contentInsertionConfiguration,
    Clip clipBehavior = Clip.hardEdge,
    bool scribbleEnabled = true,
    String? label,
    TextStyle? labelStyle,
    bool isRequired = false,
    String? hintText,
    TextStyle? hintStyle,
    Widget? prefixIcon,
    BoxConstraints? prefixIconConstraints,
    Widget? suffixIcon,
    BoxConstraints? suffixIconConstraints,
    Widget? labelBuilder,
    Widget? errorBuilder,
    TextStyle? style,
    TextStyle? floatingLabelStyle,
    VoidCallback? onTap,
    this.customSelectionSheetBuilder,
    this.itemBuilder,
  }) : super(
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          enabled: enabled,
          validator: (item) {
            String? result;
            if (isRequired) {
              result = ValidatorUltils.requiredFileValidator(item?.value, fileLabel: label ?? '');
              if (result != null) {
                return result;
              }
            }
            if (validator != null) {
              result = validator(item);
            }

            return result;
          },
          builder: (field) {
            final state = field as _DropdownFormFieldState;
            final effectiveController = state._effectiveController;

            final defaultRequiredLabel = Text.rich(
              style: labelStyle,
              TextSpan(
                  text: label,
                  style: R.textStyle.inter_regular_16_400.copyWith(color: R.color.text)),
            );

            return FormFieldWrapper(
              key: state._key,
              hasError: state.hasError,
              child: CommonTextField(
                restorationId: restorationId,
                controller: state._textEdittingController,
                focusNode: focusNode,
                strutStyle: strutStyle,
                textAlign: textAlign,
                textAlignVertical: textAlignVertical,
                textDirection: textDirection,
                readOnly: true,
                maxLengthEnforcement: maxLengthEnforcement,
                maxLines: maxLines,
                minLines: minLines,
                expands: expands,
                maxLength: maxLength,
                onTap: onTap ??
                    () async {
                      final result = await showModalBottomSheet<T?>(
                        context: state.context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        useSafeArea: true,
                        builder: (context) {
                          return customSelectionSheetBuilder?.call(
                                effectiveController.itemList as List<T>,
                                effectiveController.value as T?,
                              ) ??
                              DropDownFormFieldBottomSheet(
                                selectedItem: effectiveController.value,
                                itemList: effectiveController.itemList,
                                title: label ?? hintText ?? '',
                                itemBuilder: itemBuilder != null
                                    ? (context, item, isSelected) =>
                                        itemBuilder.call(context, item as T, isSelected)
                                    : null,
                              );
                        },
                      );

                      Future.delayed(const Duration(milliseconds: 300),
                          () => FocusScope.of(state.context).unfocus());

                      if (result != null) {
                        final newResult =
                            result.value == effectiveController.value?.value ? null : result;
                        final willChange = await willChangeItem?.call(newResult);
                        if (willChange == false) return;

                        effectiveController.value = newResult;
                      }
                    },
                onTapOutside: onTapOutside,
                onEditingComplete: onEditingComplete,
                onSubmitted: onFieldSubmitted,
                inputFormatters: inputFormatters,
                enabled: enabled,
                scrollPadding: scrollPadding,
                scrollPhysics: scrollPhysics,
                selectionControls: selectionControls,
                buildCounter: buildCounter,
                autofillHints: autofillHints,
                scrollController: scrollController,
                enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
                magnifierConfiguration: magnifierConfiguration,
                undoController: undoController,
                onAppPrivateCommand: onAppPrivateCommand,
                selectionHeightStyle: selectionHeightStyle,
                selectionWidthStyle: selectionWidthStyle,
                dragStartBehavior: dragStartBehavior,
                contentInsertionConfiguration: contentInsertionConfiguration,
                clipBehavior: clipBehavior,
                scribbleEnabled: scribbleEnabled,
                label: label,
                labelStyle: labelStyle,
                labelBuilder: labelBuilder ?? (isRequired ? defaultRequiredLabel : null),
                hintText: hintText,
                hintStyle: hintStyle ??
                    R.textStyle.inter_regular_16_400.copyWith(color: R.color.hint_text),
                isRequired: isRequired,
                prefixIcon: prefixIcon,
                prefixIconConstraints: prefixIconConstraints,
                suffixIconConstraints:
                    suffixIconConstraints ?? const BoxConstraints(maxHeight: 24, maxWidth: 36),
                suffixIcon: suffixIcon ??
                    Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: SvgPicture.asset(Assets.lib.res.drawables.icExpanMore)),
                errorText: state.errorText,
                errorBuilder: errorBuilder,
                style: style,
                floatingLabelStyle: floatingLabelStyle,
              ),
            );
          },
        );

  final T? initialItem;
  final List<T>? itemList;
  final ValueChanged<T?>? onSavedItem;
  final Function(T? item, bool isReset)? onChangedItem;
  final Future<bool> Function(T? item)? willChangeItem;
  final String? Function(T? item)? customeDisplayValue;
  final DropDownController<T>? controller;
  final Widget Function(List<T> itemList, T? selectedItem)? customSelectionSheetBuilder;
  final Widget Function(BuildContext context, T item, bool isSelected)? itemBuilder;

  // This function used to cast item to generic type T
  void _onSavedItem(T? item) {
    onSavedItem?.call(item);
  }

  // This function used to cast item to generic type T
  void _onChangedItem(T? item, bool isReset) {
    onChangedItem?.call(item, isReset);
  }

  // This function used to cast item to generic type T
  String? _toCustomDisplayValue(T? item) {
    return customeDisplayValue?.call(item);
  }

  @override
  FormFieldState<T?> createState() => _DropdownFormFieldState<T>();
}

class _DropdownFormFieldState<T extends DropDownFormFieldItem> extends FormFieldState<T?> {
  final _key = GlobalKey();
  late DropDownController _controller;
  DropdownFormField get _formField => super.widget as DropdownFormField;
  DropDownController get _effectiveController => _formField.controller ?? _controller;
  late final TextEditingController _textEdittingController;
  bool _hasFirstTimeValidate = false;
  bool _didReset = false;

  String? get _effectivDisplayValue =>
      _formField._toCustomDisplayValue(_effectiveController.value) ??
      _effectiveController.value?.displayValue;

  @override
  void initState() {
    super.initState();
    if (_formField.controller == null) {
      _controller = DropDownController(
        initialItem: _formField.initialItem,
        initialItemList: _formField.itemList,
      );
    }
    setValue(_effectiveController.value as T?);
    _textEdittingController = TextEditingController(text: _effectivDisplayValue);
    _effectiveController.addListener(_updateStateChanged);
  }

  @override
  void didUpdateWidget(covariant DropdownFormField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != _formField.controller) {
      oldWidget.controller?.removeListener(_updateStateChanged);
      _effectiveController.addListener(_updateStateChanged);
    }
    if (oldWidget.itemList != _formField.itemList) {
      _effectiveController.itemList = _formField.itemList ?? [];
    }
  }

  @override
  void dispose() {
    super.dispose();
    _effectiveController.removeListener(_updateStateChanged);
  }

  @override
  void reset() {
    _effectiveController.value =
        _formField.controller != null ? _formField.controller?.initialItem : _formField.initialItem;
    _hasFirstTimeValidate = false;
    super.reset();
    _didReset = true;
    didChange(_effectiveController.value as T?);
  }

  @override
  void save() {
    _formField._onSavedItem(_effectiveController.value);
  }

  @override
  bool validate() {
    _hasFirstTimeValidate = true;
    return super.validate();
  }

  @override
  void didChange(T? value) {
    super.didChange(value);
    if (_hasFirstTimeValidate) {
      validate();
    }
    _formField._onChangedItem(value, _didReset);
  }

  void _updateStateChanged() {
    _didReset = false;
    setValue(_effectiveController.value as T?);
    didChange(value);
    _textEdittingController.text = _effectivDisplayValue ?? '';
  }
}

class DropDownController<T extends DropDownFormFieldItem> extends ValueNotifier<T?> {
  DropDownController({
    this.initialItem,
    List<T>? initialItemList,
  })  : itemList = initialItemList ?? [],
        super(initialItem);

  final T? initialItem;
  List<T> itemList;

  void refresh() {
    notifyListeners();
  }
}
