import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/gen/assets.gen.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/home/home_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/main/base_scaffold_page.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';

class ChangePasswordSuccessPage extends BasePage {
  const ChangePasswordSuccessPage({super.key});
  @override
  _ChangePasswordSuccessState createState() => _ChangePasswordSuccessState();
}

class _ChangePasswordSuccessState extends BaseState<ChangePasswordSuccessPage> {
  @override
  void initState() {
    _setup();
    super.initState();
  }

  void _setup() {
    Future.delayed(const Duration(seconds: 3), () {
      NavigatorUltils.pushAndRemoveUntilPage(context, HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.app_color,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 87),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.lib.res.drawables.icSuccess),
            SizedBox(height: 58),
            Text(
              R.strings.password_change_success,
              textAlign: TextAlign.center,
              style: R.textStyle.inter_semibold_20_600.copyWith(color: R.color.white),
            )
          ],
        ),
      ),
    );
  }
}
