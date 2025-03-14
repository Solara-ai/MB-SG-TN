
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';

class ButtonWithIconWidget extends StatelessWidget {
  final String? title;
  final String? iconAsset;
  final Color? iconColor;
  final double? iconSize;
  final bool isEnable;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  final double? radius;
  final double? space;
  final double? height;
  final double? width;
  final bool modeFlatButton;
  final Border? border;
  final EdgeInsets? padding;
  final bool isRightToLeft;
  final double? minSize;

  const ButtonWithIconWidget({
    required this.onPressed,
    super.key,
    this.backgroundColor,
    this.textColor,
    this.title,
    this.titleStyle,
    this.radius = 30,
    this.modeFlatButton = false,
    this.border,
    this.padding,
    this.iconAsset,
    this.iconColor,
    this.space = 12,
    this.height = 48,
    this.width,
    this.isRightToLeft = false,
    this.minSize,
    this.iconSize,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: isEnable ? onPressed : null,
      minSize: minSize ?? kMinInteractiveDimensionCupertino,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        padding: padding,
        decoration: BoxDecoration(
          color: isEnable ? (backgroundColor ?? R.color.colorPrimaryButton) : R.color.black.withAlpha(64),
          borderRadius: BorderRadius.all(Radius.circular(radius ?? R.dimen.s_12)),
          border: border,
        ),
        child: _buildChildren(),
      ),
    );
  }

  Widget _buildChildren() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!isRightToLeft) ...[
          _buildIcon(),
          SizedBox(width: iconAsset == null ? 0 : space),
          _buildTitle(),
        ] else ...[
          _buildTitle(),
          SizedBox(width: iconAsset == null ? 0 : space),
          _buildIcon(),
        ],
      ],
    );
  }

  Widget _buildIcon() {
    if (iconAsset != null) {
      return SvgPicture.asset(
        iconAsset!,
        width: iconSize ?? 16,
        height: iconSize ?? 16,
        fit: BoxFit.cover,
        colorFilter: iconColor != null ? ColorFilter.mode(iconColor!, BlendMode.srcIn) : null,
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildTitle() {
    final textStyle = titleStyle ?? R.textStyle.inter_semibold_14_600;
    if ((title ?? '').isNotEmpty) {
      return Text(
        title ?? '',
        style: textStyle.copyWith(color: textColor ?? Colors.white),
      );
    } else {
      return const SizedBox();
    }
  }
}
