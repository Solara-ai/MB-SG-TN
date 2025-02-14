// import 'package:flutter/material.dart';
// import 'package:schedule_gen_and_time_management/res/R.dart';

// class LoadingWidget extends StatelessWidget {
//   const LoadingWidget({
//     Key? key,
//     this.opacity,
//     this.canPop,
//     this.backgroundColor,
//     this.indicatorColor,
//   }) : super(key: key);

//   final double? opacity;
//   final bool? canPop;
//   final Color? backgroundColor;
//   final Color? indicatorColor;

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: canPop ?? true,
//       child: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           ModalBarrier(
//             dismissible: false,
//             color: backgroundColor ?? R.color.black.withOpacity(opacity ?? 0.4),
//           ),
//           Center(
//             child: SpinKitCircle(color: indicatorColor ?? R.color.white),
//           ),
//         ],
//       ),
//     );
//   }
// }
