

import 'package:flutter/material.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';

Widget headerDecoration({double? heigt, double? withd , required Widget child}) {
  return Container(
    height: heigt,
    width: withd,
    decoration: BoxDecoration(
      boxShadow: [BoxShadow(
        color: Colors.black.withOpacity(0.5), // Màu của bóng
        spreadRadius: 2,  // Độ lan rộng của bóng
        blurRadius: 7,  // Độ mờ của bóng
       // Dịch chuyển bóng theo trục X và Y
      ),],
      color: R.color.app_color,
      border: Border.all(color: R.color.app_color),
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
    child: child,
  );
}
