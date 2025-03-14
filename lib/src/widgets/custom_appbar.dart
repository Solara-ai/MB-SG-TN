
import 'package:flutter/material.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';

AppBar appBar(
  String title, {
  TextStyle? textStyle,
  final List<Widget>? action,
}) {
  return AppBar(
    backgroundColor: R.color.white,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: R.color.text),
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: textStyle ?? R.textStyle.inter_semibold_18_600.copyWith(color: R.color.text),
    ),
    actions: action,
  );
}

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    required this.title,
    this.onTapBack,
    this.isLeading = true,
    this.centerTitle = true,
    this.action,
    this.backgroundColor,
    this.titleColor,
    this.iconColor,
    super.key,
  });

  final String title;
  final Function()? onTapBack;
  final bool isLeading;
  final List<Widget>? action;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isLeading
          ? BackIconWidget(
              iconColor: iconColor,
              onPressed: onTapBack ?? () => NavigatorUltils.safePop(context),
            )
          : const SizedBox.shrink(),
      backgroundColor: backgroundColor ?? R.color.white,
      iconTheme: IconThemeData(color: R.color.white),
      centerTitle: centerTitle,
      elevation: 0,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: R.textStyle.inter_semibold_18_600.copyWith(
          color: titleColor ?? R.color.text,
        ),
      ),
      actions: action,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class BackIconWidget extends StatelessWidget {
  const BackIconWidget({super.key, this.onPressed, this.iconColor});

  final VoidCallback? onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: R.dimen.m_16),
      child: IconButton(
        color: R.color.text,
        onPressed: onPressed ?? () => Navigator.pop(context),
        padding: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
        icon: Icon(
          Icons.arrow_back_sharp,
          color: iconColor ?? R.color.text,
        ),
      ),
    );
  }
}
