import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';

class ActionIconAppbar extends StatelessWidget {
  const ActionIconAppbar({super.key , this.paddingRight , required this.iconAsset , this.color , this.iconColor , this.onPressed});
  final double ? paddingRight ;
  final Color ? color;
  final void Function () ? onPressed ;
  final Color ? iconColor ;
  final String iconAsset ; 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: paddingRight ?? R.dimen.l_28),
      child: IconButton(
        color: color,
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        alignment: Alignment.centerRight,
        icon: SvgPicture.asset(iconAsset)
      ),
    );
  }
}
