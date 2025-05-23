import 'package:flutter/material.dart';
import 'package:schedule_gen_and_time_management/src/widgets/loading/loading_widget.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    required this.isLoading,
    required this.child,
    Key? key,
    this.canPop = false,
    this.loadingWidget,
  }) : super(key: key);

  final bool isLoading;
  final Widget child;
  final bool? canPop;
  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        if (isLoading) ...[
          // Lớp overlay tối màu
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3), // Màu nền tối hơn một chút
            ),
          ),
          loadingWidget ?? LoadingWidget(canPop: canPop),
        ],
      ],
    );
  }
}
