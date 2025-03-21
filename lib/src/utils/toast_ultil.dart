
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/string_extension.dart';

class ToastUtils {
  static final _fToast = FToast();

  ToastUtils._();

  static Future<void> showSuccessToast(
    BuildContext context, {
    required String message,
    Color? backgroundColor,
    Color? messageColor,
  }) async {
    await _showToast(
      context,
      message: message,
      backgroundColor: backgroundColor ?? R.color.colorSuccessBase,
      messageColor: messageColor ?? R.color.white,
    );
  }

  static Future<void> showErrorToast(
    BuildContext context, {
    required String message,
    Color? backgroundColor,
    Color? messageColor,
  }) async {
    await _showToast(
      context,
      message: message,
      backgroundColor: backgroundColor ?? R.color.colorErrorBase,
      messageColor: messageColor ?? R.color.white,
    );
  }

  static Future<void> showWarningToast(
    BuildContext context, {
    required String message,
    Color? backgroundColor,
    Color? messageColor,
  }) async {
    await _showToast(
      context,
      message: message,
      backgroundColor: backgroundColor ?? R.color.colorWarningBase,
      messageColor: messageColor ?? R.color.white,
    );
  }

  static Future<void> _showToast(
    BuildContext context, {
    required Color backgroundColor,
    required String message,
    Widget? leading,
    Color? messageColor,
  }) async {
    if (message.isNullOrEmpty()) {
      return;
    }
    final toastWidget = SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(R.dimen.s_12, R.dimen.xs_8, 0, R.dimen.xs_8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(R.dimen.s_12),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (leading != null) ...[
              leading,
              SizedBox(
                width: R.dimen.m_16,
              ),
            ],
            Flexible(
              child: Text(
                message,
                maxLines: 3,
                style: R.textStyle.inter_medium_14_500.copyWith(
                  color: messageColor ?? R.color.colorErrorBase,
                ),
              ),
            ),
            IconButton(
              padding: EdgeInsets.fromLTRB(R.dimen.xxs_4, R.dimen.xxs_4, R.dimen.xs_8, R.dimen.xxs_4),
              constraints: const BoxConstraints(),
              onPressed: () {
                _fToast.removeCustomToast();
              },
              icon: Icon(
                Icons.close,
                size: R.dimen.m_16,
                color: R.color.white,
              ),
            ),
          ],
        ),
      ),
    );
    _fToast
      ..init(context)
      ..removeCustomToast()
      ..showToast(
        child: toastWidget,
        toastDuration: const Duration(seconds: 3),
        gravity: ToastGravity.TOP,
        positionedToastBuilder: (context, child ) {
          return Positioned( top: 8, left: 16, right: 16 , child: child );
        },
      );
  }
}
