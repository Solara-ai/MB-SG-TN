import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/change%20password%20success/change_password_success_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/change%20password/change_password_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/otp/widget/otp_widget.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/string_extension.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/button_with_icon.dart';
import 'package:schedule_gen_and_time_management/src/widgets/container_decoration.dart';

class OtpPage extends BasePage {
  @override
  _StateOtpPage createState() => _StateOtpPage();
}

class _StateOtpPage extends BaseState<BasePage> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didpop, result) {
        if (!didpop) {
          SystemNavigator.pop();
        }
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: R.color.app_color,
            body: Column(
              children: [
                SizedBox(
                  height: 112,
                ),
                Text(
                  R.strings.verify_otp,
                  style: R.textStyle.inter_semibold_30_600.copyWith(color: R.color.white),
                ),
                SizedBox(
                  height: 106,
                ),
                Expanded(
                  child: ContainerDecoration(
                    child: _buildOtp(controller , context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildOtp(TextEditingController controller, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 63),
    padding: EdgeInsets.symmetric(horizontal: 39),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          R.strings.enter_verify_otp,
          style: R.textStyle.inter_semibold_20_600.copyWith(color: R.color.text),
        ),
        SizedBox(height: 10),
        Text(
          R.strings.description_enter_otp,
          style: R.textStyle.inter_medium_14_500.copyWith(color: R.color.text),
        ),
        SizedBox(
          height: 47,
        ),
        OtpWidget(
          controller: controller,
          validator: (value) {
            return value.isNullOrEmpty() ? R.strings.please_enter_otp : null;
          },
          onCompleted: (value) => {},
        ),
        SizedBox(
          height: 124,
        ),
        ButtonWithIconWidget(
          onPressed: () {
            NavigatorUltils.pushAndRemoveUntilPage(context, ChangePasswordPage());
          },
          title: R.strings.accept,
          radius: 30,
          backgroundColor: R.color.app_color,
        ),
        SizedBox(
          height: 50,
        ),
        ButtonWithIconWidget(
          onPressed: () {},
          title: R.strings.send_again,
          radius: 30,
          backgroundColor: R.color.app_color,
        ),
      ],
    ),
  );
}
