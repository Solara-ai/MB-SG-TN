import 'package:flutter/material.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';

class CommonBottomSheet extends StatelessWidget {
  const CommonBottomSheet({
    required this.child,
    required this.title,
    super.key,
    this.sheetBottomAction,
  });

  final String title;
  final Widget child;
  final Widget? sheetBottomAction;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),
    );

    return Container(
      decoration: BoxDecoration(color: R.color.white, borderRadius: borderRadius),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // mainAxisSize : MainAxisSize.min , được sử dụng để cho column biết rằng nó không nên mở rộng tối đa , mà chỉ chiếm đúng với các Widget con ở bên trong .
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: R.color.white,
            shape: const RoundedRectangleBorder(borderRadius: borderRadius),
            title: Text(title, style: R.textStyle.inter_medium_14_500.copyWith(color: R.color.black)),
            elevation: 0.5,
            centerTitle: true,
            toolbarHeight: 48,
            actions: [
              FilledButton(
                onPressed: () => NavigatorUltils.safePop(context),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(R.color.transparent),
                  minimumSize: WidgetStateProperty.all(const Size(48, 48)),
                ),
                child: Icon(Icons.close , color: R.color.text,)
              ),
            ],
          ),
          Flexible(child: child),
          sheetBottomAction ?? const SizedBox(),
        ],
      ),
    );
  }
}
