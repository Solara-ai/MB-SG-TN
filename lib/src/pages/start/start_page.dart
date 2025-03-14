import 'package:flutter/material.dart';
import 'package:schedule_gen_and_time_management/gen/assets.gen.dart';

import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/forgot%20password/forgot_password_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/login/login_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/register/register_page.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/button_with_icon.dart';

class StartPage extends BasePage {
  const StartPage({super.key});

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends BaseState<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.background_light,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 37),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.lib.res.drawables.imgLogoLogin.path),
            SizedBox(
              height: 23,
            ),
            _buildButton(
              context: context,
              color: R.color.textLight,
              title: R.strings.login,
              widget: LoginPage(),
            ),
            SizedBox(
              height: 23,
            ),
            _buildButton(
              context: context,
              color: R.color.white,
              title: R.strings.sign_up,
              widget: RegisterPage(),
            ),
            SizedBox(
              height: 27,
            ),
            SizedBox(
              height: 40,
              child: GestureDetector(
                child: Text(
                  R.strings.forgot_password,
                  style: R.textStyle.inter_semibold_14_600.copyWith(color: R.color.SP363130),
                ),
                onTap: () => NavigatorUltils.navigatePage(context, ForgotPasswordPage()),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String title,
    required Color color,
    required Widget widget,
  }) {
    return ButtonWithIconWidget(
      radius: 30,
      height: 45,
      backgroundColor: R.color.colorPrimaryButton,
      onPressed: () {
        NavigatorUltils.navigatePage(context, widget);
      },
      title: title,
      titleStyle: R.textStyle.inter_semibold_20_600,
      textColor: color,
    );
  }
}
