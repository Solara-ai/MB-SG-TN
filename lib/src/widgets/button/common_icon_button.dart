
import 'package:flutter/widgets.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/button_with_icon.dart';

class CommonIconButton extends StatelessWidget {
  const CommonIconButton({
    required this.iconAsset,
    super.key,
    this.backgroundColor,
    this.size,
    this.onPressed,
    this.iconSize,
    this.radius,
  });

  final Color? backgroundColor;
  final double? size;
  final void Function()? onPressed;
  final String iconAsset;
  final double? iconSize;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    final size = this.size ?? 40;
    final iconSize = this.iconSize ?? 20;
    return ButtonWithIconWidget(
      radius: radius ?? 0,
      height: size,
      width: size,
      padding: EdgeInsets.all((size - iconSize) / 2),
      space: 0,
      iconSize: iconSize,
      backgroundColor: backgroundColor,
      onPressed: onPressed,
      iconAsset: iconAsset,
    );
  }
}
