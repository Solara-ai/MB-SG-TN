import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';

class AppRoundedButton extends StatelessWidget {
  const AppRoundedButton({
    required this.onPressed,
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.elevation,
    this.backgroundColor,
    this.disableBackgroundColor,
    this.shadowColor,
    this.loadingColor,
    this.isDisable = false,
    this.isLoading = false,
    this.isFullSize = true,
    this.child,
    this.borderSide,
    this.margin = EdgeInsets.zero,
    this.shape,
    this.padding,
  });

  final VoidCallback? onPressed;

  final double? width;
  final double? height;
  final double? borderRadius;
  final double? elevation;

  final Color? backgroundColor;
  final Color? disableBackgroundColor;
  final Color? shadowColor;
  final Color? loadingColor;

  final bool isLoading;
  final bool isDisable;
  final bool isFullSize;

  final Widget? child;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry? padding;
  final BorderSide? borderSide;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: isFullSize
          ? null
          : BoxConstraints(
              maxWidth: width ?? double.infinity,
              maxHeight: height ?? R.dimen.xxl_48,
            ),
      height: isFullSize ? (height ?? R.dimen.xxl_48) : null,
      width: isFullSize ? (width ?? double.infinity) : null,
      margin: margin,
      child: MaterialButton(
        shape: shape ??
            RoundedRectangleBorder(
              side: borderSide ?? BorderSide.none,
              borderRadius: BorderRadius.circular(
                borderRadius ?? R.dimen.xs_8,
              ),
            ),
        elevation: elevation ?? 0,
        padding: padding,
        color: backgroundColor ?? R.color.white,
        onPressed: (isDisable || isLoading) ? null : onPressed,
        disabledColor: disableBackgroundColor ?? R.color.background,
        child: _buildChild(),
      ),
    );
  }

  Widget? _buildChild() {
    if (isLoading) {
      return SizedBox(
        width: 20,
        height: 20,
        child: Platform.isIOS
            ? CupertinoActivityIndicator(
                color: loadingColor ?? R.color.app_color,
              )
            : CircularProgressIndicator(
                strokeWidth: 1.8,
                valueColor: AlwaysStoppedAnimation<Color>(
                  loadingColor ?? R.color.app_color,
                ),
              ),
      );
    }
    return child;
  }
}
