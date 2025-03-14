import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/string_extension.dart';

class OtpWidget extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onCompleted;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final String? errorText;

  const OtpWidget({
    required this.controller,
    required this.onCompleted,
    this.enabled = true,
    this.errorText,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  late final PinTheme _defaultTheme;
  late final PinTheme _focusedTheme;
  late final PinTheme _disabledTheme;

  @override
  void initState() {
    _setup();
    super.initState();
  }

  void _setup() {
    // Otp Theme
    _defaultTheme = PinTheme(
      width: 46,
      height: 46,
      textStyle: R.textStyle.inter_regular_16_400.copyWith(color: R.color.text),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: R.color.text),
      ),
    );
    _focusedTheme = _defaultTheme.copyDecorationWith(
      border: Border.all(color: R.color.app_color),
    );
    _disabledTheme = _defaultTheme.copyDecorationWith(
      color: R.color.text.withAlpha(120),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Pinput(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      enabled: widget.enabled,
      controller: widget.controller,
      length: 6,
      defaultPinTheme: _defaultTheme,
      focusedPinTheme: _focusedTheme,
      disabledPinTheme: _disabledTheme,
      autofocus: true,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      validator: widget.validator,
      onCompleted: widget.onCompleted,
      errorText: widget.errorText,
      forceErrorState: !widget.errorText.isNullOrEmpty(),
    );
  }
}
