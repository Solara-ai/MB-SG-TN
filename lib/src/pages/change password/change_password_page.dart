import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/gen/assets.gen.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/change%20password%20success/change_password_success_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/change%20password/change_password_bloc.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/utils/validator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/widgets/appbar/back_appbar.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/button_with_icon.dart';
import 'package:schedule_gen_and_time_management/src/widgets/container_decoration.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_form.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_text_form_field.dart';

class ChangePasswordPage extends BasePage {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends BaseState<ChangePasswordPage> {
  late ChangePasswordBloc _bloc;

  @override
  void initState() {
    setupBloc();
    super.initState();
  }

  void setupBloc() {
    _bloc = ChangePasswordBloc();
    _bloc.listenAction(cancelSubOnDispose, (PageAction action) async {
        switch (action) {
          case ActionChangePasswordSuccess() :
          NavigatorUltils.navigatePage(context, ChangePasswordSuccessPage());
          case ActionChangePasswordFailed() :
        }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, PageState>(
      bloc: _bloc,
      builder: (context, state) {
        return Scaffold(
          appBar: buildBackAppBar(
              context: context, color: R.color.white, backGroundColor: Colors.transparent),
          backgroundColor: R.color.app_color,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(R.strings.new_password,
                    style: R.textStyle.inter_semibold_30_600.copyWith(color: R.color.white)),
                SizedBox(height: 90),
                ContainerDecoration(
                  padding: EdgeInsets.symmetric(horizontal: 36),
                  height: 636,
                  child: _buildForgotPassword(state),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildForgotPassword(PageState state) {
    return CommonForm(
      key: _formkey,
      child: Column(
        children: [
          SizedBox(
            height: 79,
          ),
          CommonTextFormField(
            validator: (value) => ValidatorUltils.validatePassword(value),
            obscureText: state.dontShowNewPassword,
            isRequired: true,
            label: R.strings.new_password,
            suffixIcon: GestureDetector(
                onTap: () => _showNewPassWord(), child: _iconShowNewPassword(state)),
          ),
          SizedBox(
            height: 45,
          ),
          CommonTextFormField(
            validator: (value) => ValidatorUltils.validatePassword(value),
            obscureText: state.dontShowConfirmNewPassword,
            isRequired: true,
            label: R.strings.confirm_new_password,
            suffixIcon: GestureDetector(
              onTap: () => _showConfirmNewPassWord(),
              child: _iconShowConfirmNewPassword(state),
            ),
          ),
          SizedBox(
            height: 136,
          ),
          ButtonWithIconWidget(
            radius: 30,
            onPressed: () {
              _onChangePassword();
            },
            title: R.strings.change_password,
          )
        ],
      ),
    );
  }

  Widget _iconShowNewPassword(PageState state) {
    return state.dontShowNewPassword
        ? Container(
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              Assets.lib.res.drawables.icNotSeePassword,
            ))
        : Container(
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              Assets.lib.res.drawables.icSeePassword,
            ),
          );
  }

  Widget _iconShowConfirmNewPassword(PageState state) {
    return state.dontShowConfirmNewPassword
        ? Container(
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              Assets.lib.res.drawables.icNotSeePassword,
            ))
        : Container(
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              Assets.lib.res.drawables.icSeePassword,
            ));
  }

  void _showNewPassWord() {
    _bloc.add(EventShowNewPassword());
  }

  void _showConfirmNewPassWord() {
    _bloc.add(EventShowConfirmNewPassword());
  }

  void _onChangePassword() {
    if (_formkey.currentState?.validate() ?? false) {
      _formkey.currentState?.save();
      _bloc.add(EventChangePassword());
    }
  }
}
