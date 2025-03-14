import 'package:flutter/material.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';

class ContainerDecoration extends StatelessWidget {
  const ContainerDecoration(
      {super.key, required this.child, this.width, this.height, this.color, this.padding});
  final Widget child;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: R.color.F2F2F2,
        border: Border.all(
          color: R.color.F2F2F2,
        ),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(60),
        ),
      ),
      child: child,
    );
  }
}
