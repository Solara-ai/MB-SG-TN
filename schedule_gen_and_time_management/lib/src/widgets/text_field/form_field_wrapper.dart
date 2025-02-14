import 'package:flutter/material.dart';

class FormFieldWrapper extends StatefulWidget {
  const FormFieldWrapper({
    required this.child, required this.hasError, super.key,
  });

  final Widget child;
  final bool hasError;

  @override
  State<FormFieldWrapper> createState() => _FormFieldWrapperState();
}

class _FormFieldWrapperState extends State<FormFieldWrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}