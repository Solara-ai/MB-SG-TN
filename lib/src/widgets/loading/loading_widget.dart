import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.opacity,
    this.canPop,
    this.backgroundColor,
    this.indicatorColor,
  });

  final double? opacity;
  final bool? canPop;
  final Color? backgroundColor;
  final Color? indicatorColor;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop ?? true,
      child:Center (
        child: SpinKitFadingCircle(size: 50, color: R.color.white),
      )
    );
  }
}
