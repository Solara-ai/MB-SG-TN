import 'package:flutter/material.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';

AppBar actionAppbar(
    {required String title, TextStyle? textStyle, final List<Widget>? action, Color? backGroundColor , Widget ? leading}) {
      return AppBar(
        centerTitle: true,
        title: Text(title),
        titleTextStyle: textStyle ?? R.textStyle.inter_semibold_20_600.copyWith(color: R.color.text),
        actions: action,
        backgroundColor: backGroundColor,
        leading: leading,
      );
    }
