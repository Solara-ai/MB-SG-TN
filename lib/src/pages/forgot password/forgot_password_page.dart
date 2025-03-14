import 'package:flutter/material.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/otp/otp_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/register/register_page.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/utils/validator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/widgets/appbar/back_appbar.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/button_with_icon.dart';
import 'package:schedule_gen_and_time_management/src/widgets/container_decoration.dart';
import 'package:schedule_gen_and_time_management/src/widgets/rich_text.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_form.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_text_form_field.dart';

class ForgotPasswordPage extends BasePage {
  const ForgotPasswordPage({super.key});

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends BaseState<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.app_color,
      appBar: buildBackAppBar(
          context: context, color: R.color.white, backGroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              R.strings.forgot_password2,
              style: R.textStyle.inter_semibold_30_600.copyWith(color: R.color.white),
            ),
            SizedBox(height: 111),
            ContainerDecoration(
                height: 640,
                padding: EdgeInsets.symmetric(horizontal: 33),
                child: _buildforgotPassword(context))
          ],
        ),
      ),
    );
  }
}

Widget _buildforgotPassword(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            R.strings.reset_password,
            style: R.textStyle.inter_semibold_20_600.copyWith(color: R.color.text),
          ),
          SizedBox(height: 2),
          Text(
            R.strings.description_forgot_password,
            style: R.textStyle.inter_medium_14_500.copyWith(color: R.color.text),
          ),
        ],
      ),
      SizedBox(height: 43),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonForm(
            child: CommonTextFormField(
              validator: (value) => ValidatorUltils.validateEmail(value),
              label: R.strings.enter_email_adress,
              isRequired: true,
              hintText: R.strings.example_email,
            ),
          ),
          SizedBox(height: 90),
          _buildButton(context, OtpPage(), R.strings.next_step),
          SizedBox(height: 70),
          _buildButton(context, RegisterPage(), R.strings.sign_up),
          SizedBox(height: 50),
          SizedBox(
            height: 40,
            child: GestureDetector(
                onTap: () {
                  NavigatorUltils.navigatePage(context, RegisterPage());
                },
                child: buildRichtextDefault(
                    mainTitle: R.strings.dont_have_an_account, subtitle: R.strings.sign_up)),
          )
        ],
      )
    ],
  );
}

Widget _buildButton(BuildContext context, Widget widget, String title) {
  return ButtonWithIconWidget(
    onPressed: () {
      NavigatorUltils.navigatePage(context, widget);
    },
    title: title,
    radius: 30,
    width: 169,
  );
}
