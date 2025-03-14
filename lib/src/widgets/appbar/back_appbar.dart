import 'package:flutter/material.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';

AppBar buildBackAppBar({ required BuildContext context , Color ? color , Color ? backGroundColor}) {
  return AppBar(
    backgroundColor: backGroundColor ?? R.color.white,
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: color ?? R.color.text),
      onPressed: () => Navigator.of(context).pop(),
    ),
  );
}
