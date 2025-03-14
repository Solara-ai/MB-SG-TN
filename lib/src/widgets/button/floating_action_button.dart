import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';

FloatingActionButton buildFloatingButton(
    {required BuildContext context, void Function()? onPressed}) {
  return FloatingActionButton(
    onPressed: onPressed ,
    backgroundColor: R.color.app_color,
    shape: CircleBorder(),
    child: SvgPicture.asset(
      R.drawables.ic_add,
      width: 30,
      height: 30,
    ),
  );
}
