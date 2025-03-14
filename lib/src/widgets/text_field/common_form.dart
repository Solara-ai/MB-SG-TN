import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/build_context_extension.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/form_field_wrapper.dart';

class CommonForm extends Form {
  const CommonForm({
    required super.child,
    super.key,
    super.onChanged,
    super.onWillPop,
    this.onKeyboaredVisibleChanged,
  }) : super(autovalidateMode: AutovalidateMode.disabled);

  final ValueChanged<bool>? onKeyboaredVisibleChanged;

  @override
  FormState createState() => CommonFormState();
}

class CommonFormState extends FormState {
  final keyboardVisibilityController = KeyboardVisibilityController();
  StreamSubscription<bool>? _keyboardSubscription;

  @override
  void initState() {
    _keyboardSubscription = keyboardVisibilityController.onChange.listen((bool visible) {
      final state = widget;
      if (state is CommonForm) {
        state.onKeyboaredVisibleChanged?.call(visible);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _keyboardSubscription?.cancel();
    super.dispose();
  }

  @override
  bool validate({bool scrollToInvalid = true}) {
    final isValidate = super.validate();
    if (isValidate) {
      FocusScope.of(context).unfocus();
      save();
    } else if (scrollToInvalid) {
      Future.delayed(const Duration(milliseconds: 50), () {
        _scrollToFirstInvalidField();
      });
    }

    return isValidate;
  }

  void _scrollToFirstInvalidField() {
    final formFields = context.findAllDescendantWidgetsOfExactType<FormFieldWrapper>();
    final firstInvalidField = formFields.firstWhereOrNull((field) {
      return field.hasError;
    });

    if (firstInvalidField == null) return;

    final firstInvalidFieldKey = firstInvalidField.key;
    if (firstInvalidFieldKey == null) return;

    final firstInvalidFieldContext = (firstInvalidFieldKey as GlobalKey).currentContext;
    if (firstInvalidFieldContext != null) {
      Scrollable.ensureVisible(
        firstInvalidFieldContext,
        duration: const Duration(milliseconds: 300),
      );
    }
  }
}